# OCLM AI Command Lineage Profile — Phase AI-B2 Final Statement

## Status

Phase AI-B2 is formally verified under its stated symbolic model and assumptions.

## Final model

`model/tamarin/oclm_ai_b2_delegation_lineage.spthy`

SHA-256:

`022d896e751d5a3db5930d1769790eb2b4bb08572c8d2f207906e04d6e4fb8c9`

## Verification environment

- Tamarin Prover 1.12.0
- Maude 3.5.1

## Verified properties

10/10 lemmas verified:

1. honest two-hop delegation-to-execution lifecycle is reachable,
2. first delegation requires the matching Root Command,
3. first delegated scope is derived from the parent scope by attenuation,
4. second delegation requires the matching first delegation,
5. second delegated scope is derived from its parent delegated scope,
6. accepted delegated execution requires the complete delegation lineage,
7. Root Command lineages cannot be spliced into an accepted delegated execution,
8. the leaf Action Certificate is bound to the delegated leaf Agent,
9. executed scope remains a nested attenuation descendant of the Root Command scope,
10. delegated Action Certificates are single-use.

## Core result

Within the Phase AI-B2 symbolic model, delegated execution cannot acquire legitimacy unless it descends through one coherent Root Command and delegation lineage.

Delegated authority is represented only as structural attenuation from parent authority. A child scope cannot be introduced independently of its parent scope in the modeled protocol.

## Formal boundary

Phase AI-B2 does not yet claim:

- arbitrary delegation depth,
- concrete real-world policy-subset correctness,
- delegation revocation,
- compromised-agent recovery,
- quorum delegation,
- independent witness composition,
- implementation-level gateway bypass elimination,
- natural-language intent correctness,
- complete AI safety.

## Attribution

**Oracle–Child Lineage Model (OCLM)**  
Conceived and designed by Hirofumi Kureha (HiRO).  
First published by WonderMetanism Inc.

Copyright © 2026 Hirofumi Kureha (HiRO).  
Licensed and administered by WonderMetanism Inc.
