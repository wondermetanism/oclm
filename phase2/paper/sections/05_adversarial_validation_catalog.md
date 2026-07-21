# 5. Adversarial Validation Battery and Reachability Catalog

## 5.1 Battery Composition

Phase 2 evaluates 88 principal verification targets: 80 symbolic adversarial attack classes and eight health and reachability properties. The 80 attack classes are not 80 concrete network packets or 80 examples of one exploit. Each is a symbolic property describing a prohibited class of traces against one of the inherited Phase 1 theories.

The final evidence records:

```text
Attack properties:             80
Attack classes ruled out:      80 / 80
Counterexample traces found:    0
Unresolved attack classes:      0
Health and reachability checks: 8
Reachable health properties:    8 / 8
```

The complete machine-readable result set is preserved in `catalog/FINAL_88_RESULTS.csv`. The frozen proof logs, generated theories, hashes, and original evidence composition remain inside the included final-evidence archive.

## 5.2 Result Semantics

For the 79 direct attack-search properties, the generated theory states a prohibited condition as an `exists-trace` lemma.

```text
exists-trace attack lemma falsified - no trace found
→ the prohibited trace was not reachable under the stated model
```

A48 was completed through an integrated `all-traces` proof rather than counted as an additional direct attack search. H1, H2, H3, and the final past-epoch identity property were verified in the same Tamarin invocation. A48 remains one of the 80 attack classes; its three helper lemmas are supporting obligations, not additional attacks.

For a health property:

```text
exists-trace health lemma verified
→ the intended lifecycle is reachable
```

The health checks prevent a vacuous interpretation in which attack traces are absent only because the protocol cannot execute its intended behavior.

## 5.3 Attack Taxonomy

| Family | Count | Attack IDs |
|---|---:|---|
| Lineage and Identity Substitution | 4 | A01, A02, A03, A04 |
| Cross-Instance Ancestry Splicing | 4 | A05, A06, A07, A08 |
| Replay, Single Use, Staleness, and Rollback | 4 | A09, A10, A11, A12 |
| Temporal Boundaries of Key Compromise | 4 | A13, A14, A15, A16 |
| Revocation and Unauthorized Reactivation | 5 | A17, A18, A19, A20, A71 |
| Transparency and Split-View Acceptance | 4 | A21, A22, A23, A24 |
| Time, Space, and Oracle Binding | 4 | A25, A26, A27, A28 |
| Final Composition and Canonical Conflict | 4 | A29, A30, A31, A32 |
| Lineage, Identity, and Ancestry Invariants | 14 | A33, A35, A36, A37, A38, A39, A40, A41, A42, A43, A45, A47, A48, A61 |
| Composition and Evidence Boundaries | 4 | A34, A56, A59, A67 |
| Adversarial Semantics and Resource Reuse | 1 | A44 |
| Temporal Boundaries and State Transitions | 17 | A46, A49, A50, A51, A52, A53, A54, A55, A57, A62, A63, A64, A65, A66, A68, A69, A70 |
| Transparency Forks and Equivocation | 4 | A58, A60, A72, A73 |
| Provenance Injectivity and Reverse Identity | 7 | A74, A75, A76, A77, A78, A79, A80 |

The taxonomy is analytical rather than a claim that each family is disjoint. For example, an epoch rollback property may simultaneously concern temporal compromise boundaries, stale evidence, and canonical identity. Each property is listed under the primary category used by the final evidence set.

## 5.4 Lineage and Identity Substitution

These properties directly test whether one accepted Child identity can be associated with two different lineages without the compromise condition required by the selected theory.

| ID | Target model | Formal property | Verification method | Final status |
|---|---|---|---|---|
| A01 | `oclm_phase1.spthy` | `audit_a01_child_lineage_is_bound` | original clean run | **SURVIVES** |
| A02 | `oclm_phase1b1_external_signature.spthy` | `audit_a02_external_child_identity_is_bound_or_compromised` | original clean run | **SURVIVES** |
| A03 | `oclm_phase1c2_signed_composition_certificate.spthy` | `audit_a03_signed_composition_identity_is_bound_or_compromised` | original clean run | **SURVIVES** |
| A04 | `oclm_phase1c3b_c2_c3_composition_contract.spthy` | `audit_a04_forward_secure_composed_identity_is_bound_or_compromised` | clean direct rerun | **SURVIVES** |

