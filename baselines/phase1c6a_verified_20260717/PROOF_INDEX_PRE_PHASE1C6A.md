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

<!-- BEGIN PHASE 1-C4A -->
## Phase 1-C4A — Verifier State Monotonicity Core

Release:
oclm_phase1c4a_verified_20260717.zip

Release SHA-256:
e0cb186e87c478e00a8644304ff3ecdfcf3ed5eeffae09c0d0ce60c2c16da50a

Model SHA-256:
7a711dfd1d02a03bbb1527f7cf718fd2ccd2557f1ddf583c276c94b3dc6692be

Final proof SHA-256:
dd12c20d30b1eaebfc596f02c80a7a239d6a5f2282d0838e4d5ae7e8ec36ad16

Verified lemmas:
- executable_monotonic_verifier_lifecycle — verified (16 steps)
- rollback_success_requires_prior_verifier_compromise — verified (19 steps)
- verifier_state_e1_never_rolls_back_to_e0_without_compromise — verified (8 steps)
- verifier_state_e2_never_rolls_back_to_e1_without_compromise — verified (11 steps)
- verifier_state_e2_never_rolls_back_to_e0_without_compromise — verified (11 steps)
- rollback_attempt_cannot_lower_state_without_later_compromise — verified (38 steps)

Guarantees:
- the finite verifier lifecycle e0 → e1 → e2 is executable
- successful verifier rollback requires prior verifier compromise
- a verifier observed at e1 cannot later be observed at e0 without prior compromise
- a verifier observed at e2 cannot later be observed at e1 or e0 without prior compromise
- a rollback attempt against an honest verifier does not itself lower verifier state
- verifier compromise is persistent and is the explicit rollback exception

Scope boundary:
- Phase 1-C4A proves the finite verifier-state monotonicity core
- Phase 1-C4B will connect this core to the C3B lineage and certificate-acceptance contract
- revocation, transparency and split-view resistance are deferred to Phase 1-C5
- unbounded multi-epoch generalization is deferred to Phase 1-C6
<!-- END PHASE 1-C4A -->

<!-- BEGIN PHASE 1-C4B -->
## Phase 1-C4B — Rollback-Resistant Composition Contract

Release:
oclm_phase1c4b_verified_20260717.zip

Release SHA-256:
454090898d0025092906929747d46d218bab3a73e40cffc5fceda095fa36097f

Model SHA-256:
f6fc87b5b68e4af994fe531c6b70e0f47a1864235df29986020d5ac64b9d0602

Final proof SHA-256:
5757cbc91820b2d4005673eefb29652c693063682548dfba219c48af8cecb0f5

Verified lemmas:
- executable_rollback_resistant_composed_lifecycle — verified (26 steps)
- rollback_resistant_acceptance_requires_c3b_contract — verified (8 steps)
- composed_acceptance_uses_latest_state_or_prior_verifier_compromise — verified (28 steps)
- stale_composed_acceptance_requires_prior_verifier_compromise — verified (27 steps)
- same_contract_conflicting_verifier_histories_require_compromise — verified (106 steps)

Guarantees:
- the rollback-resistant composed lifecycle is executable
- every composed acceptance remains anchored to a prior C3B closed lineage contract
- uncompromised composed acceptance uses the latest finite verifier state e2
- stale verifier-state acceptance requires prior verifier compromise
- conflicting verifier histories for the same C3B contract require prior verifier compromise
- later-epoch-key compromise and Claim Collapse do not justify verifier rollback

Composition boundary:
- Phase 1-C3B provides the forward-secure Oracle–Parent–Child Time-Space lineage contract
- Phase 1-C4A provides the finite verifier-state monotonicity core
- Phase 1-C4B proves their rollback-resistant assume–guarantee composition
- revocation, transparency and split-view resistance are deferred to Phase 1-C5
- unbounded multi-epoch generalization is deferred to Phase 1-C6
<!-- END PHASE 1-C4B -->

<!-- BEGIN PHASE 1-C5A -->
## Phase 1-C5A — Revocation State Core

Release:
oclm_phase1c5a_verified_20260717.zip

Release SHA-256:
b9448c99a869727f0137b39868fe4a4846d070b2343d22de681097ef8728e13c

Model SHA-256:
3f2b2eedf6f9bede139e8beefb7c7cc763aa8e843be23af1ef7698aa0cce62e0

Final proof SHA-256:
d3d26289b4a1eee4a180f178edffb560bd1ba4c04cf5c2233c884f94893d9f1f

