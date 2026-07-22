#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MODEL="$ROOT/model/tamarin/oclm_ai_b1_command_lineage_core.spthy"

EXPECTED_TAMARIN_VERSION="1.12.0"
EXPECTED_MAUDE_VERSION="3.5.1"
TIMEOUT_SECONDS=180

fail() {
  echo "FAIL: $*" >&2
  exit 1
}

pass() {
  echo "PASS: $*"
}

command -v tamarin-prover >/dev/null 2>&1 \
  || fail "tamarin-prover not found"

command -v maude >/dev/null 2>&1 \
  || fail "maude not found"

test -s "$MODEL" \
  || fail "model missing: $MODEL"

tamarin_version_output="$(
  tamarin-prover --version 2>&1 || true
)"

maude_version_output="$(
  maude --version 2>&1 || true
)"

if [[ "$tamarin_version_output" != *"$EXPECTED_TAMARIN_VERSION"* ]]; then
  echo "=== ACTUAL TAMARIN VERSION OUTPUT ===" >&2
  printf '%s\n' "$tamarin_version_output" >&2
  fail "unexpected Tamarin version"
fi

if [[ "$maude_version_output" != *"$EXPECTED_MAUDE_VERSION"* ]]; then
  echo "=== ACTUAL MAUDE VERSION OUTPUT ===" >&2
  printf '%s\n' "$maude_version_output" >&2
  fail "unexpected Maude version"
fi

pass "Tamarin $EXPECTED_TAMARIN_VERSION"
pass "Maude $EXPECTED_MAUDE_VERSION"

lemmas=(
  "executable_honest_command_to_execution"
  "executable_honest_command_revocation"
  "accepted_execution_requires_complete_command_lineage"
  "action_certificate_is_exactly_scope_bound"
  "action_certificate_is_agent_bound"
  "action_certificate_is_single_use"
  "revoked_command_cannot_execute_later"
  "accepted_execution_requires_gateway_certified_state"
  "receipt_requires_exact_accepted_execution"
)

timestamp="$(date -u +%Y%m%dT%H%M%SZ)"
run_dir="$ROOT/results/run-$timestamp"
summary="$run_dir/VERIFICATION_SUMMARY.txt"

mkdir -p "$run_dir"

model_hash="$(
  shasum -a 256 "$MODEL" | awk '{print $1}'
)"

{
  echo "OCLM AI Command Lineage Phase AI-B1"
  echo "Generated UTC: $timestamp"
  echo "Model SHA-256: $model_hash"
  echo "Tamarin: $EXPECTED_TAMARIN_VERSION"
  echo "Maude: $EXPECTED_MAUDE_VERSION"
  echo "Per-lemma timeout: ${TIMEOUT_SECONDS}s"
  echo
} > "$summary"

verified=0

for lemma in "${lemmas[@]}"; do
  log="$run_dir/${lemma}.txt"

  echo "========================================"
  echo "PROVING: $lemma"
  echo "========================================"

  python3 - \
    "$MODEL" \
    "$lemma" \
    "$log" \
    "$TIMEOUT_SECONDS" <<'PY'
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

        print(f"TIMEOUT: {lemma} after {timeout}s")
        raise SystemExit(124)

if rc != 0:
    print(f"TAMARIN_EXIT_{rc}: {lemma}")
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
    print(f"NOT_VERIFIED: {lemma}")
    print("\n".join(text.splitlines()[-80:]))
    raise SystemExit(1)

print(f"VERIFIED: {lemma}")
PY

  grep -E \
    "${lemma}|verified|falsified|analysis incomplete|WARNING|error" \
    "$log" \
    | tail -n 20 || true

  echo "$lemma — VERIFIED" >> "$summary"

  verified=$((verified + 1))
  pass "$lemma"
done

echo >> "$summary"
echo "Verified lemma count: $verified/9" >> "$summary"

test "$verified" -eq 9 \
  || fail "expected 9/9 verified lemmas"

cp "$summary" \
  "$ROOT/results/LATEST_VERIFICATION_SUMMARY.txt"

echo
echo "=== MODEL SHA-256 ==="
echo "$model_hash"

echo
echo "=== VERIFICATION SUMMARY ==="
cat "$summary"

echo
echo "OCLM_AI_B1_9_OF_9_VERIFIED"