## 5.5 Cross-Instance Ancestry Splicing

These attacks try to splice otherwise valid parents, windows, generation events, collapse events, or certificates from different protocol instances into one accepted ancestry.

| ID | Target model | Formal property | Verification method | Final status |
|---|---|---|---|---|
| A05 | `oclm_phase1.spthy` | `audit_a05_generated_child_has_full_ancestry` | original clean run | **SURVIVES** |
| A06 | `oclm_phase1c1_composition_contract.spthy` | `audit_a06_uncompromised_acceptance_has_full_composed_ancestry` | original clean run | **SURVIVES** |
| A07 | `oclm_phase1c2_signed_composition_certificate.spthy` | `audit_a07_uncompromised_signed_acceptance_has_full_ancestry` | original clean run | **SURVIVES** |
| A08 | `oclm_phase1c3b_c2_c3_composition_contract.spthy` | `audit_a08_uncompromised_composed_acceptance_has_full_ancestry` | clean direct rerun | **SURVIVES** |

## 5.6 Replay, Single Use, Staleness, and Rollback

These properties test whether consumed issuance resources can be reused, whether a generation window can produce more than one Child, or whether stale verifier state can be accepted without a modeled compromise.

| ID | Target model | Formal property | Verification method | Final status |
|---|---|---|---|---|
| A09 | `oclm_phase1.spthy` | `audit_a09_complementary_pair_is_single_use` | original clean run | **SURVIVES** |
| A10 | `oclm_phase1b2_time_space_window.spthy` | `audit_a10_window_generates_at_most_once` | original clean run | **SURVIVES** |
| A11 | `oclm_phase1c4a_verifier_state_monotonicity_core.spthy` | `audit_a11_rollback_attempt_cannot_lower_state_without_later_compromise` | original clean run | **SURVIVES** |
| A12 | `oclm_phase1c4b_rollback_resistant_composition_contract.spthy` | `audit_a12_stale_composed_acceptance_requires_prior_verifier_compromise` | original clean run | **SURVIVES** |

## 5.7 Temporal Boundaries of Key Compromise

These attacks test whether compromise is incorrectly projected backward in time, whether erased epoch keys can be compromised later, and whether issuance or target-key compromise is required for historical acceptance.

| ID | Target model | Formal property | Verification method | Final status |
|---|---|---|---|---|
| A13 | `oclm_phase1c3_forward_secure_epochs.spthy` | `audit_a13_erased_epoch_key_cannot_be_compromised_later` | clean direct rerun | **SURVIVES** |
| A14 | `oclm_phase1c3_forward_secure_epochs.spthy` | `audit_a14_accepted_epoch_credential_requires_issuance_or_root_compromise` | clean direct rerun | **SURVIVES** |
| A15 | `oclm_phase1c3a_forward_secure_epoch_core.spthy` | `audit_a15_accepted_old_certificate_requires_issuance_or_target_compromise` | original clean run | **SURVIVES** |
| A16 | `oclm_phase1c3b_c2_c3_composition_contract.spthy` | `audit_a16_composed_acceptance_requires_contract_or_target_compromise` | clean direct rerun | **SURVIVES** |

## 5.8 Revocation and Unauthorized Reactivation

These properties test current-state rejection of revoked certificates, unauthorized reactivation, missing-update exceptions, verifier rollback, and final-composition acceptance after revocation.

| ID | Target model | Formal property | Verification method | Final status |
|---|---|---|---|---|
| A17 | `oclm_phase1c5a_revocation_state_core.spthy` | `audit_a17_certificate_reactivation_requires_prior_authority_compromise` | original clean run | **SURVIVES** |
| A18 | `oclm_phase1c5a_revocation_state_core.spthy` | `audit_a18_current_verifier_state_never_accepts_revoked_certificate` | original clean run | **SURVIVES** |
| A19 | `oclm_phase1c5a_revocation_state_core.spthy` | `audit_a19_revoked_acceptance_requires_missing_update_or_verifier_compromise` | original clean run | **SURVIVES** |
| A20 | `oclm_phase1c5c_revocation_transparency_lineage_composition_contract.spthy` | `audit_a20_revoked_composed_acceptance_requires_explicit_exception` | original clean run | **SURVIVES** |
| A71 | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | `audit_a71_revoked_generalized_acceptance_requires_explicit_exception` | original clean run | **SURVIVES** |

