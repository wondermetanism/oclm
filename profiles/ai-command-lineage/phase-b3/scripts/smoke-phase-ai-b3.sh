#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MODEL="$ROOT/model/tamarin/oclm_ai_b3_revocation_compromise_core.spthy"
TIMEOUT_SECONDS=180

lemmas=(
  "executable_honest_current_epoch_action"
  "emergency_stop_after_certificate_is_reachable"
  "compromised_leaf_can_be_stopped"
  "stopped_command_can_restart_only_under_new_epoch"
)

timestamp="$(date -u +%Y%m%dT%H%M%SZ)"
run_dir="$ROOT/results/smoke-$timestamp"
mkdir -p "$run_dir"

for lemma in "${lemmas[@]}"; do
  log="$run_dir/${lemma}.txt"

  echo "========================================"
  echo "SMOKE: $lemma"
  echo "========================================"

  python3 - "$MODEL" "$lemma" "$log" "$TIMEOUT_SECONDS" <<'PY'
import os
from pathlib import Path
import signal
import subprocess
import sys

model = sys.argv[1]
lemma = sys.argv[2]
log_path = Path(sys.argv[3])
timeout = int(sys.argv[4])

cmd = [
    "tamarin-prover",
    model,
    f"--prove={lemma}",
]

with log_path.open("w", encoding="utf-8") as log:
    proc = subprocess.Popen(
        cmd,
        stdout=log,
        stderr=subprocess.STDOUT,
        start_new_session=True,
        text=True,
    )

    try:
        rc = proc.wait(timeout=timeout)

    except subprocess.TimeoutExpired:
        os.killpg(proc.pid, signal.SIGTERM)

        try:
            proc.wait(timeout=5)
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid, signal.SIGKILL)
            proc.wait()

        print(f"TIMEOUT: {lemma}")
        raise SystemExit(124)

text = log_path.read_text(
    encoding="utf-8",
    errors="replace",
)

if rc != 0:
    print(f"TAMARIN_EXIT_{rc}: {lemma}")
    print("\n".join(text.splitlines()[-100:]))
    raise SystemExit(rc)

if "WARNING:" in text:
    print(f"WELLFORMEDNESS_WARNING: {lemma}")
    for line in text.splitlines():
        if (
            "WARNING:" in line
            or "wellformedness" in line.lower()
        ):
            print(line)
    raise SystemExit(1)

needle = f"{lemma} ("

verified = [
    line.strip()
    for line in text.splitlines()
    if needle in line and ": verified (" in line
]

if not verified:
    print(f"NOT_VERIFIED: {lemma}")
    print("\n".join(text.splitlines()[-100:]))
    raise SystemExit(1)

print(f"VERIFIED: {lemma}")
for line in verified:
    print(line)
PY

done

echo "AI_B3_4_OF_4_SMOKE_VERIFIED"
