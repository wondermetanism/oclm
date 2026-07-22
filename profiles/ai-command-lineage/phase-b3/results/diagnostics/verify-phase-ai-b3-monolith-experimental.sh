#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MODEL="$ROOT/model/tamarin/oclm_ai_b3_revocation_compromise_core.spthy"

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

tamarin_version_output="$(
  tamarin-prover --version 2>&1 || true
)"

maude_version_output="$(
  maude --version 2>&1 || true
)"

[[ "$tamarin_version_output" == *"$EXPECTED_TAMARIN_VERSION"* ]] \
  || fail "unexpected Tamarin version"

[[ "$maude_version_output" == *"$EXPECTED_MAUDE_VERSION"* ]] \
  || fail "unexpected Maude version"

pass "Tamarin $EXPECTED_TAMARIN_VERSION"
pass "Maude $EXPECTED_MAUDE_VERSION"

lemmas=(
  "executable_honest_current_epoch_action"
  "emergency_stop_after_certificate_is_reachable"
  "compromised_leaf_can_be_stopped"
  "stopped_command_can_restart_only_under_new_epoch"
  "emergency_stop_blocks_later_execution"
  "certified_stop_blocks_issued_certificate_execution"
  "restart_requires_prior_emergency_stop"
  "stale_certificate_cannot_execute_after_restart"
  "action_certificate_requires_authority_authorized_action"
  "compromised_leaf_certificate_still_requires_authorized_action"
  "execution_requires_verifier_action_certificate"
  "action_certificate_single_use_under_compromise"
  "restarted_epoch_can_execute_fresh_certificate"
  "action_certificate_cannot_cross_epoch"
  "compromised_intermediate_subtree_revocation_is_reachable"
  "certified_subtree_revocation_is_reachable"
  "revoked_subtree_blocks_future_leaf_execution"
  "issued_certificate_dies_after_subtree_revocation"
)

EXPECTED_COUNT=18

test "${#lemmas[@]}" -eq "$EXPECTED_COUNT" \
  || fail "expected $EXPECTED_COUNT lemmas"

timestamp="$(date -u +%Y%m%dT%H%M%SZ)"
run_dir="$ROOT/results/run-$timestamp"
summary="$run_dir/VERIFICATION_SUMMARY.txt"

mkdir -p "$run_dir"

model_hash="$(
  shasum -a 256 "$MODEL" | awk '{print $1}'
)"

{
  echo "OCLM AI Command Lineage Phase AI-B3"
  echo "Generated UTC: $timestamp"
  echo "Model SHA-256: $model_hash"
  echo "Tamarin: $EXPECTED_TAMARIN_VERSION"
  echo "Maude: $EXPECTED_MAUDE_VERSION"
  echo "Per-lemma timeout: ${TIMEOUT_SECONDS}s"
  echo
} > "$summary"

verified_count=0

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

text = log_path.read_text(
    encoding="utf-8",
    errors="replace",
)

if rc != 0:
    print(f"TAMARIN_EXIT_{rc}: {lemma}")
    print("\n".join(text.splitlines()[-120:]))
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

verified_lines = [
    line.strip()
    for line in text.splitlines()
    if needle in line and ": verified (" in line
]

if not verified_lines:
    print(f"NOT_VERIFIED: {lemma}")
    print("\n".join(text.splitlines()[-120:]))
    raise SystemExit(1)

print(f"VERIFIED: {lemma}")

for line in verified_lines:
    print(line)
PY

  echo "$lemma — VERIFIED" >> "$summary"
  verified_count=$((verified_count + 1))

  pass "$lemma"
done

echo >> "$summary"
echo \
  "Verified lemma count: $verified_count/$EXPECTED_COUNT" \
  >> "$summary"

test "$verified_count" -eq "$EXPECTED_COUNT" \
  || fail "expected $EXPECTED_COUNT/$EXPECTED_COUNT verified"

cp "$summary" \
  "$ROOT/results/LATEST_VERIFICATION_SUMMARY.txt"

echo
echo "=== MODEL SHA-256 ==="
echo "$model_hash"

echo
echo "=== VERIFICATION SUMMARY ==="
cat "$summary"

echo
echo "OCLM_AI_B3_18_OF_18_VERIFIED"
