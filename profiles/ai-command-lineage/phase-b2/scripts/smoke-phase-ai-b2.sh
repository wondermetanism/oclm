#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MODEL="$ROOT/model/tamarin/oclm_ai_b2_delegation_lineage.spthy"
LOG="$ROOT/results/SMOKE_executable_two_hop_delegation_to_execution.txt"
TIMEOUT_SECONDS=180

python3 - "$MODEL" "$LOG" "$TIMEOUT_SECONDS" <<'PY'
import os
from pathlib import Path
import signal
import subprocess
import sys

model = sys.argv[1]
log_path = Path(sys.argv[2])
timeout = int(sys.argv[3])

lemma = "executable_two_hop_delegation_to_execution"

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

        print(f"AI_B2_SMOKE_TIMEOUT_AFTER_{timeout}_SECONDS")
        raise SystemExit(124)

if rc != 0:
    text = log_path.read_text(
        encoding="utf-8",
        errors="replace",
    )
    print(f"AI_B2_TAMARIN_EXIT_{rc}")
    print("\n".join(text.splitlines()[-100:]))
    raise SystemExit(rc)

text = log_path.read_text(
    encoding="utf-8",
    errors="replace",
)

verified = any(
    lemma in line and "verified" in line
    for line in text.splitlines()
)

if not verified:
    print("AI_B2_SMOKE_NOT_VERIFIED")
    print("\n".join(text.splitlines()[-100:]))
    raise SystemExit(1)

print("AI_B2_SMOKE_VERIFIED")
PY
