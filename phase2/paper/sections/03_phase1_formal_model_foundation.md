# 3. Phase 1 Formal-Model Foundation

## 3.1 Inheritance Boundary

Phase 2 is an adversarial validation layer built on top of the OCLM Phase 1 formal models. It does not replace the Phase 1 operational semantics and does not redefine the meaning of Oracle, Parent, Child, generation, acceptance, compromise, revocation, rollback, or transparency.

The frozen Phase 2 evidence contains 17 primary Tamarin theories inherited from Phase 1. For the adversarial battery, a generated theory was created for each attack class by preserving the selected source theory's rules and appending an attack-oriented lemma. The generated theories explicitly mark that the original rules are unchanged.

The ordinary Phase 2 attack query has the following interpretation:

```text
exists-trace attack_condition
```

A verified trace would constitute a modeled counterexample. A result of:

```text
falsified - no trace found
```

means that the attack condition was not reachable under the selected theory and the stated symbolic assumptions.

A48 required a different proof strategy after direct counterexample search exhausted practical resources. The corresponding all-traces safety property was decomposed into three helper lemmas and then verified together with the final property in one Tamarin invocation. No operational rule was weakened or replaced in the integrated A48 theory; the added material consisted of proof lemmas over the inherited C3 transition system.

## 3.2 Phase 1 Model Family

The Phase 1 foundation is not a single monolithic theory. It is a sequence of focused models and composition contracts that progressively introduce external authentication, time-space binding, claim collapse, signed composition, forward-secure epochs, monotonic verifier state, revocation, transparency, and generalized multi-epoch composition.

| Layer | Tamarin theory | Principal role |
|---|---|---|
| Phase 1 | `oclm_phase1.spthy` | Foundational Oracle–Parent–Child generation, independent verification, single-use pairing, lineage binding, and observable Oracle equivocation |
| Phase 1-B | `oclm_phase1b_external.spthy` | External acceptance with signatures, issuance conditions, compromise exceptions, and pair single-use |
| Phase 1-B1 | `oclm_phase1b1_external_signature.spthy` | Minimal external-signature core linking accepted Child identity to legitimate generation or key compromise |
| Phase 1-B2 | `oclm_phase1b2_time_space_window.spthy` | Ordered parent participation inside a time-space window, closure ordering, and at-most-once generation |
| Phase 1-B3 | `oclm_phase1b3_claim_collapse.spthy` | Survival of authenticated Child identity after denial, alternative claims, or malicious consensus claims collapse |
| Phase 1-C1 | `oclm_phase1c1_composition_contract.spthy` | Composition contract joining time-space generation, claim collapse, authentic acceptance, and explicit compromise branches |
| Phase 1-C2 | `oclm_phase1c2_signed_composition_certificate.spthy` | Signed composition certificates and post-collapse verification of certificate-bound lineage |
| Phase 1-C3 | `oclm_phase1c3_forward_secure_epochs.spthy` | Root credentials, epoch keys, key erasure, later compromise, and preservation of past accepted identity |
| Phase 1-C3A | `oclm_phase1c3a_forward_secure_epoch_core.spthy` | Isolated forward-secure epoch core used to analyze old certificates after later compromise |
| Phase 1-C3B | `oclm_phase1c3b_c2_c3_composition_contract.spthy` | Composition contract connecting signed C2 generation with C3 forward-secure sealing and acceptance |
| Phase 1-C4A | `oclm_phase1c4a_verifier_state_monotonicity_core.spthy` | Monotonic verifier epochs and explicit compromise requirements for rollback success |
| Phase 1-C4B | `oclm_phase1c4b_rollback_resistant_composition_contract.spthy` | Rollback-resistant acceptance of composed lineage under current or stale verifier state |
| Phase 1-C5A | `oclm_phase1c5a_revocation_state_core.spthy` | Revocation lifecycle, missing-update exceptions, verifier rollback, and authority-compromise reactivation |
| Phase 1-C5B | `oclm_phase1c5b_transparency_split_view_core.spthy` | Transparency checkpoints, forked views, gossip, split-view detection, and equivocation evidence |
| Phase 1-C5C | `oclm_phase1c5c_revocation_transparency_lineage_composition_contract.spthy` | Contract composing lineage freshness, revocation, and transparency conditions |
| Phase 1-C6A | `oclm_phase1c6a_multi_epoch_generalization_core.spthy` | Generalized multi-epoch progression, stale-epoch acceptance, and rollback conditions |
| Phase 1-C6B | `oclm_phase1c6b_generalized_security_composition_contract.spthy` | Highest Phase 1 assume–guarantee contract composing multi-epoch, transparency, revocation, and lineage evidence |

