#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"

required=(
  "README.md"
  "docs/00-oclm-charter.md"
  "docs/01-truth-semantics.md"
  "docs/02-entities-and-state.md"
  "docs/03-adversary-model.md"
  "docs/04-security-properties.md"
  "docs/05-time-space-binding.md"
  "docs/06-theorem-targets.md"
  "docs/07-open-questions.md"
)

for f in "${required[@]}"; do
  test -s "$ROOT/$f" || { echo "[FAIL] missing or empty: $f"; exit 1; }
  echo "[OK] $f"
done

echo
echo "=== SHA-256 ==="
if command -v shasum >/dev/null 2>&1; then
  (cd "$ROOT" && find README.md docs -type f -print0 | sort -z | xargs -0 shasum -a 256)
else
  (cd "$ROOT" && find README.md docs -type f -print0 | sort -z | xargs -0 sha256sum)
fi

echo
echo "Phase 0 foundation files are present."
