#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

fail() {
  echo "FAIL: $*" >&2
  exit 1
}

pass() {
  echo "PASS: $*"
}

check_hash() {
  local expected="$1"
  local file="$2"
  local actual

  [[ -f "$file" ]] || fail "Missing file: $file"

  actual="$(shasum -a 256 "$file" | awk '{print $1}')"

  if [[ "$actual" != "$expected" ]]; then
    echo "Expected: $expected" >&2
    echo "Actual:   $actual" >&2
    fail "SHA-256 mismatch: $file"
  fi

  pass "$file"
}

echo "=== OCLM Phase 1 canonical artifacts ==="

check_hash \
  "c3a350f15677c93491b3af392c0519f08d3d0a6ea70200121eb4a315d7064328" \
  "model/tamarin/oclm_phase1c6b_generalized_security_composition_contract.spthy"

check_hash \
  "de6d508dc5508b1e19e7009242f4541f9cdf8ecc170c02a1746ee8544977caec" \
  "results/phase1c6b_generalized_security_composition_contract_proof_20260717.txt"

check_hash \
  "39a6aa3b4103e4a50f3977b43d4948142541e788dd77a69b533ed58afb4c363e" \
  "releases/oclm_phase1c6b_verified_20260717.zip"

check_hash \
  "d7890c5d17dec538e5b6a75397cfc25523faf54412dab81ce49388426373281f" \
  "baselines/PROOF_INDEX.md"

check_hash \
  "6c91c04587780ddc6cf5e0ab3c400f299beb55097f91668d0e0811deaff3931e" \
  "releases/OCLM_VERIFIED_PROOFSET_20260717.txt"

check_hash \
  "6ab6de06381b297886d5498aaecfe00e924973bebe6bdd94ea5699cc31abfbc5" \
  "results/phase1c6b_index_manifest_hashes_20260717.txt"

echo
echo "=== Canonical sidecar hashes ==="

shasum -a 256 -c baselines/PROOF_INDEX.sha256 \
  || fail "PROOF_INDEX sidecar verification"

pass "PROOF_INDEX sidecar"

shasum -a 256 -c releases/OCLM_VERIFIED_PROOFSET_20260717.sha256 \
  || fail "Proof-set manifest sidecar verification"

pass "Proof-set manifest sidecar"

echo
echo "=== Frozen release inventory ==="

zip_count="$(
  find releases -maxdepth 1 -type f -name '*.zip' |
  wc -l |
  tr -d '[:space:]'
)"

[[ "$zip_count" = "15" ]] \
  || fail "Expected 15 release ZIPs; found $zip_count"

pass "15/15 frozen release ZIPs present"

echo
echo "=== Outer ZIP hashes from verified proof-set manifest ==="

manifest="releases/OCLM_VERIFIED_PROOFSET_20260717.txt"
zip_list="$(mktemp "${TMPDIR:-/tmp}/oclm-zip-list.XXXXXX")"

trap 'rm -f "$zip_list"' EXIT

grep -E \
  '^[[:xdigit:]]{64}[[:space:]]+\*?.+\.zip$' \
  "$manifest" > "$zip_list" || true

manifest_zip_count="$(
  wc -l < "$zip_list" |
  tr -d '[:space:]'
)"

[[ "$manifest_zip_count" = "15" ]] \
  || fail "Expected 15 ZIP hashes in manifest; found $manifest_zip_count"

while IFS= read -r line; do
  expected="$(printf '%s\n' "$line" | awk '{print $1}')"
  listed="$(
    printf '%s\n' "$line" |
    sed -E 's/^[[:xdigit:]]{64}[[:space:]]+\*?//'
  )"

  if [[ -f "$listed" ]]; then
    zip="$listed"
  elif [[ -f "releases/$listed" ]]; then
    zip="releases/$listed"
  else
    fail "Manifest ZIP not found: $listed"
  fi

  actual="$(shasum -a 256 "$zip" | awk '{print $1}')"

  [[ "$actual" = "$expected" ]] \
    || fail "Outer SHA-256 mismatch: $zip"

  pass "Outer SHA-256: $zip"
