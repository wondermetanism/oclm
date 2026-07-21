# OCLM Phase 2 — Attack and Health Catalog

This catalog is derived directly from the frozen `FINAL_88_RESULTS.csv`. The Japanese objective text below is preserved exactly from the final evidence set. The lemma identifier, target model, verification method, evidence hashes, and final result remain available in the adjacent CSV.

## Final counts

- Attack classes: **80**
- Attack classes ruled out: **80/80**
- Counterexample traces: **0**
- Unresolved attack classes: **0**
- Health and reachability properties: **8/8 reachable**

## Lineage and Identity Substitution / 系譜・同一性置換

These properties directly test whether one accepted Child identity can be associated with two different lineages without the compromise condition required by the selected theory.

| ID | Exact objective (Japanese) | Model | Lemma | Method | Result |
|---|---|---|---|---|---|
| A01 | 同一Childを異なるOracle–Parent–Time–Space系譜として受理できるか | `oclm_phase1.spthy` | `audit_a01_child_lineage_is_bound` | original clean run | **SURVIVES** |
| A02 | Oracle鍵侵害なしで同一Child IDを異なる外部署名系譜へ置換できるか | `oclm_phase1b1_external_signature.spthy` | `audit_a02_external_child_identity_is_bound_or_compromised` | original clean run | **SURVIVES** |
| A03 | Oracle鍵侵害なしで同一Child IDを異なる署名済み構成系譜へ置換できるか | `oclm_phase1c2_signed_composition_certificate.spthy` | `audit_a03_signed_composition_identity_is_bound_or_compromised` | original clean run | **SURVIVES** |
| A04 | 対象旧epoch鍵・root侵害なしで同一Child IDを異なるforward-secure系譜へ置換できるか | `oclm_phase1c3b_c2_c3_composition_contract.spthy` | `audit_a04_forward_secure_composed_identity_is_bound_or_compromised` | clean direct rerun | **SURVIVES** |

## Cross-Instance Ancestry Splicing / Cross-instance・祖先混成

These attacks try to splice otherwise valid parents, windows, generation events, collapse events, or certificates from different protocol instances into one accepted ancestry.

| ID | Exact objective (Japanese) | Model | Lemma | Method | Result |
|---|---|---|---|---|---|
| A05 | 生成済みChildが一致するOracle発行または両Parent参加を欠けたまま成立できるか | `oclm_phase1.spthy` | `audit_a05_generated_child_has_full_ancestry` | original clean run | **SURVIVES** |
| A06 | 未侵害受理で別instanceの窓・親・生成・collapse証拠を混成できるか | `oclm_phase1c1_composition_contract.spthy` | `audit_a06_uncompromised_acceptance_has_full_composed_ancestry` | original clean run | **SURVIVES** |
| A07 | 未侵害の署名受理で完全な同一instance祖先証拠を欠落・混成できるか | `oclm_phase1c2_signed_composition_certificate.spthy` | `audit_a07_uncompromised_signed_acceptance_has_full_ancestry` | original clean run | **SURVIVES** |
| A08 | 未侵害のC2/C3合成受理で別instanceの祖先部品を継ぎはぎできるか | `oclm_phase1c3b_c2_c3_composition_contract.spthy` | `audit_a08_uncompromised_composed_acceptance_has_full_ancestry` | clean direct rerun | **SURVIVES** |

## Replay, Single Use, Staleness, and Rollback / Replay・単回性・stale・rollback

These properties test whether consumed issuance resources can be reused, whether a generation window can produce more than one Child, or whether stale verifier state can be accepted without a modeled compromise.

