#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

MODEL="model/tamarin/oclm_phase1c6b_generalized_security_composition_contract.spthy"
EXPECTED_MODEL_HASH="c3a350f15677c93491b3af392c0519f08d3d0a6ea70200121eb4a315d7064328"
EXPECTED_TAMARIN_VERSION="1.12.0"
EXPECTED_MAUDE_VERSION="3.5.1"

fail() {
  echo "FAIL: $*" >&2
  exit 1
}

pass() {
  echo "PASS: $*"
}

command -v tamarin-prover >/dev/null 2>&1 \
  || fail "tamarin-prover is not installed or not available in PATH"

[[ -f "$MODEL" ]] \
  || fail "Missing model: $MODEL"

actual_model_hash="$(
  shasum -a 256 "$MODEL" |
  awk '{print $1}'
)"

[[ "$actual_model_hash" = "$EXPECTED_MODEL_HASH" ]] \
  || {
    echo "Expected: $EXPECTED_MODEL_HASH" >&2
    echo "Actual:   $actual_model_hash" >&2
    fail "Canonical model SHA-256 mismatch"
  }

pass "Canonical Phase 1-C6B model SHA-256"

lemmas=(
  "executable_generalized_clean_multi_epoch_lifecycle"
  "executable_generalized_forked_transparency_lifecycle"
  "executable_generalized_stale_epoch_lifecycle"
  "executable_generalized_revocation_exception_lifecycle"
  "generalized_acceptance_requires_c5c_and_c6a_contracts"
  "clean_generalized_acceptance_has_complete_evidence"
  "stale_generalized_acceptance_has_stale_epoch_evidence"
  "stale_generalized_acceptance_uses_epoch_compromise_state"
  "generalized_epoch_compromise_use_requires_prior_compromise"
  "revoked_generalized_acceptance_requires_explicit_exception"
  "forked_generalized_acceptance_requires_prior_log_compromise"
  "conflicting_generalized_epoch_histories_require_prior_compromise"
  "conflicting_generalized_transparency_roots_require_prior_compromise"
)

[[ "${#lemmas[@]}" -eq 13 ]] \
  || fail "Internal lemma inventory is not 13"

timestamp="$(date -u +%Y%m%dT%H%M%SZ)"

OUTPUT_DIR="${OCLM_OUTPUT_DIR:-${TMPDIR:-/tmp}/oclm-phase1c6b-reproduction-${timestamp}}"

mkdir -p "$OUTPUT_DIR"

summary="$OUTPUT_DIR/VERIFICATION_SUMMARY.txt"

{
  echo "OCLM Phase 1-C6B independent reproduction"
  echo
  echo "Generated UTC: $timestamp"
  echo "Model: $MODEL"
  echo "Model SHA-256: $actual_model_hash"
  echo
} > "$summary"

verified_count=0

command -v maude >/dev/null 2>&1 \
  || fail "maude is not installed or not available in PATH"

tamarin_version_output="$(tamarin-prover --version 2>&1 || true)"
maude_version_output="$(maude --version 2>&1 || true)"

printf '%s\n' "$tamarin_version_output" |
  grep -Fq "$EXPECTED_TAMARIN_VERSION" \
  || {
    printf '%s\n' "$tamarin_version_output" >&2
    fail "Expected Tamarin version $EXPECTED_TAMARIN_VERSION not found"
  }

printf '%s\n' "$maude_version_output" |
  grep -Fq "$EXPECTED_MAUDE_VERSION" \
  || {
    printf '%s\n' "$maude_version_output" >&2
    fail "Expected Maude version $EXPECTED_MAUDE_VERSION not found"
  }

pass "Tamarin $EXPECTED_TAMARIN_VERSION"
pass "Maude $EXPECTED_MAUDE_VERSION"

{
  echo "Tamarin version check: $EXPECTED_TAMARIN_VERSION"
  echo "Maude version check: $EXPECTED_MAUDE_VERSION"
  echo
} >> "$summary"

echo
echo "=== OCLM Phase 1-C6B formal reproduction ==="
echo "Output directory:"
echo "$OUTPUT_DIR"
echo

for lemma in "${lemmas[@]}"; do
  log="$OUTPUT_DIR/${lemma}.txt"

  echo "PROVING: $lemma"

  if ! tamarin-prover "$MODEL" --prove="$lemma" \
    > "$log" 2>&1; then
    echo
    echo "Proof log:"
    echo "$log"
    fail "Tamarin execution failed: $lemma"
  fi

  if ! grep -Eq \
    "^[[:space:]]+${lemma} \\([^)]*\\): verified \\([0-9]+ steps\\)$" \
    "$log"; then
    echo
    echo "Proof log:"
    echo "$log"

    echo
    echo "Relevant summary lines:"
    grep -E \
      "${lemma}|falsified|analysis incomplete|verified" \
      "$log" |
      tail -n 20 || true

    fail "Lemma was not verified: $lemma"
  fi

  verified_count=$((verified_count + 1))

  echo "$lemma — VERIFIED" >> "$summary"
  pass "$lemma"
  echo
done

echo >> "$summary"
echo "Verified lemma count: ${verified_count}/13" >> "$summary"

[[ "$verified_count" -eq 13 ]] \
  || fail "Expected 13 verified lemmas; found $verified_count"

echo
echo "Verified lemma count: ${verified_count}/13"
echo "Summary:"
echo "$summary"
echo
echo "OCLM PHASE 1-C6B FORMAL REPRODUCTION: PASS"
