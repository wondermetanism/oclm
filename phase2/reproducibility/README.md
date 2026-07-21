# OCLM Phase 2 Reproducibility Guide

This directory supports artifact-level review of the frozen Phase 2 evidence included in the publication package.

## Canonical evidence archive

```text
../evidence/oclm-phase2-final-evidence-20260721T050537Z.zip
SHA-256:
de36e384b7583ddde8dfc655ac51eeb517bb64011b5cf4d59a850aad62abb51e
```

## Quick verification

From the publication-package root:

```bash
bash reproducibility/verify_frozen_evidence.sh
```

The script verifies:

- the frozen evidence ZIP digest;
- ZIP structural integrity;
- the extracted internal `MANIFEST.sha256`;
- the published hashes of the normalized result files; and
- the final 80/80 and 8/8 counts in `FINAL_VALIDATION.json`.

It does not rerun Tamarin. Computational rerun commands are documented in Section 6 of the paper.

## Recorded verifier environment

- Tamarin Prover 1.12.0
- Maude 3.5.1
- Graphviz 15.1.0
- macOS 26.5.2 arm64
- Python 3.9.6

## Important boundary

The original parallel Python orchestration wrapper is not contained in the frozen final-evidence archive. The stored theories and target lemmas are independently rerunnable, but identical scheduling behavior is not claimed.