Verified lemmas:
- executable_revocation_lifecycle — verified (29 steps)
- certificate_reactivation_requires_prior_authority_compromise — verified (41 steps)
- current_verifier_state_never_accepts_revoked_certificate — verified (2 steps)
- revoked_acceptance_requires_missing_update_or_verifier_compromise — verified (79 steps)
- verifier_revocation_state_never_rolls_back_without_compromise — verified (64 steps)

Guarantees:
- the finite active-to-revoked certificate lifecycle is executable
- certificate reactivation requires prior Revocation Authority compromise
- a verifier holding current revocation state r1 does not accept a revoked certificate
- revoked-certificate acceptance requires a missing revocation update or prior verifier compromise
- verifier revocation state cannot roll back from r1 to r0 without verifier compromise

Scope boundary:
- Phase 1-C5A proves the finite revocation-state core
- Phase 1-C5B will address transparency-log consistency and split-view resistance
- Phase 1-C5C will compose revocation and transparency guarantees with C4B lineage acceptance
- unbounded revocation-state generalization remains outside this phase
<!-- END PHASE 1-C5A -->

<!-- BEGIN PHASE 1-C5B -->
## Phase 1-C5B — Transparency / Split-View Resistance Core

Release:
oclm_phase1c5b_verified_20260717.zip

Release SHA-256:
ebd2463683f0176ebeb1316e9d61a1635c3089e879f23cde8031274b6962b03f

Model SHA-256:
b9c9c13390e7c6758d09ccadf4dd1b81b78e57e1439049e0d2290462b2668b14

Final proof SHA-256:
b4a75529f34c704edf077385d64a96e07c4e7849589e007fafef57f566baa055

Verified lemmas:
- executable_transparency_split_view_lifecycle — verified (37 steps)
- accepted_checkpoint_requires_matching_issuance — verified (9 steps)
- conflicting_checkpoint_roots_require_prior_log_compromise — verified (19 steps)
- same_certificate_conflicting_transparency_histories_require_compromise — verified (11 steps)
- conflicting_gossip_produces_equivocation_evidence — verified (2 steps)

Guarantees:
- the finite append-only and split-view lifecycle is executable
- every accepted checkpoint requires matching prior issuance
- conflicting roots for the same checkpoint version require prior Transparency Log compromise
- acceptance of the same certificate under conflicting roots requires prior Log compromise
- gossip of conflicting same-version views produces equivocation evidence

Scope boundary:
- Phase 1-C5B proves the finite Transparency and split-view core
- Phase 1-C5C will compose C4B lineage acceptance, C5A revocation and C5B transparency
- Merkle-tree internals, gossip availability and witness quorum are outside this phase
- unbounded checkpoint generalization remains outside this phase
<!-- END PHASE 1-C5B -->

<!-- BEGIN PHASE 1-C5C -->
## Phase 1-C5C — Revocation / Transparency / Lineage Composition Contract

Release:
oclm_phase1c5c_verified_20260717.zip

Release SHA-256:
4a8fd69b3883a88b82a169ca5dd75bddb5d52318249f64f48dbff970a9b0832a

Model SHA-256:
74cc01d5276b604e88223b788b92a34eccf46ac8bfcc01ecd07c43d575af734b

Final proof SHA-256:
fdd7a51b24b2c878c2915e3883b0c45fa7d8552534413745febe6631be22566a

Verified lemmas:
- executable_composed_security_lifecycle — verified (49 steps)
- composed_acceptance_requires_all_verified_component_contracts — verified (23 steps)
- clean_composed_acceptance_has_current_component_evidence — verified (8 steps)
- revoked_composed_acceptance_requires_explicit_exception — verified (21 steps)
- forked_composed_acceptance_requires_prior_log_compromise — verified (7 steps)
- stale_lineage_composed_acceptance_requires_prior_compromise — verified (5 steps)
- conflicting_composed_roots_require_prior_log_compromise — verified (216 steps)

Guarantees:
- every final acceptance is anchored in the verified C4B, C5A and C5B contracts
- clean acceptance carries current-lineage, active-certificate and canonical-transparency evidence
- revoked acceptance requires a missing-update or revocation-verifier-compromise exception
- forked transparency acceptance requires prior Transparency Log compromise
- stale lineage acceptance requires prior lineage-verifier compromise
- conflicting final roots require prior Transparency Log compromise

Composition method:
- C4B, C5A and C5B internals remain opaque
- the theory uses assume-guarantee contract handles
- component rules are not duplicated into a monolithic model

Scope boundary:
- finite current/stale lineage modes
- finite active/revoked certificate state
- finite canonical/forked s1 checkpoint
- unbounded epoch and checkpoint generalization remains for Phase 1-C6
<!-- END PHASE 1-C5C -->
