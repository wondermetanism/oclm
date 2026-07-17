#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

python3 - <<'PY'
from pathlib import Path
import hashlib
import sys

files = [
    "README.md",
    "CITATION.cff",
    "LICENSE",
    "COMMERCIAL-LICENSE.md",
    "TRADEMARKS.md",
    "SECURITY.md",
    "CONTRIBUTING.md",
]

errors = []

for name in files:
    if not Path(name).is_file():
        errors.append(f"MISSING FILE: {name}")

if errors:
    for error in errors:
        print(error)
    sys.exit(1)

texts = {
    name: Path(name).read_text(encoding="utf-8")
    for name in files
}

canonical_terms = {
    "README.md": [
        "Hirofumi Kureha (HiRO)",
        "Founder & CEO of",
        "WonderMetanism Inc.",
        "First published by",
        "FORMALLY VERIFIED",
        "COMPLETE",
        "13/13 VERIFIED",
        "15/15",
        "https://www.wonder-metanism.com",
    ],
    "CITATION.cff": [
        "cff-version: 1.2.0",
        'family-names: "Kureha"',
        'given-names: "Hirofumi"',
        'alias: "HiRO"',
        'affiliation: "WonderMetanism Inc."',
        'version: "1.0.0"',
        'date-released: "2026-07-18"',
        'repository-code: "https://github.com/wondermetanism/oclm"',
    ],
    "LICENSE": [
        "LicenseRef-OCLM-Open-Verification-Release",
        "Copyright © 2026 Hirofumi Kureha (HiRO).",
        "Licensed and administered by WonderMetanism Inc.",
        "Source-Available for Non-Commercial Use",
        "MODIFICATION AND DERIVATIVE WORKS",
        "ENTERPRISE INTERNAL USE",
        "NO SUBLICENSING OR TRANSFER",
        "TERMINATION",
    ],
    "COMMERCIAL-LICENSE.md": [
        "Commercial Use Requiring Authorization",
        "prior written",
        "WonderMetanism Inc.",
        "Official Recognition",
    ],
    "TRADEMARKS.md": [
        "Permitted Factual Reference",
        "Uses Requiring Prior Written Authorization",
        "No Trademark License",
        "WonderMetanism Inc.",
    ],
    "SECURITY.md": [
        "OCLM Phase 1",
        "Coordinated Disclosure",
        "Published artifacts will not be silently replaced.",
    ],
    "CONTRIBUTING.md": [
        "Frozen Releases",
        "Canonical Governance",
        "Submitting a contribution does not alter the original",
    ],
}

for name, required in canonical_terms.items():
    for value in required:
        if value not in texts[name]:
            errors.append(f"{name} MISSING: {value}")

rights_docs = [
    "LICENSE",
    "COMMERCIAL-LICENSE.md",
    "TRADEMARKS.md",
    "SECURITY.md",
    "CONTRIBUTING.md",
]

for name in rights_docs:
    for value in [
        "Copyright © 2026 Hirofumi Kureha (HiRO).",
        "Licensed and administered by WonderMetanism Inc.",
    ]:
        if value not in texts[name]:
            errors.append(f"{name} RIGHTS WORDING MISSING: {value}")

stale_phrases = [
    "Copyright (c) 2026",
    "Founder & CEO, WonderMetanism",
    "Conceived and designed by HiRO",
    "please contact WonderMetanism.",
    "WonderMetanism K.K.",
    "https://wonder-metanism.com",
]

for name, text in texts.items():
    for phrase in stale_phrases:
        if phrase in text:
            errors.append(f"{name} STALE PHRASE: {phrase}")

citation = texts["CITATION.cff"]

for forbidden in [
    "\nname:",
    "\npublisher:",
    "\nlicense:",
]:
    if forbidden in "\n" + citation:
        errors.append(
            f"CITATION.cff UNWANTED FIELD: {forbidden.strip()}"
        )

if errors:
    print("PUBLICATION DOCUMENT CONSISTENCY: FAIL")
    for error in errors:
        print(f"- {error}")
    sys.exit(1)

print("PUBLICATION DOCUMENT CONSISTENCY: PASS")
print()
print("Current document SHA-256 snapshot — NOT YET FINAL:")

for name in files:
    digest = hashlib.sha256(Path(name).read_bytes()).hexdigest()
    print(f"{digest}  {name}")
PY
