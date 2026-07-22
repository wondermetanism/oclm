#!/usr/bin/env bash
set -euo pipefail

BASE="profiles/ai-command-lineage/phase-b3"
MODEL="$BASE/model/tamarin/oclm_ai_b3_emergency_stop_core.spthy"
RESULTS="$BASE/results/emergency"

EXPECTED_SHA="6424cd2a485e49fe506b8fedc619f7f2201617a3f4b1be665ca7efb05e6affcf"

ACTUAL_SHA="$(shasum -a 256 "$MODEL" | awk '{print $1}')"

test "$ACTUAL_SHA" = "$EXPECTED_SHA" || {
  echo "MODEL_SHA_MISMATCH"
  echo "expected: $EXPECTED_SHA"
  echo "actual:   $ACTUAL_SHA"
  exit 1
}

STAMP="$(date -u +%Y%m%dT%H%M%SZ)"
RUN="$RESULTS/run-$STAMP"

mkdir -p "$RUN"

python3 - "$MODEL" "$RUN" <<'PYRUN'
import hashlib
import os
from pathlib import Path
import signal
import subprocess
import sys

model = sys.argv[1]
run = Path(sys.argv[2])

lemmas = [
    "executable_honest_current_epoch_action",
    "emergency_stop_after_certificate_is_reachable",
    "compromised_leaf_can_be_stopped",
    "stopped_command_can_restart_only_under_new_epoch",
    "emergency_stop_blocks_later_execution",
    "certified_stop_blocks_issued_certificate_execution",
    "restart_requires_prior_emergency_stop",
    "stale_certificate_cannot_execute_after_restart",
    "action_certificate_requires_authority_authorized_action",
    "compromised_leaf_certificate_still_requires_authorized_action",
    "execution_requires_verifier_action_certificate",
    "action_certificate_single_use_under_compromise",
    "restarted_epoch_can_execute_fresh_certificate",
    "action_certificate_cannot_cross_epoch",
]

verified = []

for lemma in lemmas:
    log_path = run / f"{lemma}.txt"

    print("=" * 72)
    print(f"PROVING: {lemma}")
    print("=" * 72)

    with log_path.open("w", encoding="utf-8") as log:
        proc = subprocess.Popen(
            [
                "tamarin-prover",
                model,
                f"--prove={lemma}",
            ],
            stdout=log,
            stderr=subprocess.STDOUT,
            start_new_session=True,
            text=True,
        )

        try:
            rc = proc.wait(timeout=180)

        except subprocess.TimeoutExpired:
            os.killpg(proc.pid, signal.SIGTERM)

            try:
                proc.wait(timeout=5)
            except subprocess.TimeoutExpired:
                os.killpg(proc.pid, signal.SIGKILL)
                proc.wait()

            result = log_path.read_text(
                encoding="utf-8",
                errors="replace",
            )

            print(
                "\n".join(
                    result.splitlines()[-120:]
                )
            )

            raise SystemExit(
                f"TIMEOUT: {lemma}"
            )

    result = log_path.read_text(
        encoding="utf-8",
        errors="replace",
    )

    if rc != 0:
        print(
            "\n".join(
                result.splitlines()[-120:]
            )
        )
        raise SystemExit(
            f"TAMARIN_EXIT_{rc}: {lemma}"
        )

    if (
        "WARNING: the following wellformedness checks failed"
        in result
    ):
        print(
            "\n".join(
                line
                for line in result.splitlines()
                if (
                    "WARNING:" in line
                    or "Derivation Checks" in line
                    or "timed out" in line
                )
            )
        )

        raise SystemExit(
            f"WELLFORMEDNESS_FAILURE: {lemma}"
        )

    matches = [
        line.strip()
        for line in result.splitlines()
        if (
            f"{lemma} (" in line
            and ": verified (" in line
        )
    ]

    if len(matches) != 1:
        print(
            "\n".join(
                result.splitlines()[-120:]
            )
        )
        raise SystemExit(
            f"NOT_VERIFIED: {lemma}"
        )

    verified.append(matches[0])

    print(matches[0])
    print(f"PASS: {lemma}")

sha = hashlib.sha256(
    Path(model).read_bytes()
).hexdigest()

summary = run / "VERIFICATION_SUMMARY.txt"

summary.write_text(
    "\n".join([
        "OCLM AI Command Lineage Phase AI-B3 — Emergency Stop",
        f"Model SHA-256: {sha}",
        "Tamarin: 1.12.0",
        "Maude: 3.5.1",
        "Per-lemma timeout: 180s",
        "",
        *[
            line.split(" (", 1)[0] + " — VERIFIED"
            for line in verified
        ],
        "",
        "Verified lemma count: 14/14",
        "",
        "OCLM_AI_B3_EMERGENCY_14_OF_14_VERIFIED",
        "",
    ]),
    encoding="utf-8",
)

print()
print("=== VERIFICATION SUMMARY ===")
print(summary.read_text(encoding="utf-8"))
PYRUN

cp \
  "$RUN/VERIFICATION_SUMMARY.txt" \
  "$RESULTS/LATEST_VERIFICATION_SUMMARY.txt"

echo "OCLM_AI_B3_EMERGENCY_VERIFICATION_COMPLETE"
