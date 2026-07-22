#!/usr/bin/env bash
set -euo pipefail

BASE="profiles/ai-command-lineage/phase-b3"

EMERGENCY="$BASE/model/tamarin/oclm_ai_b3_emergency_stop_core.spthy"
SUBTREE="$BASE/model/tamarin/oclm_ai_b3_subtree_revocation_core.spthy"
RECOVERY="$BASE/model/tamarin/oclm_ai_b3_subtree_recovery_core.spthy"

EMERGENCY_SHA="6424cd2a485e49fe506b8fedc619f7f2201617a3f4b1be665ca7efb05e6affcf"
SUBTREE_SHA="cc3bd2e5b4344aa86b709ee4bf4ad314c42d13dd78fbf72129d5487922f27964"
RECOVERY_SHA="5cab36db352b597ade8ed49692f541e131dd409e327467bae0408aa393857aba"
MONOLITH_SHA="6010ca962d388bf709c8723809036fec222752e4d062a4e861bdaf2f17d81c33"

DIAG="$BASE/results/diagnostics/oclm_ai_b3_monolith_experimental_6010ca962d388bf7.spthy"

echo "=== TOOLCHAIN ==="

TAMARIN_RAW="$(
  tamarin-prover --version 2>&1 || true
)"

MAUDE_RAW="$(
  maude --version 2>&1 || true
)"

TAMARIN_VERSION="${TAMARIN_RAW%%$'\\n'*}"
MAUDE_VERSION="${MAUDE_RAW%%$'\\n'*}"

printf '%s\n' "$TAMARIN_VERSION"
printf '%s\n' "$MAUDE_VERSION"

case "$TAMARIN_RAW" in
  *"1.12.0"*)
    echo "TAMARIN_VERSION_PASS"
    ;;
  *)
    echo "TAMARIN_VERSION_FAIL"
    printf '%s\n' "$TAMARIN_RAW"
    exit 1
    ;;
esac

case "$MAUDE_RAW" in
  *"3.5.1"*)
    echo "MAUDE_VERSION_PASS"
    ;;
  *)
    echo "MAUDE_VERSION_FAIL"
    printf '%s\n' "$MAUDE_RAW"
    exit 1
    ;;
esac

echo "=== VERSION ==="

test "$(
  tr -d '\r\n' < "$BASE/VERSION"
)" = "0.4.0-ai-b3"

echo "VERSION_PASS"

echo "=== FINAL MODEL HASHES ==="

for item in \
  "$EMERGENCY:$EMERGENCY_SHA" \
  "$SUBTREE:$SUBTREE_SHA" \
  "$RECOVERY:$RECOVERY_SHA" \
  "$DIAG:$MONOLITH_SHA"
do
  FILE="${item%%:*}"
  EXPECTED="${item##*:}"

  ACTUAL="$(
    shasum -a 256 "$FILE" | awk '{print $1}'
  )"

  test "$ACTUAL" = "$EXPECTED" || {
    echo "SHA_MISMATCH"
    echo "$FILE"
    exit 1
  }

  echo "PASS: $FILE"
done

echo "=== MANIFEST HASH CHECK ==="

(
  cd "$BASE"
  shasum -a 256 -c MANIFEST.sha256
)

echo "=== SCRIPT PARSE ==="

bash -n "$BASE/scripts/verify-phase-ai-b3-emergency.sh"
bash -n "$BASE/scripts/verify-phase-ai-b3-subtree.sh"
bash -n "$BASE/scripts/verify-phase-ai-b3-recovery.sh"
bash -n "$BASE/scripts/audit-phase-ai-b3.sh"

echo "SCRIPT_PARSE_PASS"

echo "=== RESPONSIBILITY BOUNDARIES ==="

if grep -nE \
  'SubtreeRevocationIssued|SubtreeReplacementIssued|SubtreeLifecyclePermit' \
  "$EMERGENCY"
then
  echo "EMERGENCY_BOUNDARY_FAIL"
  exit 1
fi

