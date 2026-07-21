#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ZIP="$ROOT/evidence/oclm-phase2-final-evidence-20260721T050537Z.zip"
EXPECTED_ZIP_SHA="de36e384b7583ddde8dfc655ac51eeb517bb64011b5cf4d59a850aad62abb51e"

for tool in shasum unzip python3; do
  command -v "$tool" >/dev/null 2>&1 || {
    echo "FATAL: required command not found: $tool" >&2
    exit 1
  }
done

[ -f "$ZIP" ] || {
  echo "FATAL: evidence ZIP not found: $ZIP" >&2
  exit 1
}

ACTUAL_ZIP_SHA="$(shasum -a 256 "$ZIP" | awk '{print $1}')"
[ "$ACTUAL_ZIP_SHA" = "$EXPECTED_ZIP_SHA" ] || {
  echo "FATAL: evidence ZIP SHA-256 mismatch" >&2
  echo "expected: $EXPECTED_ZIP_SHA" >&2
  echo "actual:   $ACTUAL_ZIP_SHA" >&2
  exit 1
}

unzip -tq "$ZIP" >/dev/null

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
unzip -q "$ZIP" -d "$TMP"
EVIDENCE_ROOT="$(find "$TMP" -mindepth 1 -maxdepth 1 -type d | head -n 1)"
[ -n "$EVIDENCE_ROOT" ] || {
  echo "FATAL: extracted evidence root not found" >&2
  exit 1
}

(
  cd "$EVIDENCE_ROOT"
  shasum -a 256 -c MANIFEST.sha256 >/dev/null
)

python3 - "$EVIDENCE_ROOT" <<'PY'
import hashlib
import json
import sys
from pathlib import Path

root = Path(sys.argv[1])
expected = {
    "FINAL_88_RESULTS.csv": "4c9451cdb967914940c63742cc15bcb65ac6cf7870973becf8e3e6e942147e26",
    "A48_HELPER_RESULTS.csv": "1de210e2480955b57e287af3dbb0853f69f85a4ad753f763081ad83643770405",
    "FINAL_REPORT.md": "0fc16e9416e0d56c49cd0d13cb92dc5958916cbb43e871b46a9c96d9adc19da8",
    "FINAL_VALIDATION.json": "428b0de447dbf3144b8c0c91fbbed40e6a2bad5b022917a8f729fc38d53391dd",
}

def sha(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()

for name, digest in expected.items():
    path = root / name
    if not path.is_file():
        raise SystemExit(f"FATAL: missing {name}")
    actual = sha(path)
    if actual != digest:
        raise SystemExit(f"FATAL: SHA-256 mismatch for {name}: {actual}")

validation = json.loads((root / "FINAL_VALIDATION.json").read_text(encoding="utf-8"))
required = {
    "attack_total": 80,
    "attack_survives": 80,
    "counterexamples": 0,
    "unresolved": 0,
    "health_total": 8,
    "health_reachable": 8,
    "a48_helpers_verified": 3,
}
for key, value in required.items():
    if validation.get(key) != value:
        raise SystemExit(
            f"FATAL: validation mismatch for {key}: "
            f"expected {value}, got {validation.get(key)}"
        )

print("OCLM Phase 2 frozen evidence verification: PASS")
print("Attack classes: 80/80 SURVIVES")
print("Counterexamples: 0")
print("Unresolved: 0")
print("Health and reachability: 8/8 REACHABLE")
print("A48 helpers: 3/3 VERIFIED")
PY