## 5.9 Transparency and Split-View Acceptance

These attacks test checkpoint provenance, conflicting roots, conflicting histories for one certificate, and split-view acceptance without prior log compromise.

| ID | Target model | Formal property | Verification method | Final status |
|---|---|---|---|---|
| A21 | `oclm_phase1c5b_transparency_split_view_core.spthy` | `audit_a21_accepted_checkpoint_requires_matching_issuance` | original clean run | **SURVIVES** |
| A22 | `oclm_phase1c5b_transparency_split_view_core.spthy` | `audit_a22_conflicting_checkpoint_roots_require_prior_log_compromise` | original clean run | **SURVIVES** |
| A23 | `oclm_phase1c5b_transparency_split_view_core.spthy` | `audit_a23_same_certificate_conflicting_transparency_histories_require_compromise` | original clean run | **SURVIVES** |
| A24 | `oclm_phase1c5c_revocation_transparency_lineage_composition_contract.spthy` | `audit_a24_conflicting_composed_roots_require_prior_log_compromise` | original clean run | **SURVIVES** |

## 5.10 Time, Space, and Oracle Binding

These properties test whether Child generation and acceptance remain bound to a matching Oracle issuance, time-space window, parent participation, and closed generation event.

| ID | Target model | Formal property | Verification method | Final status |
|---|---|---|---|---|
| A25 | `oclm_phase1b_external.spthy` | `audit_a25_external_acceptance_requires_issue_or_compromise` | clean direct rerun | **SURVIVES** |
| A26 | `oclm_phase1b2_time_space_window.spthy` | `audit_a26_generated_child_has_open_window_ancestry` | original clean run | **SURVIVES** |
| A27 | `oclm_phase1c1_composition_contract.spthy` | `audit_a27_composed_acceptance_requires_closed_generation_or_compromise` | original clean run | **SURVIVES** |
| A28 | `oclm_phase1c2_signed_composition_certificate.spthy` | `audit_a28_signed_acceptance_requires_certificate_or_compromise` | original clean run | **SURVIVES** |

## 5.11 Final Composition and Canonical Conflict

These attacks target the composed contracts and generalized model, asking whether final acceptance can occur without all component contracts or whether conflicting epoch histories can be accepted without compromise.

| ID | Target model | Formal property | Verification method | Final status |
|---|---|---|---|---|
| A29 | `oclm_phase1c5c_revocation_transparency_lineage_composition_contract.spthy` | `audit_a29_composed_acceptance_requires_all_verified_component_contracts` | original clean run | **SURVIVES** |
| A30 | `oclm_phase1c6a_multi_epoch_generalization_core.spthy` | `audit_a30_accepted_epoch_requires_matching_prior_issuance` | original clean run | **SURVIVES** |
| A31 | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | `audit_a31_generalized_acceptance_requires_c5c_and_c6a_contracts` | original clean run | **SURVIVES** |
| A32 | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | `audit_a32_conflicting_generalized_epoch_histories_require_prior_compromise` | original clean run | **SURVIVES** |

## 5.12 Lineage, Identity, and Ancestry Invariants

This family stresses the foundational ancestry and identity invariants across the model progression, including generation-before-acceptance, parent ordering, claim collapse, external evidence, forward-secure ancestry, and A48.

