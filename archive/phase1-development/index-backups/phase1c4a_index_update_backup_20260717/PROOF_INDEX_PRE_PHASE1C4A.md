# OCLM Verified Proof Index

Date: 2026-07-17

## Phase 1-A — Symbolic Lineage Core

Release:
oclm_phase1a_verified_20260717.zip

SHA-256:
91dfc2d3e32b6c4cdce893f5394beec0a50bb49f3eb8bc37bbaa6870f3434eb3

Guarantees:
- accepted Child has prior generation
- full Oracle and Parent ancestry
- complementary pair single use
- Child lineage binding
- equivocation evidence event

## Phase 1-B1 — External Authenticity

Release:
oclm_phase1b1_verified_20260717.zip

SHA-256:
b2a2d1e872ae94c28273787f20cbf144027cd62288ce28658e28b4df1be9d2b4

Guarantees:
- external acceptance requires generation or prior key compromise
- external Child identity and lineage are bound before compromise

## Phase 1-B2 — Time–Space Window

Release:
oclm_phase1b2_verified_20260717.zip

SHA-256:
912e4cfaf462a5d716168dcb8134c340c99340685c45428f10c64d5286d75cf9

Guarantees:
- Oracle window precedes both Parent participations
- both Parent participations precede Child generation
- generation precedes matching closure
- one issuance window generates at most once

## Phase 1-B3 — Claim-Collapse Independence

Release:
oclm_phase1b3_verified_20260717.zip

SHA-256:
20143ea59382cb31e507a1ea5216c6c23e196bb12f44c8100e58eb04f2eed13b

Guarantees:
- Parent and Consensus claims may collapse
- post-collapse acceptance still requires generation or compromise
- claims and Consensus cannot replace the Child lineage

## Phase 1-C1 — Composition Contract

Release:
oclm_phase1c1_verified_20260717.zip

SHA-256:
9e88254f2db50f6f5dfdf51b4d32bbd857e01d370ba89d44f1a13cfb93efc2ba

Guarantees:
- complete uncompromised composed lifecycle is executable
- final acceptance requires a closed generation contract or prior compromise
- uncompromised acceptance has full Oracle–Parent–Child–Close ancestry
- one Child identity cannot be reassigned to another lineage or Time-Space
  before Oracle compromise

## Phase 1-C2 — Signed Composition Certificate

Release:
oclm_phase1c2_verified_20260717.zip

SHA-256:
5675dac83f7825758f661d3c33731f65124cc37d1eae75364a9d8dbdea3c6a3a

Guarantees:
- an uncompromised signed Composition Certificate lifecycle is executable
- signed acceptance requires matching certificate issuance or prior Oracle-key compromise
- uncompromised signed acceptance has full Oracle–Parent–Child ancestry
- one signed Child identity cannot be reassigned to another lineage or Time-Space before Oracle-key compromise
- certificate payload modification cannot be accepted without the Oracle signing key

<!-- BEGIN PHASE 1-C3A -->
## Phase 1-C3A — Forward-Secure Epoch Core

Release:
oclm_phase1c3a_verified_20260717.zip

Release SHA-256:
37d4be2c548f26f024c5a21062c2b0c001c75cc02869a1c7f8e422044372a7ab

Model SHA-256:
f887abfbaa2ca77adcb5a936f7d4a3dc37dccb407a57c86edf153b24acc0192d

Final proof SHA-256:
6519524f188e04c41e7f9dfb4f8eea8738b52c0049cbb1f8d4b34f9cd7c474d7

Verified lemmas:
- executable_old_certificate_after_later_epoch_compromise — verified (18 steps)
- erased_old_epoch_key_cannot_be_compromised_later — verified (5 steps)
- accepted_epoch_credential_requires_issuance_or_root_compromise — verified (8 steps)
- accepted_old_certificate_requires_issuance_or_target_compromise — verified (6 steps)

Guarantees:
- an old certificate remains verifiable after compromise of a later epoch key
- an erased old epoch key cannot be compromised later in the symbolic model
- an accepted epoch credential requires matching issuance or prior Oracle Root-key compromise
- an accepted old certificate requires matching issuance, target old-epoch-key compromise, or Oracle Root-key compromise
- compromise of an unrelated later epoch key is not a forgery exception for the old certificate

Composition boundary:
- Phase 1-C3A proves the forward-secure epoch core
- Phase 1-C3B connects these guarantees to the complete C2 Oracle–Parent–Child Time-Space lineage
<!-- END PHASE 1-C3A -->

<!-- BEGIN PHASE 1-C3B -->
## Phase 1-C3B — C2/C3 Forward-Secure Composition Contract

Release:
oclm_phase1c3b_verified_20260717.zip

Release SHA-256:
f80204179282bdd1d6402de9710e5a062a4007ec46d324b83a9534e9fe6bada0

Model SHA-256:
20b5fb308997ed7148eb9f8d5f8c724a375b9fffcefbed22cdf05b7c1094aee9

Final proof SHA-256:
1fdb8f9b2e5a7aafb3147b421c8a3234576b1edf1cc8acb1ccb97601bd13e4d2

Verified lemmas:
- executable_forward_secure_composed_lifecycle — verified (32 steps)
- composed_acceptance_requires_contract_or_target_compromise — verified (10 steps)
- uncompromised_composed_acceptance_has_full_ancestry — verified (11 steps)
- forward_secure_composed_identity_is_bound_or_compromised — verified (207 steps)

Guarantees:
- the complete C2 Time-Space lineage can be sealed under an old epoch
- the old epoch key is erased before a later epoch is compromised
- the past Child remains acceptable after later-epoch compromise and claim collapse
- uncompromised acceptance has complete C2 and C3 ancestry
- the same child_id cannot be accepted under a different past lineage without target old-epoch-key or Composition Root compromise
- compromise of an unrelated later epoch key is not a past-lineage substitution exception

Composition boundary:
- Phase 1-C2 provides the signed Oracle–Parent–Child Time-Space lineage
- Phase 1-C3A provides the forward-secure epoch core
- Phase 1-C3B proves their assume-guarantee composition
<!-- END PHASE 1-C3B -->