| ID | Exact objective (Japanese) | Model | Lemma | Method | Result |
|---|---|---|---|---|---|
| A09 | 同一issuance pairから異なる時点に複数Childを生成できるか | `oclm_phase1.spthy` | `audit_a09_complementary_pair_is_single_use` | original clean run | **SURVIVES** |
| A10 | 同一window issuanceから複数生成を成立させられるか | `oclm_phase1b2_time_space_window.spthy` | `audit_a10_window_generates_at_most_once` | original clean run | **SURVIVES** |
| A11 | 後続侵害なしでrollback attemptが検証状態を低下させられるか | `oclm_phase1c4a_verifier_state_monotonicity_core.spthy` | `audit_a11_rollback_attempt_cannot_lower_state_without_later_compromise` | original clean run | **SURVIVES** |
| A12 | 事前Verifier侵害なしでstale状態の構成Childを受理できるか | `oclm_phase1c4b_rollback_resistant_composition_contract.spthy` | `audit_a12_stale_composed_acceptance_requires_prior_verifier_compromise` | original clean run | **SURVIVES** |

## Temporal Boundaries of Key Compromise / 鍵侵害の時間境界

These attacks test whether compromise is incorrectly projected backward in time, whether erased epoch keys can be compromised later, and whether issuance or target-key compromise is required for historical acceptance.

| ID | Exact objective (Japanese) | Model | Lemma | Method | Result |
|---|---|---|---|---|---|
| A13 | 消去済みepoch鍵を後から侵害できるtraceが存在するか | `oclm_phase1c3_forward_secure_epochs.spthy` | `audit_a13_erased_epoch_key_cannot_be_compromised_later` | clean direct rerun | **SURVIVES** |
| A14 | 発行もroot侵害もなくepoch credentialを受理できるか | `oclm_phase1c3_forward_secure_epochs.spthy` | `audit_a14_accepted_epoch_credential_requires_issuance_or_root_compromise` | clean direct rerun | **SURVIVES** |
| A15 | 発行・対象旧鍵侵害・root侵害なしで旧証明書を受理できるか | `oclm_phase1c3a_forward_secure_epoch_core.spthy` | `audit_a15_accepted_old_certificate_requires_issuance_or_target_compromise` | original clean run | **SURVIVES** |
| A16 | 正規contractも対象旧鍵/root侵害もなく合成証明を受理できるか | `oclm_phase1c3b_c2_c3_composition_contract.spthy` | `audit_a16_composed_acceptance_requires_contract_or_target_compromise` | clean direct rerun | **SURVIVES** |

## Revocation and Unauthorized Reactivation / 失効・再有効化

These properties test current-state rejection of revoked certificates, unauthorized reactivation, missing-update exceptions, verifier rollback, and final-composition acceptance after revocation.

| ID | Exact objective (Japanese) | Model | Lemma | Method | Result |
|---|---|---|---|---|---|
| A17 | 失効Authority侵害なしで証明書を再有効化できるか | `oclm_phase1c5a_revocation_state_core.spthy` | `audit_a17_certificate_reactivation_requires_prior_authority_compromise` | original clean run | **SURVIVES** |
| A18 | current revocation stateで失効証明書を受理できるか | `oclm_phase1c5a_revocation_state_core.spthy` | `audit_a18_current_verifier_state_never_accepts_revoked_certificate` | original clean run | **SURVIVES** |
| A19 | update欠落もVerifier侵害もなく失効証明書を受理できるか | `oclm_phase1c5a_revocation_state_core.spthy` | `audit_a19_revoked_acceptance_requires_missing_update_or_verifier_compromise` | original clean run | **SURVIVES** |
| A20 | 明示的例外なしで失効済み最終構成を受理できるか | `oclm_phase1c5c_revocation_transparency_lineage_composition_contract.spthy` | `audit_a20_revoked_composed_acceptance_requires_explicit_exception` | original clean run | **SURVIVES** |
| A71 | 明示的例外なしでrevoked generalized受理を成立させられるか | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | `audit_a71_revoked_generalized_acceptance_requires_explicit_exception` | original clean run | **SURVIVES** |

## Transparency and Split-View Acceptance / Transparency・split-view

These attacks test checkpoint provenance, conflicting roots, conflicting histories for one certificate, and split-view acceptance without prior log compromise.

