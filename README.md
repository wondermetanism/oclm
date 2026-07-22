# Oracle–Child Lineage Model (OCLM)

<!-- OCLM_AI_COMMAND_LINEAGE_BEGIN -->
## AI Command Lineage — Verifiable Chain of Command for Autonomous Agents

**OCLM establishes a verifiable chain of command for autonomous AI agents.**

Rather than asking an autonomous agent to obey, OCLM verifies whether an executable action remains a legitimate descendant of an authorized command.

The current formal milestone is **Phase AI-B3 (`0.4.0-ai-b3`)**, extending OCLM from command lineage and delegated authority into revocation, compromise containment, emergency stop, and bounded recovery.

**Phase AI-B3 formal verification**

- Emergency Stop Core — **14/14 VERIFIED**
- Subtree Revocation Core — **5/5 VERIFIED**
- Subtree Recovery Core — **7/7 VERIFIED**
- Total — **26/26 verified proof obligations**

The final proof basis is deliberately decomposed into three independently scoped Tamarin models. The 26 properties are a composition proof bundle; they are not presented as one monolithic 26-lemma theorem over a single transition system.

Signed Phase AI-B3 freeze commit:

`efc9ff097ed4509fa4884855c3e7962b2c74fc59`

Zenodo:

- Version DOI: [10.5281/zenodo.21490691](https://doi.org/10.5281/zenodo.21490691)
- Concept DOI: [10.5281/zenodo.21490690](https://doi.org/10.5281/zenodo.21490690)

See:

- [Phase AI-B3 overview](profiles/ai-command-lineage/phase-b3/README.md)
- [Final formal statement](profiles/ai-command-lineage/phase-b3/FINAL_STATEMENT.md)
- [Machine-readable manifest](profiles/ai-command-lineage/phase-b3/manifest.json)

<!-- OCLM_AI_COMMAND_LINEAGE_END -->

## Phase 1 — Formally Verified Lineage-Substitution Resistance Core

Oracle–Child Lineage Model (OCLM)

Conceived and designed by<br>
Hirofumi Kureha (HiRO)<br>
ORCID: https://orcid.org/0009-0006-6182-534X

Founder & CEO of<br>
WonderMetanism Inc.

First published by<br>
WonderMetanism Inc.

---

## Overview

OCLM is a formal model for determining whether a state, record, right, or lineage can be accepted as a legitimate continuation of an original truth relationship.

OCLM does not define truth as merely the latest record or the majority-accepted history.

It defines legitimacy through consistent lineage, verified relationships, and formally specified acceptance conditions.

---

## Phase 1 Status

**OCLM Phase 1**

**FORMALLY VERIFIED**

**COMPLETE**

Phase 1-A through Phase 1-C6B have been completed.

Final verification result:

- Tamarin final lemmas: 13/13 VERIFIED
- Verified release packages: 15/15
- Final proof set: VERIFIED
- Release integrity: VERIFIED

---

## Core Principle

Records may be altered.

Truth remains invariant.

OCLM does not claim that physical records, storage media, or databases cannot be modified, deleted, or forged.

Instead, OCLM establishes that an inconsistent substitution cannot be accepted and continued as the same legitimate truth and lineage within the formally specified model.

Changing a record does not automatically change the truth represented by a valid lineage.

---

## Relationship with Blockchain

Blockchain primarily addresses:

- consensus
- ordering
- distributed record preservation
- resistance against unauthorized history changes

OCLM addresses:

- legitimate existence
- lineage validity
- inheritance of state
- acceptance conditions for truth relationships

Blockchain asks:

"Which history should be accepted?"

OCLM asks:

"What can validly exist as truth and lineage?"

OCLM is not a replacement for blockchain.

It defines a higher-level authenticity and lineage condition that can operate with blockchain, databases, and other infrastructures.

---

## Final Verified Artifacts

Final model:

model/tamarin/oclm_phase1c6b_generalized_security_composition_contract.spthy

SHA-256:

c3a350f15677c93491b3af392c0519f08d3d0a6ea70200121eb4a315d7064328

Consolidated proof:

results/phase1c6b_generalized_security_composition_contract_proof_20260717.txt

SHA-256:

de6d508dc5508b1e19e7009242f4541f9cdf8ecc170c02a1746ee8544977caec

Frozen release:

releases/oclm_phase1c6b_verified_20260717.zip

SHA-256:

39a6aa3b4103e4a50f3977b43d4948142541e788dd77a69b533ed58afb4c363e

PROOF_INDEX:

baselines/PROOF_INDEX.md

SHA-256:

d7890c5d17dec538e5b6a75397cfc25523faf54412dab81ce49388426373281f

Verified proof-set manifest:

releases/OCLM_VERIFIED_PROOFSET_20260717.txt

SHA-256:

6c91c04587780ddc6cf5e0ab3c400f299beb55097f91668d0e0811deaff3931e

---

## Verification

The complete Phase 1 verification package contains:

- Tamarin formal models
- verification results
- reproducible scripts
- verified release archives
- cryptographic integrity records

Independent verification is encouraged.

---

## License

OCLM is publicly verifiable and source-available for non-commercial research, independent verification, and educational use.

Commercial use, including implementation, integration, deployment, commercial services, certification, or derivative commercial products, requires prior written authorization and a separate agreement with WonderMetanism Inc.

---

## Commercial Use

For:

- commercial implementation
- enterprise deployment
- integration
- certification
- official compliance
- commercial services

please contact WonderMetanism Inc.

---

## Citation

Oracle–Child Lineage Model (OCLM) Phase 1:
Formally Verified Lineage-Substitution Resistance Core

Conceived and designed by<br>
Hirofumi Kureha (HiRO)<br>
ORCID: https://orcid.org/0009-0006-6182-534X

Founder & CEO of<br>
WonderMetanism Inc.

First published by<br>
WonderMetanism Inc.

---

## Persistent Identifier

DOI:

https://doi.org/10.5281/zenodo.21416118

---

## Official Source

Canonical source:

WonderMetanism Inc.

Official website:

https://www.wonder-metanism.com

## OCLM Phase 2 — Final Public Release

**OCLM Phase 2: Adversarial Validation of Canonical Lineage Non-Substitutability**

Version: `2.0.0`

Release tag: `oclm-phase2-v2.0.0`

Release date: `2026-07-21`

Final formal result:

- 80/80 symbolic adversarial attack classes ruled out under the stated models and assumptions
- 0 counterexample traces
- 0 unresolved attack classes
- 8/8 health and reachability properties reachable
- A48 H1/H2/H3 and the final property verified in one integrated Tamarin invocation

Canonical Phase 2 artifacts:

- Manuscript: [`phase2/paper/oclm_phase2_adversarial_validation.md`](phase2/paper/oclm_phase2_adversarial_validation.md)
- PDF: [`phase2/paper/oclm_phase2_adversarial_validation_20260721.pdf`](phase2/paper/oclm_phase2_adversarial_validation_20260721.pdf)
- Frozen evidence: [`phase2/evidence/oclm-phase2-final-evidence-20260721T050537Z.zip`](phase2/evidence/oclm-phase2-final-evidence-20260721T050537Z.zip)
- Final audit: [`phase2/audit/FINAL_RELEASE_AUDIT.md`](phase2/audit/FINAL_RELEASE_AUDIT.md)
- Standalone release: [`releases/oclm_phase2_adversarial_validation_20260721.zip`](releases/oclm_phase2_adversarial_validation_20260721.zip)

Standalone release SHA-256:

```text
a88c6afce9b7d17e19b08b63efd1b4d6e7b8955d7f6f78c15e3731e35b6dc74a
```

Phase 2 is distributed under the OCLM Open Verification Release License, Version 1.1. It is publicly verifiable and source-available for non-commercial use. Commercial use requires prior written authorization and a separate agreement with WonderMetanism Inc.

## Phase 2 Persistent Identifiers

Version 2.0.0 DOI:

https://doi.org/10.5281/zenodo.21472818

All-versions Concept DOI:

https://doi.org/10.5281/zenodo.21472817

Zenodo record:

https://zenodo.org/records/21472818
