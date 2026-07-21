# 7. Complete Verification Results

## 7.1 Final Outcome

The normalized Phase 2 evidence contains exactly 88 principal verification targets: 80 symbolic adversarial attack classes and eight health and reachability properties.

The final outcome is:

```text
Symbolic adversarial attack classes: 80
Attack classes ruled out:            80 / 80
Counterexample traces found:          0
Unresolved attack classes:            0

Health and reachability properties:   8
Reachable health properties:          8 / 8
```

For 79 attack classes, the prohibited condition was expressed as an `exists-trace` property and the final selected Tamarin evidence reported `falsified - no trace found`. A48 was closed by an integrated `all-traces` proof in which H1, H2, H3, and the final past-epoch identity property were verified in the same invocation.

The result is a statement about the tested symbolic models and assumptions. It is not an empirical probability of compromise and is not a claim that every attack outside the formalized threat model has been enumerated.

## 7.2 Evidence Composition

The 88 principal results were selected from three evidence paths.

| Evidence path | Count | Composition |
| --- | ---: | ---: |
| Original warning-free runs | 71 | 64 attacks + 7 health properties |
| Warning-free direct reruns | 16 | 15 attacks + H03 |
| Integrated A48 all-traces proof | 1 | A48, supported by H1/H2/H3 in the same invocation |
| Total principal targets | 88 | 80 attacks + 8 health properties |

The 16 clean direct reruns replaced warning-bearing completed results with warning-free final evidence. They did not add new principal targets. The three A48 helper lemmas are supporting obligations and are not counted among the 80 attack classes or the 88 principal targets.

## 7.3 Results by Attack Family

Every attack family in the Phase 2 taxonomy completed with all selected properties in `SURVIVES`, zero counterexamples, and zero unresolved targets.

| Attack family | Targets | SURVIVES | Counterexamples | Unresolved |
| --- | ---: | ---: | ---: | ---: |
| Lineage and Identity Substitution | 4 | 4/4 | 0 | 0 |
| Cross-Instance Ancestry Splicing | 4 | 4/4 | 0 | 0 |
| Replay, Single Use, Staleness, and Rollback | 4 | 4/4 | 0 | 0 |
| Temporal Boundaries of Key Compromise | 4 | 4/4 | 0 | 0 |
| Revocation and Unauthorized Reactivation | 5 | 5/5 | 0 | 0 |
| Transparency and Split-View Acceptance | 4 | 4/4 | 0 | 0 |
| Time, Space, and Oracle Binding | 4 | 4/4 | 0 | 0 |
| Final Composition and Canonical Conflict | 4 | 4/4 | 0 | 0 |
| Lineage, Identity, and Ancestry Invariants | 14 | 14/14 | 0 | 0 |
| Composition and Evidence Boundaries | 4 | 4/4 | 0 | 0 |
| Adversarial Semantics and Resource Reuse | 1 | 1/1 | 0 | 0 |
| Temporal Boundaries and State Transitions | 17 | 17/17 | 0 | 0 |
| Transparency Forks and Equivocation | 4 | 4/4 | 0 | 0 |
| Provenance Injectivity and Reverse Identity | 7 | 7/7 | 0 | 0 |

The result is not concentrated in one narrow identity lemma. It spans lineage substitution, ancestry splicing, one-time resource use, temporal compromise boundaries, revocation, rollback, transparency, generalized composition, and provenance injectivity.

## 7.4 Results Across the Phase 1 Model Set

The final 88 targets cover all 17 Phase 1 Tamarin models. The table below counts the principal attack and health properties associated with each model in `FINAL_88_RESULTS.csv`.

| Phase 1 model | Attack targets | Health targets | Total | Selected results |
| --- | ---: | ---: | ---: | ---: |
| `oclm_phase1c6b_generalized_security_composition_contract.spthy` | 9 | 1 | 10 | PASS |
| `oclm_phase1.spthy` | 6 | 1 | 7 | PASS |
| `oclm_phase1b2_time_space_window.spthy` | 5 | 1 | 6 | PASS |
| `oclm_phase1c5c_revocation_transparency_lineage_composition_contract.spthy` | 6 | 0 | 6 | PASS |
| `oclm_phase1c6a_multi_epoch_generalization_core.spthy` | 6 | 0 | 6 | PASS |
| `oclm_phase1b_external.spthy` | 5 | 0 | 5 | PASS |
| `oclm_phase1c2_signed_composition_certificate.spthy` | 4 | 1 | 5 | PASS |
| `oclm_phase1c3_forward_secure_epochs.spthy` | 5 | 0 | 5 | PASS |
| `oclm_phase1c4b_rollback_resistant_composition_contract.spthy` | 4 | 1 | 5 | PASS |
| `oclm_phase1c5a_revocation_state_core.spthy` | 4 | 1 | 5 | PASS |
| `oclm_phase1c5b_transparency_split_view_core.spthy` | 4 | 1 | 5 | PASS |
| `oclm_phase1b3_claim_collapse.spthy` | 4 | 0 | 4 | PASS |
| `oclm_phase1c1_composition_contract.spthy` | 4 | 0 | 4 | PASS |
| `oclm_phase1c3a_forward_secure_epoch_core.spthy` | 3 | 1 | 4 | PASS |
| `oclm_phase1c3b_c2_c3_composition_contract.spthy` | 4 | 0 | 4 | PASS |
| `oclm_phase1c4a_verifier_state_monotonicity_core.spthy` | 4 | 0 | 4 | PASS |
| `oclm_phase1b1_external_signature.spthy` | 3 | 0 | 3 | PASS |