| ID | Exact objective (Japanese) | Model | Lemma | Method | Result |
|---|---|---|---|---|---|
| A21 | 対応する発行なしでTransparency checkpointを受理できるか | `oclm_phase1c5b_transparency_split_view_core.spthy` | `audit_a21_accepted_checkpoint_requires_matching_issuance` | original clean run | **SURVIVES** |
| A22 | Log侵害なしで同一checkpointへ異なるrootを発行できるか | `oclm_phase1c5b_transparency_split_view_core.spthy` | `audit_a22_conflicting_checkpoint_roots_require_prior_log_compromise` | original clean run | **SURVIVES** |
| A23 | Log侵害なしで同一certificateを異なるroot履歴の下に受理できるか | `oclm_phase1c5b_transparency_split_view_core.spthy` | `audit_a23_same_certificate_conflicting_transparency_histories_require_compromise` | original clean run | **SURVIVES** |
| A24 | Log侵害なしで同一最終構成を競合rootの下に受理できるか | `oclm_phase1c5c_revocation_transparency_lineage_composition_contract.spthy` | `audit_a24_conflicting_composed_roots_require_prior_log_compromise` | original clean run | **SURVIVES** |

## Time, Space, and Oracle Binding / Time・Space・Oracle結合

These properties test whether Child generation and acceptance remain bound to a matching Oracle issuance, time-space window, parent participation, and closed generation event.

| ID | Exact objective (Japanese) | Model | Lemma | Method | Result |
|---|---|---|---|---|---|
| A25 | Oracle発行も鍵侵害もなく外部Childを受理できるか | `oclm_phase1b_external.spthy` | `audit_a25_external_acceptance_requires_issue_or_compromise` | clean direct rerun | **SURVIVES** |
| A26 | 一致するopen window・両Parent・時空間祖先なしでChildを生成できるか | `oclm_phase1b2_time_space_window.spthy` | `audit_a26_generated_child_has_open_window_ancestry` | original clean run | **SURVIVES** |
| A27 | closed generationもOracle侵害もなく構成Childを受理できるか | `oclm_phase1c1_composition_contract.spthy` | `audit_a27_composed_acceptance_requires_closed_generation_or_compromise` | original clean run | **SURVIVES** |
| A28 | 一致する署名証明書もOracle侵害もなく構成Childを受理できるか | `oclm_phase1c2_signed_composition_certificate.spthy` | `audit_a28_signed_acceptance_requires_certificate_or_compromise` | original clean run | **SURVIVES** |

## Final Composition and Canonical Conflict / 最終合成・canonical競合

These attacks target the composed contracts and generalized model, asking whether final acceptance can occur without all component contracts or whether conflicting epoch histories can be accepted without compromise.

| ID | Exact objective (Japanese) | Model | Lemma | Method | Result |
|---|---|---|---|---|---|
| A29 | C4B/C5A/C5Bの全component contractを満たさず最終受理できるか | `oclm_phase1c5c_revocation_transparency_lineage_composition_contract.spthy` | `audit_a29_composed_acceptance_requires_all_verified_component_contracts` | original clean run | **SURVIVES** |
| A30 | 対応するepoch発行なしでgeneralized epochを受理できるか | `oclm_phase1c6a_multi_epoch_generalization_core.spthy` | `audit_a30_accepted_epoch_requires_matching_prior_issuance` | original clean run | **SURVIVES** |
| A31 | C5C/C6A contract anchorなしでgeneralized final acceptanceへ到達できるか | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | `audit_a31_generalized_acceptance_requires_c5c_and_c6a_contracts` | original clean run | **SURVIVES** |
| A32 | 事前Verifier侵害なしで同一contractの競合epoch履歴を同時受理できるか | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | `audit_a32_conflicting_generalized_epoch_histories_require_prior_compromise` | original clean run | **SURVIVES** |

## Lineage, Identity, and Ancestry Invariants / 理論・同一性・祖先

This family stresses the foundational ancestry and identity invariants across the model progression, including generation-before-acceptance, parent ordering, claim collapse, external evidence, forward-secure ancestry, and A48.