The theories are intentionally separated so that a property can be attacked at the layer where its assumptions and events are explicit. This also prevents a large top-level theory from hiding whether a result originates in basic lineage construction, signature validation, epoch erasure, verifier monotonicity, revocation, or transparency.

## 3.3 Foundational Lineage Generation

The foundational `OCLM_Phase1` theory introduces the minimal lineage relation used throughout the model family.

An Oracle establishes a root context. A complementary pair is issued. Parent A and Parent B participate. A Child is generated from the resulting ancestry and later accepted independently of public claims or node votes.

The foundational safety claims include:

- an accepted Child was previously generated;
- a generated Child has the expected ancestry;
- the complementary pair is consumed at most once;
- the Child's lineage remains bound to its generation tuple; and
- Oracle equivocation becomes observable evidence rather than an alternative Child record automatically acquiring legitimacy.

This layer establishes the first separation between claims and generation facts. Public claims may exist, but they do not participate in the independent `VerifyChild` rule.

## 3.4 External Authentication, Time–Space Binding, and Claim Collapse

The Phase 1-B family externalizes and strengthens the basic relation.

### External authentication

`OCLM_Phase1B_External` and `OCLM_Phase1B1_ExternalSignature` introduce symbolic signatures and explicit key-compromise branches. Their acceptance properties follow the general pattern:

```text
Accepted external Child
→ legitimate generation or modeled compromise
```

This prevents a successful signature check from being interpreted without regard to whether the relevant key was compromised.

### Time and space

`OCLM_Phase1B2_TimeSpaceWindow` makes temporal order and spatial scope first-class components of generation. Parent participation must occur within an open window. Generation precedes the matching close event, and one window generates at most one Child.

The model does not claim that an arbitrary timestamp or location string is physically true. It establishes the symbolic ordering and binding conditions that a concrete attestation mechanism would need to supply.

### Claim collapse

`OCLM_Phase1B3_ClaimCollapse` models an environment in which Parent A denies, Parent B offers an alternative, or a malicious consensus decision is published. After the claims are collapsed, a legitimately generated and authenticated Child may still be accepted.

The central point is not that claims disappear. It is that contradictory claims do not retroactively replace the authenticated lineage from which the Child arose.

## 3.5 Composition Contracts and Signed Certificates

Phase 1-C1 joins time-space generation and claim-collapse behavior into a composition contract. The contract exposes both the clean path and explicit compromise paths, allowing proofs to distinguish authentic acceptance from acceptance explained by key compromise.

Phase 1-C2 then adds a signed composition certificate. The certificate binds the generated Child and its ancestry to a signed statement that can be verified after claim collapse.

The C2 properties establish that:

- signed acceptance requires a matching certificate or compromise;
- uncompromised signed acceptance has full ancestry;
- and the signed composition identity is bound unless the modeled key-compromise condition applies.

A certificate is therefore treated as evidence over a structured generation tuple, not as an independent source capable of redefining that tuple.

## 3.6 Forward-Secure Epochs

Phase 1-C3 introduces a root key, epoch credentials, live epoch keys, epoch-key erasure, later epochs, and explicit compromise events.

The principal intended distinction is temporal:

```text
later key compromise
≠ automatic compromise of an erased earlier epoch key
```

The theory models issuance of a composition certificate and erasure of the corresponding epoch key. An attacker may compromise a live later epoch key or the root key under the modeled rules. Verification of an old certificate after later compromise remains tied to the old epoch credential, the generated lineage, and the relevant compromise history.

The canonical C3 theory contains the properties that later became the difficult Phase 2 targets A14, A46, A47, and A48:

- accepted epoch credentials require issuance or root compromise;
- accepted certificates with issued credentials require origin or target-epoch compromise;
- uncompromised acceptance under an erased epoch has full ancestry; and
- past-epoch identity is bound unless a relevant target epoch key or root key was compromised.

C3A isolates the epoch mechanism in a smaller core. C3B composes the signed C2 generation contract with C3 forward-secure sealing and later acceptance.

## 3.7 Monotonic Verifier State and Rollback Resistance

A lineage verifier may itself retain a recorded epoch or security state. If that state can be silently rolled back, a stale but once-valid record may be accepted as current.

Phase 1-C4A models verifier states progressing from `e0` to `e1` to `e2`. Rollback attempts do not lower the state unless a verifier compromise has occurred under the model.

Phase 1-C4B composes that monotonicity contract with lineage acceptance. It distinguishes:

- acceptance at the latest verifier state;
- attempted acceptance at a stale state;
- and stale acceptance explained by prior verifier compromise.