| ID | Target model | Formal property | Verification method | Final status |
|---|---|---|---|---|
| A33 | `oclm_phase1.spthy` | `audit_a33_accepted_child_was_generated` | original clean run | **SURVIVES** |
| A35 | `oclm_phase1b1_external_signature.spthy` | `audit_a35_external_child_requires_generation_or_compromise` | original clean run | **SURVIVES** |
| A36 | `oclm_phase1b2_time_space_window.spthy` | `audit_a36_generated_child_precedes_matching_close` | original clean run | **SURVIVES** |
| A37 | `oclm_phase1b2_time_space_window.spthy` | `audit_a37_generated_parent_a_precedes_close` | original clean run | **SURVIVES** |
| A38 | `oclm_phase1b2_time_space_window.spthy` | `audit_a38_generated_parent_b_precedes_close` | original clean run | **SURVIVES** |
| A39 | `oclm_phase1b3_claim_collapse.spthy` | `audit_a39_post_collapse_acceptance_requires_generation_or_compromise` | original clean run | **SURVIVES** |
| A40 | `oclm_phase1b3_claim_collapse.spthy` | `audit_a40_post_collapse_acceptance_has_collapse_ancestry` | original clean run | **SURVIVES** |
| A41 | `oclm_phase1b3_claim_collapse.spthy` | `audit_a41_post_collapse_child_identity_is_bound_or_compromised` | original clean run | **SURVIVES** |
| A42 | `oclm_phase1b_external.spthy` | `audit_a42_external_acceptance_requires_generation_or_compromise` | clean direct rerun | **SURVIVES** |
| A43 | `oclm_phase1b_external.spthy` | `audit_a43_external_child_lineage_is_bound_or_compromised` | clean direct rerun | **SURVIVES** |
| A45 | `oclm_phase1c1_composition_contract.spthy` | `audit_a45_composed_child_identity_is_bound_or_compromised` | original clean run | **SURVIVES** |
| A47 | `oclm_phase1c3_forward_secure_epochs.spthy` | `audit_a47_uncompromised_erased_epoch_acceptance_has_full_ancestry` | clean direct rerun | **SURVIVES** |
| A48 | `oclm_phase1c3_forward_secure_epochs.spthy` | `audit_a48_past_epoch_identity_is_bound_or_target_compromised` | integrated all-traces proof with three verified helper lemmas | **SURVIVES** |
| A61 | `oclm_phase1c5c_revocation_transparency_lineage_composition_contract.spthy` | `audit_a61_stale_lineage_composed_acceptance_requires_prior_compromise` | original clean run | **SURVIVES** |

## 5.13 Composition and Evidence Boundaries

These properties test whether equivocation is evidenced and whether clean composed acceptance retains the current lineage, certificate, transparency, verifier, and generalized security evidence required by the contract.

| ID | Target model | Formal property | Verification method | Final status |
|---|---|---|---|---|
| A34 | `oclm_phase1.spthy` | `audit_a34_oracle_equivocation_is_evidenced` | original clean run | **SURVIVES** |
| A56 | `oclm_phase1c4b_rollback_resistant_composition_contract.spthy` | `audit_a56_same_contract_conflicting_verifier_histories_require_compromise` | original clean run | **SURVIVES** |
| A59 | `oclm_phase1c5c_revocation_transparency_lineage_composition_contract.spthy` | `audit_a59_clean_composed_acceptance_has_current_component_evidence` | original clean run | **SURVIVES** |
| A67 | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | `audit_a67_clean_generalized_acceptance_has_complete_evidence` | original clean run | **SURVIVES** |

## 5.14 Adversarial Semantics and Resource Reuse

This property tests whether the external model accidentally changes the one-time resource semantics inherited from the foundational generation model.

| ID | Target model | Formal property | Verification method | Final status |
|---|---|---|---|---|
| A44 | `oclm_phase1b_external.spthy` | `audit_a44_external_model_pair_is_single_use` | clean direct rerun | **SURVIVES** |

## 5.15 Temporal Boundaries and State Transitions

These properties cover monotonic verifier progression, epoch rollback, stale-epoch acceptance, revocation-state rollback, target-compromise usage, and evidence requirements for current or stale generalized acceptance.