| ID | Exact objective (Japanese) | Model | Lemma | Method | Result |
|---|---|---|---|---|---|
| A33 | 受理されたChildが対応する事前生成なしで成立できるか | `oclm_phase1.spthy` | `audit_a33_accepted_child_was_generated` | original clean run | **SURVIVES** |
| A35 | 生成もOracle鍵侵害もなく外部署名Childを受理できるか | `oclm_phase1b1_external_signature.spthy` | `audit_a35_external_child_requires_generation_or_compromise` | original clean run | **SURVIVES** |
| A36 | 対応windowのclose後にChild生成を成立させられるか | `oclm_phase1b2_time_space_window.spthy` | `audit_a36_generated_child_precedes_matching_close` | original clean run | **SURVIVES** |
| A37 | Parent A参加が生成前かつclose前に存在しないChildを成立させられるか | `oclm_phase1b2_time_space_window.spthy` | `audit_a37_generated_parent_a_precedes_close` | original clean run | **SURVIVES** |
| A38 | Parent B参加が生成前かつclose前に存在しないChildを成立させられるか | `oclm_phase1b2_time_space_window.spthy` | `audit_a38_generated_parent_b_precedes_close` | original clean run | **SURVIVES** |
| A39 | claim collapse後に生成もOracle鍵侵害もないChildを受理できるか | `oclm_phase1b3_claim_collapse.spthy` | `audit_a39_post_collapse_acceptance_requires_generation_or_compromise` | original clean run | **SURVIVES** |
| A40 | claim・consensus・collapseの完全な事前履歴なしでcollapse後受理できるか | `oclm_phase1b3_claim_collapse.spthy` | `audit_a40_post_collapse_acceptance_has_collapse_ancestry` | original clean run | **SURVIVES** |
| A41 | Oracle鍵侵害なしでcollapse後の同一Childを異なる系譜へ置換できるか | `oclm_phase1b3_claim_collapse.spthy` | `audit_a41_post_collapse_child_identity_is_bound_or_compromised` | original clean run | **SURVIVES** |
| A42 | 生成もOracle鍵侵害もなくexternal modelのChildを受理できるか | `oclm_phase1b_external.spthy` | `audit_a42_external_acceptance_requires_generation_or_compromise` | clean direct rerun | **SURVIVES** |
| A43 | Oracle鍵侵害なしでexternal modelの同一Childを異なる系譜へ置換できるか | `oclm_phase1b_external.spthy` | `audit_a43_external_child_lineage_is_bound_or_compromised` | clean direct rerun | **SURVIVES** |
| A45 | Oracle鍵侵害なしでC1合成後の同一Childを異なる系譜へ置換できるか | `oclm_phase1c1_composition_contract.spthy` | `audit_a45_composed_child_identity_is_bound_or_compromised` | original clean run | **SURVIVES** |
| A47 | 旧epoch/root未侵害時に完全な発行・親・生成・消去祖先なしで受理できるか | `oclm_phase1c3_forward_secure_epochs.spthy` | `audit_a47_uncompromised_erased_epoch_acceptance_has_full_ancestry` | clean direct rerun | **SURVIVES** |
| A48 | 対象epoch/root侵害なしで過去epochの同一Childを異なる系譜へ置換できるか | `oclm_phase1c3_forward_secure_epochs.spthy` | `audit_a48_past_epoch_identity_is_bound_or_target_compromised` | integrated all-traces proof with three verified helper lemmas | **SURVIVES** |
| A61 | 事前Verifier侵害なしでstale lineage最終構成を受理できるか | `oclm_phase1c5c_revocation_transparency_lineage_composition_contract.spthy` | `audit_a61_stale_lineage_composed_acceptance_requires_prior_compromise` | original clean run | **SURVIVES** |

## Composition and Evidence Boundaries / 合成・証拠境界

These properties test whether equivocation is evidenced and whether clean composed acceptance retains the current lineage, certificate, transparency, verifier, and generalized security evidence required by the contract.