done < "$zip_list"

echo
echo "=== ZIP CRC and internal SHA256SUMS ==="

while IFS= read -r zip; do
  unzip -tq "$zip" >/dev/null \
    || fail "ZIP CRC verification: $zip"

  temp_dir="$(mktemp -d "${TMPDIR:-/tmp}/oclm-release.XXXXXX")"

  unzip -q "$zip" -d "$temp_dir" \
    || {
      rm -rf "$temp_dir"
      fail "ZIP extraction: $zip"
    }

  sums_file="$(
    find "$temp_dir" -type f -name 'SHA256SUMS.txt' -print -quit
  )"

  if [[ -z "$sums_file" ]]; then
    rm -rf "$temp_dir"
    fail "SHA256SUMS.txt missing inside: $zip"
  fi

  (
    cd "$(dirname "$sums_file")"
    shasum -a 256 -c "$(basename "$sums_file")" >/dev/null
  ) || {
    rm -rf "$temp_dir"
    fail "Internal SHA256SUMS verification: $zip"
  }

  rm -rf "$temp_dir"
  pass "CRC and internal hashes: $zip"
done < <(
  find releases -maxdepth 1 -type f -name '*.zip' | sort
)

echo
echo "=== Historical archive integrity ==="

if [[ -f archive/phase1-development/ARCHIVE_MANIFEST.sha256 ]]; then
  shasum -a 256 -c \
    archive/phase1-development/ARCHIVE_MANIFEST.sha256 >/dev/null \
    || fail "Historical archive manifest"

  pass "Historical development archive"
fi

echo
echo "=== Phase 1-C6B reproduction record ==="

reproduction_root="results/reproduction"
reproduction_dirs=(
  "$reproduction_root"/phase1c6b_*
)

if [[ ! -d "${reproduction_dirs[0]}" ]]; then
  fail "Phase 1-C6B reproduction record is missing"
fi

if [[ "${#reproduction_dirs[@]}" -ne 1 ]]; then
  fail "Expected exactly one Phase 1-C6B reproduction record; found ${#reproduction_dirs[@]}"
fi

reproduction_dir="${reproduction_dirs[0]}"
reproduction_sums="$reproduction_dir/SHA256SUMS.txt"

[[ -f "$reproduction_sums" ]]   || fail "Reproduction SHA256SUMS.txt is missing"

(
  cd "$reproduction_dir"
  shasum -a 256 -c SHA256SUMS.txt >/dev/null
) || fail "Reproduction record SHA-256 verification"

lemma_log_count="$(
  find "$reproduction_dir" -maxdepth 1 -type f -name '*.txt'     ! -name 'SHA256SUMS.txt'     ! -name 'VERIFICATION_SUMMARY.txt' |
  wc -l |
  tr -d '[:space:]'
)"

[[ "$lemma_log_count" = "13" ]]   || fail "Expected 13 reproduction lemma logs; found $lemma_log_count"

grep -Fq "Verified lemma count: 13/13"   "$reproduction_dir/VERIFICATION_SUMMARY.txt"   || fail "Reproduction summary does not confirm 13/13"

pass "Phase 1-C6B reproduction record: 13/13"

echo
echo "=== Active-path hygiene ==="

remaining="$(
  find model/tamarin results -type f \
    \( -iname '*before*' \
       -o -iname '*pre_*' \
       -o -iname '*experimental*' \
       -o -iname '*counterexample*' \) \
    -print
)"

[[ -z "$remaining" ]] || {
  printf '%s\n' "$remaining" >&2
  fail "Intermediate artifacts remain in active paths"
}

pass "No obvious intermediate artifacts in active paths"

echo
echo "OCLM PHASE 1 RELEASE INTEGRITY: PASS"