The largest single allocation is the generalized C6B composition contract with ten principal targets. The foundational model contributes seven. The remaining targets are distributed across external signatures, time-space windows, claim collapse, composition contracts, forward-secure epochs, verifier monotonicity, rollback resistance, revocation, transparency, and multi-epoch generalization.

A48 is recorded against the C3 forward-secure epoch model. Its final evidence uses a derived C3 theory that adds helper lemmas without weakening the inherited protocol rules.

## 7.5 Health and Reachability Results

All eight health properties were reachable.

```text
H01  foundational Phase 1 lifecycle                          REACHABLE
H02  complete Time/Space window lifecycle                    REACHABLE
H03  honest signed-composition lifecycle                     REACHABLE
H04  old certificate after later epoch compromise            REACHABLE
H05  rollback-resistant composed lifecycle                   REACHABLE
H06  revocation lifecycle                                    REACHABLE
H07  transparency split-view lifecycle                       REACHABLE
H08  generalized clean multi-epoch lifecycle                 REACHABLE
```

These checks do not prove universal liveness, fairness, or deployment availability. They establish that representative honest, compromised, revocation, transparency, and generalized executions remain reachable in the same model set used for the security analysis.

The combined interpretation is therefore:

```text
attack trace absent
+ intended representative lifecycle reachable
→ non-vacuous evidence for the tested property
```

## 7.6 Principal Security Findings

### 7.6.1 Lineage identity remained bound

A01–A04 tested lineage and identity substitution from the foundational model through external signatures, signed composition, and forward-secure composition. All four survived.

This means that the tested theories did not admit the same accepted Child identity under a different bound lineage without the compromise condition explicitly allowed by the corresponding model.

### 7.6.2 Cross-instance ancestry splicing was not reachable

A05–A08 attempted to combine otherwise meaningful Oracle, parent, window, generation, collapse, or certificate evidence from different protocol instances. All four survived.

The result supports the requirement that accepted ancestry must be linked within the matching generation instance rather than assembled from unrelated valid fragments.

### 7.6.3 Later compromise did not automatically rewrite earlier lineage

The key-compromise and temporal-transition families include A13–A16, A46, and A49–A70. These properties distinguish compromise before acceptance from compromise after generation, current epoch evidence from stale evidence, and a live key from an erased earlier epoch key.

All selected properties survived. In the modeled systems, compromise is therefore an explicit event with a temporal scope; it is not treated as a mechanism that silently changes an already established generation history.

### 7.6.4 Rollback, revocation, and transparency conditions remained explicit

The rollback, revocation, and transparency properties tested verifier-state regression, unauthorized certificate reactivation, acceptance with missing revocation state, conflicting checkpoint roots, split views, forked generalized acceptance, and conflicting transparency histories.

All selected attack classes survived. Where acceptance after an adverse event is allowed, the corresponding property requires the modeled exception or prior compromise rather than leaving the event unexplained.

### 7.6.5 Provenance injectivity held across seven model layers

A74–A80 tested the reverse direction of identity binding: whether the same complete provenance could justify two distinct Child identities.

All seven survived across the foundational, external-signature, claim-collapse, external, composition, signed-certificate, and C2/C3 composition theories.

Together with the direct lineage-binding properties, this supports both directions needed for a stable identity relation in the tested symbolic setting:

```text
same accepted Child identity
→ same bound lineage, unless modeled compromise applies

same complete provenance
→ not two distinct Child identities
```

## 7.7 Computational Profile of the Selected Final Evidence

The per-target `processing time` values recorded by Tamarin in the selected final logs have the following profile:

```text
Aggregate of selected per-target processing times: 2985.35 seconds
Median across all 88 targets:                       2.64 seconds
Third quartile across all 88 targets:               8.94 seconds
Maximum selected target:                          726.84 seconds
Median across attack targets:                       2.42 seconds
Median across health targets:                       4.06 seconds
```

The aggregate is a sum of per-target log values. It is not the initial parallel battery wall-clock duration and should not be interpreted as a benchmark for another machine or future verifier version.

The ten slowest selected final-evidence targets were:

| ID | Kind | Seconds | Model | Evidence method |
| --- | ---: | ---: | ---: | ---: |
| A47 | attack | 726.84 | `oclm_phase1c3_forward_secure_epochs.spthy` | clean direct rerun |
| A48 | attack | 707.76 | `oclm_phase1c3_forward_secure_epochs.spthy` | integrated all-traces proof with three verified helper lemmas |
| A46 | attack | 373.17 | `oclm_phase1c3_forward_secure_epochs.spthy` | clean direct rerun |
| A14 | attack | 301.59 | `oclm_phase1c3_forward_secure_epochs.spthy` | clean direct rerun |
| A13 | attack | 290.39 | `oclm_phase1c3_forward_secure_epochs.spthy` | clean direct rerun |
| A04 | attack | 69.98 | `oclm_phase1c3b_c2_c3_composition_contract.spthy` | clean direct rerun |
| A43 | attack | 59.75 | `oclm_phase1b_external.spthy` | clean direct rerun |
| A80 | attack | 34.13 | `oclm_phase1c3b_c2_c3_composition_contract.spthy` | clean direct rerun |
| A08 | attack | 34.08 | `oclm_phase1c3b_c2_c3_composition_contract.spthy` | clean direct rerun |
| A16 | attack | 33.58 | `oclm_phase1c3b_c2_c3_composition_contract.spthy` | clean direct rerun |

The five heaviest targets—A13, A14, A46, A47, and A48—are all associated with the C3 forward-secure epoch model. This concentration indicates that the most expensive part of the campaign was not basic identifier binding, but reasoning about historical acceptance, erased epochs, issuance ancestry, target-key compromise, and past-identity consistency.

## 7.8 The A48 Result in the Complete Set

A48 is one of the 80 attack classes, not an additional result beyond the total.

Its direct existential attack search did not complete within the practical resource budget. The final evidence therefore used a logically structured proof:

```text
H1  same Child ID
    → same lineage

H2  same generated lineage
    → same public ancestry tuple

H3  uncompromised acceptance
    → matching generated origin

Final A48
    → past-epoch identity is bound
      or a modeled target key was compromised
```

All four properties were verified in the same Tamarin invocation, and all wellformedness checks succeeded. Section 8 analyzes that proof in detail.

## 7.9 Interpretation of Zero Counterexamples

“Zero counterexample traces” means that Tamarin did not find a trace satisfying any of the 79 direct prohibited `exists-trace` properties selected as final evidence, and the integrated A48 `all-traces` property was verified.

It does not mean:

- that no implementation defect can exist;
- that physical Oracle evidence is automatically truthful;
- that unmodeled cryptographic primitives cannot fail;
- that denial of service is impossible;
- that governance cannot misuse legitimate authority; or
- that all conceivable cross-chain systems inherit the result without a refinement argument.

The result is strongest when stated precisely:

> Under the stated Phase 1 and Phase 2 symbolic models, attacker capabilities, and compromise conditions, all 80 tested adversarial classes were ruled out, no counterexample trace was found, no attack class remained unresolved, and all eight representative health properties were reachable.

## 7.10 Result Artifacts

The publication package preserves the result analysis in both human-readable and machine-readable forms:

```text
catalog/FINAL_88_RESULTS.csv
results/RESULTS_BY_ATTACK_FAMILY.csv
results/RESULTS_BY_MODEL.csv
results/RESULTS_PROFILE.json
results/SLOWEST_FINAL_EVIDENCE_TARGETS.csv
```

The authoritative per-property mapping remains `catalog/FINAL_88_RESULTS.csv`. The derived Section 7 tables can be regenerated from that file and do not replace the frozen evidence archive.

## 7.11 Summary

Phase 2 produced a complete result set across the 17 inherited Phase 1 models:

```text
80 / 80 adversarial attack classes ruled out
0 counterexample traces
0 unresolved attack classes
8 / 8 health and reachability properties reachable
3 / 3 A48 helper lemmas verified in the integrated invocation
```

The result supports the tested form of canonical lineage non-substitutability: altering records, reusing identifiers, splicing ancestry evidence, rolling back verifier state, exploiting later compromise, or presenting conflicting transparency histories did not create a valid alternative canonical lineage under the modeled conditions.