| ID | Exact objective (Japanese) | Model | Lemma | Method | Result |
|---|---|---|---|---|---|
| A34 | Oracleの競合root提示を証拠なしで不可視化できるか | `oclm_phase1.spthy` | `audit_a34_oracle_equivocation_is_evidenced` | original clean run | **SURVIVES** |
| A56 | Verifier侵害なしで同一contractに競合する検証履歴を成立させられるか | `oclm_phase1c4b_rollback_resistant_composition_contract.spthy` | `audit_a56_same_contract_conflicting_verifier_histories_require_compromise` | original clean run | **SURVIVES** |
| A59 | clean最終受理をcurrent lineage・active certificate・canonical root証拠なしで成立させられるか | `oclm_phase1c5c_revocation_transparency_lineage_composition_contract.spthy` | `audit_a59_clean_composed_acceptance_has_current_component_evidence` | original clean run | **SURVIVES** |
| A67 | clean generalized受理を完全なepoch/security証拠なしで成立させられるか | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | `audit_a67_clean_generalized_acceptance_has_complete_evidence` | original clean run | **SURVIVES** |

## Adversarial Semantics and Resource Reuse / 敵対的意味論

This property tests whether the external model accidentally changes the one-time resource semantics inherited from the foundational generation model.

| ID | Exact objective (Japanese) | Model | Lemma | Method | Result |
|---|---|---|---|---|---|
| A44 | external modelで同一issuance pairを複数生成に再利用できるか | `oclm_phase1b_external.spthy` | `audit_a44_external_model_pair_is_single_use` | clean direct rerun | **SURVIVES** |

## Temporal Boundaries and State Transitions / 時間境界・状態遷移

These properties cover monotonic verifier progression, epoch rollback, stale-epoch acceptance, revocation-state rollback, target-compromise usage, and evidence requirements for current or stale generalized acceptance.

| ID | Exact objective (Japanese) | Model | Lemma | Method | Result |
|---|---|---|---|---|---|
| A46 | epoch credential発行済みでもorigin証明書発行・epoch鍵侵害なしで受理できるか | `oclm_phase1c3_forward_secure_epochs.spthy` | `audit_a46_accepted_certificate_with_issued_credential_requires_origin_or_epoch_compromise` | clean direct rerun | **SURVIVES** |
| A49 | 消去済み旧epoch鍵を後から侵害できるか | `oclm_phase1c3a_forward_secure_epoch_core.spthy` | `audit_a49_erased_old_epoch_key_cannot_be_compromised_later` | original clean run | **SURVIVES** |
| A50 | 発行もroot侵害もなくepoch credentialを受理できるか | `oclm_phase1c3a_forward_secure_epoch_core.spthy` | `audit_a50_accepted_epoch_credential_requires_issuance_or_root_compromise` | original clean run | **SURVIVES** |
| A51 | Verifier侵害なしでe1からe0へ巻き戻せるか | `oclm_phase1c4a_verifier_state_monotonicity_core.spthy` | `audit_a51_verifier_state_e1_never_rolls_back_to_e0_without_compromise` | original clean run | **SURVIVES** |
| A52 | Verifier侵害なしでe2からe1へ巻き戻せるか | `oclm_phase1c4a_verifier_state_monotonicity_core.spthy` | `audit_a52_verifier_state_e2_never_rolls_back_to_e1_without_compromise` | original clean run | **SURVIVES** |
| A53 | Verifier侵害なしでe2からe0へ巻き戻せるか | `oclm_phase1c4a_verifier_state_monotonicity_core.spthy` | `audit_a53_verifier_state_e2_never_rolls_back_to_e0_without_compromise` | original clean run | **SURVIVES** |
| A54 | C3B contract anchorなしでrollback-resistant受理へ到達できるか | `oclm_phase1c4b_rollback_resistant_composition_contract.spthy` | `audit_a54_rollback_resistant_acceptance_requires_c3b_contract` | original clean run | **SURVIVES** |
| A55 | 最新状態でも事前Verifier侵害でもない状態で合成受理できるか | `oclm_phase1c4b_rollback_resistant_composition_contract.spthy` | `audit_a55_composed_acceptance_uses_latest_state_or_prior_verifier_compromise` | original clean run | **SURVIVES** |
| A57 | Verifier侵害なしで失効状態を旧状態へ巻き戻せるか | `oclm_phase1c5a_revocation_state_core.spthy` | `audit_a57_verifier_revocation_state_never_rolls_back_without_compromise` | original clean run | **SURVIVES** |
| A62 | current epoch受理をcurrent証拠なしで成立させられるか | `oclm_phase1c6a_multi_epoch_generalization_core.spthy` | `audit_a62_current_epoch_acceptance_has_current_evidence` | original clean run | **SURVIVES** |
| A63 | 事前Verifier侵害なしでstale epochを受理できるか | `oclm_phase1c6a_multi_epoch_generalization_core.spthy` | `audit_a63_stale_epoch_acceptance_requires_prior_verifier_compromise` | original clean run | **SURVIVES** |
| A64 | 事前Verifier侵害なしでgeneralized epoch rollbackを成立させられるか | `oclm_phase1c6a_multi_epoch_generalization_core.spthy` | `audit_a64_generalized_epoch_rollback_requires_prior_verifier_compromise` | original clean run | **SURVIVES** |
| A65 | 記録済みepoch transitionをVerifier侵害なしで逆行させられるか | `oclm_phase1c6a_multi_epoch_generalization_core.spthy` | `audit_a65_recorded_epoch_transition_never_rolls_back_without_compromise` | original clean run | **SURVIVES** |
| A66 | 事前Verifier侵害なしで高epoch受理後に低epochを競合受理できるか | `oclm_phase1c6a_multi_epoch_generalization_core.spthy` | `audit_a66_conflicting_direct_epoch_acceptances_require_prior_compromise` | original clean run | **SURVIVES** |
| A68 | stale generalized受理をstale epoch証拠なしで成立させられるか | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | `audit_a68_stale_generalized_acceptance_has_stale_epoch_evidence` | original clean run | **SURVIVES** |
| A69 | stale generalized受理をepoch compromise使用状態なしで成立させられるか | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | `audit_a69_stale_generalized_acceptance_uses_epoch_compromise_state` | original clean run | **SURVIVES** |
| A70 | 事前Verifier侵害なしでepoch compromise使用イベントを成立させられるか | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | `audit_a70_generalized_epoch_compromise_use_requires_prior_compromise` | original clean run | **SURVIVES** |

