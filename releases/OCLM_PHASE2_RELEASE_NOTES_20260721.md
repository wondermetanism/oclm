# OCLM Phase 2 Release Notes

## OCLM Phase 2: Adversarial Validation of Canonical Lineage Non-Substitutability

**Version:** 2.0.0  
**Tag:** `oclm-phase2-v2.0.0`  
**Release date:** 2026-07-21

## Final result

Under the stated OCLM Phase 1 and Phase 2 symbolic models, attacker capabilities, cryptographic abstractions, and compromise conditions:

- 80/80 tested symbolic adversarial attack classes were ruled out;
- 0 counterexample traces were found;
- 0 attack classes remained unresolved;
- 8/8 health and reachability properties were reachable;
- A48 H1/H2/H3 and the final past-epoch identity property were verified together in one integrated Tamarin invocation.

## Scope

Phase 2 adversarially validates canonical lineage non-substitutability across the inherited Phase 1 formal-model suite.

It tests whether an alternative record, identifier, certificate, ledger history, or consensus outcome can become the canonical past of an existing Child merely by being recorded or accepted as such.

The result applies to the exact preserved symbolic models and assumptions. It does not claim universal unbreakability, physical truth of every Oracle input, or automatic security of every implementation or blockchain deployment.

## Included

- complete Sections 1-11 manuscript in Markdown and PDF;
- English and Japanese human-readable theory;
- full 80 attack + 8 health catalog;
- machine-readable final result set;
- A48 integrated proof and helper results;
- frozen formal-evidence archive;
- reproducibility validator;
- assumptions and claims matrix;
- multi-blockchain architectural interpretation;
- citation and Zenodo metadata;
- final release audit and integrity manifests.

## Attribution

Oracle–Child Lineage Model (OCLM)  
Conceived and designed by Hirofumi Kureha (HiRO).  
First published by WonderMetanism Inc.

Copyright © 2026 Hirofumi Kureha (HiRO).  
Licensed and administered by WonderMetanism Inc.

## License

Publicly verifiable and source-available for non-commercial use under the OCLM Open Verification Release License, Version 1.1.

Commercial implementation, integration, deployment, services, certification, or derivative commercial products require prior written authorization and a separate agreement with WonderMetanism Inc.
