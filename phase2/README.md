# OCLM Phase 2 Final Public Release

This is the frozen OCLM Phase 2 public release, version 2.0.0, dated 2026-07-21. It preserves the audited Sections 1–11 manuscript, synchronized standalone sections, scholarly references, formal-boundary material, publication metadata, and frozen formal evidence.

## Confirmed title

**OCLM Phase 2: Adversarial Validation of Canonical Lineage Non-Substitutability**

**Eighty Symbolic Attack Classes and Eight Health and Reachability Checks for the Oracle–Child Lineage Model**

## Included material

- `THEORY.md` — English theory text
- `THEORY_JA.md` — Japanese theory text
- `paper/oclm_phase2_adversarial_validation.md` — audited integrated manuscript
- `paper/sections/01_introduction.md` — standalone Section 1
- `paper/sections/02_conceptual_foundations_and_definitions.md` — standalone Section 2
- `paper/sections/03_phase1_formal_model_foundation.md` — standalone Section 3
- `paper/sections/04_adversary_and_compromise_model.md` — standalone Section 4
- `paper/sections/05_adversarial_validation_catalog.md` — standalone Section 5
- `paper/sections/06_verification_methodology_and_reproducibility.md` — standalone Section 6
- `paper/sections/07_complete_verification_results.md` — standalone Section 7
- `paper/sections/08_integrated_a48_proof.md` — standalone Section 8
- `paper/sections/09_oclm_higher_layer_multiple_blockchains.md` — standalone Section 9
- `paper/sections/10_assumptions_limitations_and_formal_boundary.md` — standalone Section 10
- `paper/sections/11_conclusion_and_final_phase2_statement.md` — standalone Section 11
- `references/REFERENCES.md` — reviewed scholarly references
- `references/oclm_phase2_references.bib` — BibTeX reference set
- `CITATION.cff` — GitHub-compatible citation metadata
- `audit/FINAL_RELEASE_AUDIT.md` — final release audit
- `audit/FINAL_RELEASE_AUDIT.json` — machine-readable final audit result
- `final-statements/OFFICIAL_FINAL_STATEMENT.md` — publication-safe final statement
- `final-statements/CANONICAL_STATEMENT.md` — bilingual canonical statement
- `final-statements/PHASE2_COMPLETION_STATUS.json` — machine-readable completion status
- `formal-boundary/FORMAL_BOUNDARY.md` — concise formal boundary
- `formal-boundary/CLAIMS_MATRIX.md` — supported and unsupported claims
- `formal-boundary/ASSUMPTIONS_AND_LIMITS.json` — machine-readable assumptions and limits
- `architecture/MULTI_BLOCKCHAIN_ARCHITECTURE.md` — concise architecture note
- `architecture/MULTI_BLOCKCHAIN_PROFILE.json` — machine-readable architectural profile
- `results/A48_INTEGRATED_PROOF_SUMMARY.md` — concise A48 proof summary
- `results/A48_PROOF_CHAIN.json` — machine-readable proof dependency record
- `results/README.md` — human-readable result overview
- `results/RESULTS_BY_ATTACK_FAMILY.csv` — family-level result counts
- `results/RESULTS_BY_MODEL.csv` — model-level target coverage
- `results/RESULTS_PROFILE.json` — normalized result and timing profile
- `results/SLOWEST_FINAL_EVIDENCE_TARGETS.csv` — ten slowest selected final targets
- `catalog/ATTACK_AND_HEALTH_CATALOG.md` — complete 80 + 8 catalog
- `catalog/FINAL_88_RESULTS.csv` — machine-readable final 88-result set
- `catalog/A48_HELPER_RESULTS.csv` — integrated A48 helper results
- `catalog/FINAL_EVIDENCE_REPORT.md` — concise final evidence report
- `reproducibility/README.md` — artifact-review guide
- `reproducibility/verify_frozen_evidence.sh` — frozen-evidence integrity validator
- `EVIDENCE_REFERENCE.md` — evidence hashes and references
- `evidence/oclm-phase2-final-evidence-20260721T050537Z.zip` — frozen final evidence archive
- `MANIFEST.sha256` — hashes of package files

## Current paper coverage

1. Abstract and Introduction
2. Conceptual Foundations and Definitions
3. Phase 1 Formal-Model Foundation
4. Adversary and Compromise Model
5. Adversarial Validation Battery and Reachability Catalog
6. Verification Methodology and Reproducibility
7. Complete Verification Results
8. Integrated Proof of A48: Past-Epoch Identity Binding
9. OCLM as a Higher Layer Binding Multiple Blockchains
10. Assumptions, Limitations, and Formal Boundary
11. Conclusion and Final Phase 2 Statement

The manuscript, numerical, evidence-reference, standalone-section, and citation audits are complete for RC1. Repository integration and final release freeze remain.

## Canonical verification result represented by the frozen evidence

- 80/80 symbolic attack classes ruled out under the stated models and assumptions
- 0 counterexample traces
- 0 unresolved attack classes
- 8/8 health and reachability properties reachable
- A48 H1/H2/H3 and final property verified in one integrated Tamarin invocation

## Reproducibility note

Run the following from the package root to verify the frozen evidence archive and its internal result hashes:

```bash
bash reproducibility/verify_frozen_evidence.sh
```

This performs artifact-level verification. It does not rerun Tamarin.

## Attribution

Oracle–Child Lineage Model (OCLM)  
Conceived and designed by Hirofumi Kureha (HiRO).  
First published by WonderMetanism Inc.

Copyright © 2026 Hirofumi Kureha (HiRO).  
Licensed and administered by WonderMetanism Inc.


## Final release status

- version: `2.0.0`
- release tag: `oclm-phase2-v2.0.0`
- manuscript Sections 1–11: complete
- symbolic attack classes: 80/80 ruled out under the stated models and assumptions
- counterexample traces: 0
- unresolved attack classes: 0
- health and reachability: 8/8 reachable
- A48 helpers: 3/3 verified
- frozen evidence validator: PASS

## License

Phase 2 is distributed under [`LICENSE`](LICENSE), the OCLM Open Verification Release License, Version 1.1.

The materials are publicly verifiable and source-available for non-commercial use. Commercial use requires prior written authorization and a separate agreement with WonderMetanism Inc.

## Publication materials

Release and publication text is preserved under [`publication/`](publication/).

## Phase 2 Persistent Identifiers

Version 2.0.0 DOI:

https://doi.org/10.5281/zenodo.21472818

All-versions Concept DOI:

https://doi.org/10.5281/zenodo.21472817

Zenodo record:

https://zenodo.org/records/21472818