## Transparency Forks and Equivocation / Transparency・分岐

These attacks test whether conflicting gossip produces evidence and whether forked or conflicting final roots can be accepted without a prior transparency-log compromise.

| ID | Exact objective (Japanese) | Model | Lemma | Method | Result |
|---|---|---|---|---|---|
| A58 | 競合gossipをequivocation evidenceなしで成立させられるか | `oclm_phase1c5b_transparency_split_view_core.spthy` | `audit_a58_conflicting_gossip_produces_equivocation_evidence` | original clean run | **SURVIVES** |
| A60 | 事前Log侵害なしでforked最終構成を受理できるか | `oclm_phase1c5c_revocation_transparency_lineage_composition_contract.spthy` | `audit_a60_forked_composed_acceptance_requires_prior_log_compromise` | original clean run | **SURVIVES** |
| A72 | 事前Log侵害なしでforked generalized受理を成立させられるか | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | `audit_a72_forked_generalized_acceptance_requires_prior_log_compromise` | original clean run | **SURVIVES** |
| A73 | 事前Log侵害なしでgeneralized最終受理に競合rootを成立させられるか | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | `audit_a73_conflicting_generalized_transparency_roots_require_prior_compromise` | clean direct rerun | **SURVIVES** |

## Provenance Injectivity and Reverse Identity / 完全複製・逆方向同一性

These properties test the reverse direction of identity binding: whether one fully identical provenance tuple can generate or justify two distinct Child IDs without the compromise condition allowed by the theory.