This layer makes continuity dependent not only on the certificate's history, but also on the verifier's authenticated state progression.

## 3.8 Revocation, Transparency, and Split Views

Phase 1-C5 addresses two classes of evidence that become important after issuance.

### Revocation

C5A models active acceptance, revocation, delayed update observation, current-state rejection, verifier compromise, rollback, and authority-compromise reactivation.

It separates a temporary missing-update exception from an illegitimate reactivation. A revoked certificate does not become active again without the modeled authority-compromise condition.

### Transparency and split views

C5B models transparency checkpoints and gossip between views. A compromised log may issue a conflicting checkpoint, but the fork is connected to a prior log compromise, and gossip of incompatible views produces equivocation evidence.

The model therefore does not assume that a transparency log can never fork. It requires that an accepted fork or conflicting root be attributable to the modeled compromise and be detectable through evidence.

### Combined contract

C5C composes revocation, transparency, and lineage freshness. A clean acceptance must carry current component evidence. Revoked, forked, or stale acceptance must be explained by a specific exception or prior compromise rather than being silently treated as canonical.

## 3.9 Generalized Multi-Epoch Composition

Phase 1-C6A generalizes the recorded epoch progression beyond a fixed small sequence. It models advancement to fresh epochs, clean current-epoch acceptance, verifier compromise, rollback by one recorded epoch, and stale acceptance after compromise.

Phase 1-C6B imports the C5C and C6A contracts into a highest-level generalized security composition theory. It covers:

- clean multi-epoch acceptance;
- forked transparency acceptance;
- stale-epoch acceptance;
- revocation exceptions;
- generalized verifier compromise;
- conflicting epoch histories; and
- conflicting transparency roots.

The resulting contract expresses the top-level guarantees expected when lineage, epoch progression, revocation, and transparency evidence are jointly required.

## 3.10 Composition Semantics and Current Proof Boundary

The Phase 1 model family combines two proof styles.

First, several theories model concrete transition rules directly, including generation, signing, key erasure, compromise, rollback, revocation, and gossip.

Second, the later composition theories import previously established component guarantees as abstract contracts. C6B is therefore an assume–guarantee security composition model. It states and verifies the top-level behavior obtained when the imported C5C and C6A contracts hold.

The current artifact set does **not** claim a single machine-checked refinement proof that automatically derives every C6B transition and guarantee from the complete operational semantics of all lower-level theories in one end-to-end proof object.

This boundary is important:

- Phase 1 verifies each primary theory and its stated composition contracts;
- Phase 2 attacks those theories and contracts as formalized;
- a future refinement phase may mechanically connect the lower-level implementations to the highest-level composition contract more directly.

This limitation does not create a Phase 2 counterexample. It defines the present scope of the formal assurance claim.

## 3.11 Phase 2 Use of the Foundation

The Phase 2 battery distributes 80 attack classes across the Phase 1 model family. Each attack is placed against the theory that exposes the relevant events and compromise conditions.

Examples include:

- foundational generation and lineage collision attacks against Phase 1;
- external acceptance and provenance attacks against the Phase 1-B family;
- time-space mutation attacks against B2;
- claim-collapse attacks against B3, C1, and C2;
- epoch issuance, erasure, later compromise, and past-identity attacks against C3 and C3A;
- composed forward-security attacks against C3B;
- rollback attacks against C4A and C4B;
- revocation and reactivation attacks against C5A;
- transparency and split-view attacks against C5B;
- combined stale, revoked, and forked acceptance attacks against C5C; and
- generalized multi-epoch and composition attacks against C6A and C6B.

Eight health and reachability properties are evaluated alongside the attack classes. These traces demonstrate that the relevant honest, compromised, revoked, stale, forked, and multi-epoch paths are executable where the model intends them to be executable.

The Phase 2 result must therefore be read as a model-family result rather than as a claim about one isolated lemma. The campaign attacks the lineage concept at several abstraction levels and across multiple state-evolution mechanisms.

## 3.12 Section Summary

The Phase 1 foundation develops OCLM from basic Child generation into a generalized security composition contract.

Its progression can be summarized as:

```text
Generation and ancestry
        ↓
External authentication
        ↓
Time and space
        ↓
Claim collapse
        ↓
Signed composition
        ↓
Forward-secure epochs
        ↓
Monotonic verifier state
        ↓
Revocation and transparency
        ↓
Generalized multi-epoch composition
```

Phase 2 inherits this foundation without weakening its operational rules and asks whether explicitly constructed attack conditions can violate the corresponding lineage guarantees.
