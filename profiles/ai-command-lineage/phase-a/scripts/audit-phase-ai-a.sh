#!/usr/bin/env bash
set -euo pipefail

BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

required_files=(
  "$BASE/README.md"
  "$BASE/VERSION"
  "$BASE/architecture/COMMAND_LINEAGE_ARCHITECTURE.md"
  "$BASE/architecture/COMMAND_LINEAGE_PROFILE.json"
  "$BASE/formal-boundary/FORMAL_BOUNDARY.md"
  "$BASE/formal-boundary/CLAIMS_MATRIX.md"
  "$BASE/formal-boundary/ASSUMPTIONS_AND_LIMITS.json"
  "$BASE/catalog/INITIAL_ATTACK_CATALOG.md"
)

for file in "${required_files[@]}"; do
  test -s "$file" || {
    echo "MISSING_OR_EMPTY $file"
    exit 1
  }
done

python3 -m json.tool \
  "$BASE/architecture/COMMAND_LINEAGE_PROFILE.json" \
  >/dev/null

python3 -m json.tool \
  "$BASE/formal-boundary/ASSUMPTIONS_AND_LIMITS.json" \
  >/dev/null

grep -Fq \
  "Phase AI-A does not claim that AI safety has already been formally verified." \
  "$BASE/README.md"

grep -Fq \
  "No tool or resource execution is accepted unless" \
  "$BASE/formal-boundary/FORMAL_BOUNDARY.md"

grep -Fq \
  'candidate attack classes: **16**' \
  "$BASE/catalog/INITIAL_ATTACK_CATALOG.md"

grep -Fq \
  'candidate health and reachability properties: **5**' \
  "$BASE/catalog/INITIAL_ATTACK_CATALOG.md"

python3 - "$BASE" <<'PY'
from pathlib import Path
import json
import sys

base = Path(sys.argv[1])

profile = json.loads(
    (base / "architecture/COMMAND_LINEAGE_PROFILE.json").read_text(
        encoding="utf-8"
    )
)

limits = json.loads(
    (
        base
        / "formal-boundary"
        / "ASSUMPTIONS_AND_LIMITS.json"
    ).read_text(encoding="utf-8")
)

claims = (
    base
    / "formal-boundary"
    / "CLAIMS_MATRIX.md"
).read_text(encoding="utf-8")

required_nonclaims = {
    "AI safety has been formally verified",
    "natural-language intent is interpreted correctly",
    "the model is aligned or benevolent",
}

missing_profile_nonclaims = (
    required_nonclaims
    - set(profile["not_claimed_in_phase_ai_a"])
)

if missing_profile_nonclaims:
    raise SystemExit(
        "MISSING_PROFILE_NONCLAIMS "
        + repr(sorted(missing_profile_nonclaims))
    )

required_limits = {
    "correct interpretation of natural-language commands",
    "AI alignment, morality, or benevolence",
    "absence of zero-day vulnerabilities",
    "security of every implementation",
}

missing_limits = (
    required_limits
    - set(limits["not_established"])
)

if missing_limits:
    raise SystemExit(
        "MISSING_FORMAL_LIMITS "
        + repr(sorted(missing_limits))
    )

required_claim_rows = [
    (
        "| OCLM prevents every zero-day or sandbox escape "
        "| Not supported |"
    ),
    (
        "| OCLM-AI is universally unbreakable "
        "| Not supported |"
    ),
    (
        "| Every AI-agent implementation using OCLM is secure "
        "| Not supported |"
    ),
]

for row in required_claim_rows:
    if row not in claims:
        raise SystemExit(
            "MISSING_EXPLICIT_NONCLAIM " + row
        )

dangerous_phrases = (
    "ai safety has been formally verified",
    "universally unbreakable",
    "prevents every zero-day",
)

safe_markers = (
    "does not claim",
    "not supported",
    "not established",
    "not yet",
    "no dedicated",
    "exceeds the formal evidence",
)

text_files = [
    base / "README.md",
    base / "architecture/COMMAND_LINEAGE_ARCHITECTURE.md",
    base / "formal-boundary/FORMAL_BOUNDARY.md",
    base / "formal-boundary/CLAIMS_MATRIX.md",
    base / "catalog/INITIAL_ATTACK_CATALOG.md",
]

violations = []

for path in text_files:
    text = path.read_text(encoding="utf-8")

    if not text.endswith("\n"):
        violations.append(
            f"{path}: missing final newline"
        )

    for line_number, line in enumerate(
        text.splitlines(),
        start=1,
    ):
        if line.endswith((" ", "\t")):
            violations.append(
                f"{path}:{line_number}: trailing whitespace"
            )

        lowered = line.lower()

        if any(
            phrase in lowered
            for phrase in dangerous_phrases
        ):
            if not any(
                marker in lowered
                for marker in safe_markers
            ):
                violations.append(
                    f"{path}:{line_number}: "
                    f"unsafe positive claim: {line}"
                )

for path in (
    base / "architecture/COMMAND_LINEAGE_PROFILE.json",
    base / "formal-boundary/ASSUMPTIONS_AND_LIMITS.json",
    base / "VERSION",
    base / "scripts/audit-phase-ai-a.sh",
):
    text = path.read_text(encoding="utf-8")

    if not text.endswith("\n"):
        violations.append(
            f"{path}: missing final newline"
        )

    for line_number, line in enumerate(
        text.splitlines(),
        start=1,
    ):
        if line.endswith((" ", "\t")):
            violations.append(
                f"{path}:{line_number}: trailing whitespace"
            )

if violations:
    print("PHASE_AI_A_AUDIT_FAILURE")
    for violation in violations:
        print(violation)
    raise SystemExit(1)

print("SEMANTIC_CLAIM_GUARD_PASS")
print("TEXT_FORMAT_AUDIT_PASS")
PY

echo "PHASE_AI_A_AUDIT_PASS"