| ID | Exact objective (Japanese) | Model | Lemma | Method | Result |
|---|---|---|---|---|---|
| A74 | 完全に同じOracle–Parent–Time–Space祖先から異なる2つのChild IDを受理できるか | `oclm_phase1.spthy` | `audit_a74_same_provenance_distinct_child` | original clean run | **SURVIVES** |
| A75 | Oracle鍵侵害なしで同一の完全系譜から異なる2つの外部Child IDを受理できるか | `oclm_phase1b1_external_signature.spthy` | `audit_a75_same_provenance_distinct_child` | original clean run | **SURVIVES** |
| A76 | Oracle鍵侵害なしでclaim collapse後の同一完全系譜から異なる2つのChild IDを受理できるか | `oclm_phase1b3_claim_collapse.spthy` | `audit_a76_same_provenance_distinct_child` | original clean run | **SURVIVES** |
| A77 | Oracle鍵侵害なしでexternal modelの同一完全系譜から異なる2つのChild IDを受理できるか | `oclm_phase1b_external.spthy` | `audit_a77_same_provenance_distinct_child` | clean direct rerun | **SURVIVES** |
| A78 | Oracle鍵侵害なしでC1合成の同一完全系譜から異なる2つのChild IDを受理できるか | `oclm_phase1c1_composition_contract.spthy` | `audit_a78_same_provenance_distinct_child` | original clean run | **SURVIVES** |
| A79 | Oracle鍵侵害なしでC2署名済み同一完全系譜から異なる2つのChild IDを受理できるか | `oclm_phase1c2_signed_composition_certificate.spthy` | `audit_a79_same_provenance_distinct_child` | clean direct rerun | **SURVIVES** |
| A80 | 対象旧epoch鍵/root侵害なしで同一forward-secure完全系譜から異なる2つのChild IDを受理できるか | `oclm_phase1c3b_c2_c3_composition_contract.spthy` | `audit_a80_same_provenance_distinct_child` | clean direct rerun | **SURVIVES** |

## Health and reachability checks

| ID | Exact objective (Japanese) | Model | Lemma | Result |
|---|---|---|---|---|
| H01 | Phase 1基礎ライフサイクルが到達可能 | `oclm_phase1.spthy` | `executable` | **REACHABLE** |
| H02 | Time/Space window完全ライフサイクルが到達可能 | `oclm_phase1b2_time_space_window.spthy` | `executable_complete_window_lifecycle` | **REACHABLE** |
| H03 | 署名済み構成の正直ライフサイクルが到達可能 | `oclm_phase1c2_signed_composition_certificate.spthy` | `executable_honest_signed_composition_lifecycle` | **REACHABLE** |
| H04 | 後続epoch侵害後の正規旧証明書検証経路が到達可能 | `oclm_phase1c3a_forward_secure_epoch_core.spthy` | `executable_old_certificate_after_later_epoch_compromise` | **REACHABLE** |
| H05 | rollback-resistant構成ライフサイクルが到達可能 | `oclm_phase1c4b_rollback_resistant_composition_contract.spthy` | `executable_rollback_resistant_composed_lifecycle` | **REACHABLE** |
| H06 | 失効ライフサイクルが到達可能 | `oclm_phase1c5a_revocation_state_core.spthy` | `executable_revocation_lifecycle` | **REACHABLE** |
| H07 | split-view検出ライフサイクルが到達可能 | `oclm_phase1c5b_transparency_split_view_core.spthy` | `executable_transparency_split_view_lifecycle` | **REACHABLE** |
| H08 | C6B clean multi-epochライフサイクルが到達可能 | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | `executable_generalized_clean_multi_epoch_lifecycle` | **REACHABLE** |

## A48 integrated helper obligations

| ID | Lemma | Result | Integrated log |
|---|---|---|---|
| A48-H1 | `a48_h1_same_child_id_implies_same_lineage` | **CLEAN_VERIFIED** | `logs/clean/A48_integrated_H1_H2_H3_final.txt` |
| A48-H2 | `a48_h2_same_generated_lineage_implies_same_public_tuple` | **CLEAN_VERIFIED** | `logs/clean/A48_integrated_H1_H2_H3_final.txt` |
| A48-H3 | `a48_h3_uncompromised_acceptance_has_generated_origin` | **CLEAN_VERIFIED** | `logs/clean/A48_integrated_H1_H2_H3_final.txt` |

## Attribution

**Oracle–Child Lineage Model (OCLM)**  
Conceived and designed by Hirofumi Kureha (HiRO).  
First published by WonderMetanism Inc.

Copyright © 2026 Hirofumi Kureha (HiRO).  
Licensed and administered by WonderMetanism Inc.
