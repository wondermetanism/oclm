#!/usr/bin/env bash
set -euo pipefail

BASE="profiles/ai-command-lineage/phase-b3"
MODEL="$BASE/model/tamarin/oclm_ai_b3_subtree_recovery_core.spthy"
RESULTS="$BASE/results/recovery"

EXPECTED_SHA="5cab36db352b597ade8ed49692f541e131dd409e327467bae0408aa393857aba"

ACTUAL_SHA="$(
  shasum -a 256 "$MODEL" | awk '{print $1}'
)"

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
    "compromised_revoked_subtree_can_be_replaced_and_execute",
    "replacement_requires_prior_matching_revocation",
    "replacement_uses_fresh_agent_identities",
    "fresh_certificate_requires_authority_reauthorization",
    "replacement_execution_requires_fresh_verifier_certificate",
    "old_certificate_cannot_cross_into_replacement_lineage",
    "replacement_is_single_use_per_revoked_subtree",
]

verified = []

for lemma in lemmas:
    log_path = run / f"{lemma}.txt"

    print("=" * 72)
    print(f"PROVING: {lemma}")
    print("=" * 72)

    with log_path.open(
        "w",
        encoding="utf-8",
    ) as log:
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
            os.killpg(
                proc.pid,
                signal.SIGTERM,
            )

            try:
                proc.wait(timeout=5)

            except subprocess.TimeoutExpired:
                os.killpg(
                    proc.pid,
                    signal.SIGKILL,
                )
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

    verified.append(
        matches[0]
    )

    print(matches[0])
    print(f"PASS: {lemma}")

sha = hashlib.sha256(
    Path(model).read_bytes()
).hexdigest()

summary = run / "VERIFICATION_SUMMARY.txt"

summary.write_text(
    "\n".join([
        "OCLM AI Command Lineage Phase AI-B3 — Subtree Recovery",
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
        "Verified lemma count: 7/7",
        "",
        "OCLM_AI_B3_RECOVERY_7_OF_7_VERIFIED",
        "",
    ]),
    encoding="utf-8",
)

print()
print("=== VERIFICATION SUMMARY ===")
print(
    summary.read_text(
        encoding="utf-8"
    )
)
PYRUN

cp \
  "$RUN/VERIFICATION_SUMMARY.txt" \
  "$RESULTS/LATEST_VERIFICATION_SUMMARY.txt"

echo "OCLM_AI_B3_RECOVERY_VERIFICATION_COMPLETE"