| ID | Target model | Formal property | Verification method | Final status |
|---|---|---|---|---|
| A46 | `oclm_phase1c3_forward_secure_epochs.spthy` | `audit_a46_accepted_certificate_with_issued_credential_requires_origin_or_epoch_compromise` | clean direct rerun | **SURVIVES** |
| A49 | `oclm_phase1c3a_forward_secure_epoch_core.spthy` | `audit_a49_erased_old_epoch_key_cannot_be_compromised_later` | original clean run | **SURVIVES** |
| A50 | `oclm_phase1c3a_forward_secure_epoch_core.spthy` | `audit_a50_accepted_epoch_credential_requires_issuance_or_root_compromise` | original clean run | **SURVIVES** |
| A51 | `oclm_phase1c4a_verifier_state_monotonicity_core.spthy` | `audit_a51_verifier_state_e1_never_rolls_back_to_e0_without_compromise` | original clean run | **SURVIVES** |
| A52 | `oclm_phase1c4a_verifier_state_monotonicity_core.spthy` | `audit_a52_verifier_state_e2_never_rolls_back_to_e1_without_compromise` | original clean run | **SURVIVES** |
| A53 | `oclm_phase1c4a_verifier_state_monotonicity_core.spthy` | `audit_a53_verifier_state_e2_never_rolls_back_to_e0_without_compromise` | original clean run | **SURVIVES** |
| A54 | `oclm_phase1c4b_rollback_resistant_composition_contract.spthy` | `audit_a54_rollback_resistant_acceptance_requires_c3b_contract` | original clean run | **SURVIVES** |
| A55 | `oclm_phase1c4b_rollback_resistant_composition_contract.spthy` | `audit_a55_composed_acceptance_uses_latest_state_or_prior_verifier_compromise` | original clean run | **SURVIVES** |
| A57 | `oclm_phase1c5a_revocation_state_core.spthy` | `audit_a57_verifier_revocation_state_never_rolls_back_without_compromise` | original clean run | **SURVIVES** |
| A62 | `oclm_phase1c6a_multi_epoch_generalization_core.spthy` | `audit_a62_current_epoch_acceptance_has_current_evidence` | original clean run | **SURVIVES** |
| A63 | `oclm_phase1c6a_multi_epoch_generalization_core.spthy` | `audit_a63_stale_epoch_acceptance_requires_prior_verifier_compromise` | original clean run | **SURVIVES** |
| A64 | `oclm_phase1c6a_multi_epoch_generalization_core.spthy` | `audit_a64_generalized_epoch_rollback_requires_prior_verifier_compromise` | original clean run | **SURVIVES** |
| A65 | `oclm_phase1c6a_multi_epoch_generalization_core.spthy` | `audit_a65_recorded_epoch_transition_never_rolls_back_without_compromise` | original clean run | **SURVIVES** |
| A66 | `oclm_phase1c6a_multi_epoch_generalization_core.spthy` | `audit_a66_conflicting_direct_epoch_acceptances_require_prior_compromise` | original clean run | **SURVIVES** |
| A68 | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | `audit_a68_stale_generalized_acceptance_has_stale_epoch_evidence` | original clean run | **SURVIVES** |
| A69 | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | `audit_a69_stale_generalized_acceptance_uses_epoch_compromise_state` | original clean run | **SURVIVES** |
| A70 | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | `audit_a70_generalized_epoch_compromise_use_requires_prior_compromise` | original clean run | **SURVIVES** |

## 5.16 Transparency Forks and Equivocation

These attacks test whether conflicting gossip produces evidence and whether forked or conflicting final roots can be accepted without a prior transparency-log compromise.

| ID | Target model | Formal property | Verification method | Final status |
|---|---|---|---|---|
| A58 | `oclm_phase1c5b_transparency_split_view_core.spthy` | `audit_a58_conflicting_gossip_produces_equivocation_evidence` | original clean run | **SURVIVES** |
| A60 | `oclm_phase1c5c_revocation_transparency_lineage_composition_contract.spthy` | `audit_a60_forked_composed_acceptance_requires_prior_log_compromise` | original clean run | **SURVIVES** |
| A72 | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | `audit_a72_forked_generalized_acceptance_requires_prior_log_compromise` | original clean run | **SURVIVES** |
| A73 | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | `audit_a73_conflicting_generalized_transparency_roots_require_prior_compromise` | clean direct rerun | **SURVIVES** |

## 5.17 Provenance Injectivity and Reverse Identity

These properties test the reverse direction of identity binding: whether one fully identical provenance tuple can generate or justify two distinct Child IDs without the compromise condition allowed by the theory.