if grep -nE \
  'Emergency_Stop_|Restart_Stopped_Command_|SubtreeReplacementIssued' \
  "$SUBTREE"
then
  echo "SUBTREE_BOUNDARY_FAIL"
  exit 1
fi

if grep -nE \
  'Emergency_Stop_|Restart_Stopped_Command_|SubtreeLifecyclePermit' \
  "$RECOVERY"
then
  echo "RECOVERY_BOUNDARY_FAIL"
  exit 1
fi

echo "RESPONSIBILITY_BOUNDARIES_PASS"

echo "=== RE-RUN EMERGENCY 14/14 ==="

"$BASE/scripts/verify-phase-ai-b3-emergency.sh"

grep -F \
  'Verified lemma count: 14/14' \
  "$BASE/results/emergency/LATEST_VERIFICATION_SUMMARY.txt"

echo "=== RE-RUN SUBTREE 5/5 ==="

"$BASE/scripts/verify-phase-ai-b3-subtree.sh"

grep -F \
  'Verified lemma count: 5/5' \
  "$BASE/results/subtree/LATEST_VERIFICATION_SUMMARY.txt"

echo "=== RE-RUN RECOVERY 7/7 ==="

"$BASE/scripts/verify-phase-ai-b3-recovery.sh"

grep -F \
  'Verified lemma count: 7/7' \
  "$BASE/results/recovery/LATEST_VERIFICATION_SUMMARY.txt"

echo "=== WARNING CHECK ==="

for DIR in \
  "$BASE/results/emergency" \
  "$BASE/results/subtree" \
  "$BASE/results/recovery"
do
  LATEST_RUN="$(
    find "$DIR" \
      -maxdepth 1 \
      -type d \
      -name 'run-*' \
      | sort \
      | tail -1
  )"

  test -n "$LATEST_RUN"

  if grep -RIn \
    'WARNING: the following wellformedness checks failed' \
    "$LATEST_RUN"
  then
    echo "WELLFORMEDNESS_WARNING_PRESENT"
    exit 1
  fi
done

echo "NO_WELLFORMEDNESS_WARNINGS"

echo "=== FINAL PROOF TOTAL ==="

EMERGENCY_COUNT="$(
  grep -F \
    'Verified lemma count: 14/14' \
    "$BASE/results/emergency/LATEST_VERIFICATION_SUMMARY.txt" \
  | wc -l \
  | tr -d ' '
)"

SUBTREE_COUNT="$(
  grep -F \
    'Verified lemma count: 5/5' \
    "$BASE/results/subtree/LATEST_VERIFICATION_SUMMARY.txt" \
  | wc -l \
  | tr -d ' '
)"

RECOVERY_COUNT="$(
  grep -F \
    'Verified lemma count: 7/7' \
    "$BASE/results/recovery/LATEST_VERIFICATION_SUMMARY.txt" \
  | wc -l \
  | tr -d ' '
)"

test "$EMERGENCY_COUNT" = "1"
test "$SUBTREE_COUNT" = "1"
test "$RECOVERY_COUNT" = "1"

echo "Emergency: 14/14 VERIFIED"
echo "Subtree:    5/5 VERIFIED"
echo "Recovery:   7/7 VERIFIED"
echo "Total:     26/26 VERIFIED"

echo "=== FINAL DOCUMENT CHECK ==="

for FILE in \
  "$BASE/README.md" \
  "$BASE/FINAL_STATEMENT.md" \
  "$BASE/EMERGENCY_PROOF_SCOPE.md" \
  "$BASE/SUBTREE_PROOF_SCOPE.md" \
  "$BASE/RECOVERY_PROOF_SCOPE.md" \
  "$BASE/manifest.json" \
  "$BASE/MANIFEST.sha256" \
  "$BASE/results/diagnostics/DECOMPOSITION_RATIONALE.md"
do
  test -s "$FILE"
  echo "PASS: $FILE"
done

echo "=== DIFF CHECK ==="

git diff --check

echo "OCLM_AI_B3_FINAL_AUDIT_26_OF_26_PASS"