| ID | Target model | Formal property | Verification method | Final status |
|---|---|---|---|---|
| A74 | `oclm_phase1.spthy` | `audit_a74_same_provenance_distinct_child` | original clean run | **SURVIVES** |
| A75 | `oclm_phase1b1_external_signature.spthy` | `audit_a75_same_provenance_distinct_child` | original clean run | **SURVIVES** |
| A76 | `oclm_phase1b3_claim_collapse.spthy` | `audit_a76_same_provenance_distinct_child` | original clean run | **SURVIVES** |
| A77 | `oclm_phase1b_external.spthy` | `audit_a77_same_provenance_distinct_child` | clean direct rerun | **SURVIVES** |
| A78 | `oclm_phase1c1_composition_contract.spthy` | `audit_a78_same_provenance_distinct_child` | original clean run | **SURVIVES** |
| A79 | `oclm_phase1c2_signed_composition_certificate.spthy` | `audit_a79_same_provenance_distinct_child` | clean direct rerun | **SURVIVES** |
| A80 | `oclm_phase1c3b_c2_c3_composition_contract.spthy` | `audit_a80_same_provenance_distinct_child` | clean direct rerun | **SURVIVES** |

## 5.18 Health and Reachability Properties

The eight health properties cover representative honest, compromised, revocation, transparency, and generalized lifecycles. They establish selected reachability, not universal liveness or fairness.

| ID | Reachable lifecycle | Model | Lemma | Final status |
|---|---|---|---|---|
| H01 | foundational Phase 1 lifecycle is reachable | `oclm_phase1.spthy` | `executable` | **REACHABLE** |
| H02 | complete time-space window lifecycle is reachable | `oclm_phase1b2_time_space_window.spthy` | `executable_complete_window_lifecycle` | **REACHABLE** |
| H03 | honest signed-composition lifecycle is reachable | `oclm_phase1c2_signed_composition_certificate.spthy` | `executable_honest_signed_composition_lifecycle` | **REACHABLE** |
| H04 | valid old-certificate verification after later epoch compromise is reachable | `oclm_phase1c3a_forward_secure_epoch_core.spthy` | `executable_old_certificate_after_later_epoch_compromise` | **REACHABLE** |
| H05 | rollback-resistant composition lifecycle is reachable | `oclm_phase1c4b_rollback_resistant_composition_contract.spthy` | `executable_rollback_resistant_composed_lifecycle` | **REACHABLE** |
| H06 | revocation lifecycle is reachable | `oclm_phase1c5a_revocation_state_core.spthy` | `executable_revocation_lifecycle` | **REACHABLE** |
| H07 | split-view detection lifecycle is reachable | `oclm_phase1c5b_transparency_split_view_core.spthy` | `executable_transparency_split_view_lifecycle` | **REACHABLE** |
| H08 | C6B clean multi-epoch lifecycle is reachable | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | `executable_generalized_clean_multi_epoch_lifecycle` | **REACHABLE** |

## 5.19 Evidence Composition

The final 88-result set is composed as follows:

| Evidence path | Count | Meaning |
|---|---:|---|
| Original warning-free runs | 71 | Results that were already clean in the first battery execution |
| Warning-free direct reruns | 16 | Properties rerun to remove derivation-check or wellformedness warnings |
| Integrated A48 proof | 1 | Final A48 property proved with H1, H2, and H3 in one invocation |
| **Total** | **88** | **All principal verification targets** |

This composition distinguishes the logical result from the cleanliness of the proof artifact. Intermediate warning-bearing logs are retained as historical source material, but the final result set points to warning-free direct evidence or to the integrated A48 proof.

## 5.20 Interpretation

The battery did not find a modeled trace in which the tested lineage, ancestry, state-transition, revocation, transparency, or provenance guarantees failed without the compromise or exception specified by the corresponding property. The eight reachable lifecycles show that the tested theories retain representative executable behavior.

These results support the Phase 2 claim within the exact symbolic scope of the models. They do not establish that every implementation, physical Oracle, blockchain bridge, or governance process is secure, and they do not claim that the 80 attack classes exhaust all future attacks.
