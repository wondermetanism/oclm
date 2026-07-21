# 8. Integrated Proof of A48: Past-Epoch Identity Binding

## 8.1 Purpose of A48

A48 is the final and computationally most difficult adversarial class in the Phase 2 campaign.

It asks whether two accepted certificates can refer to the same `child_id` under the same root while carrying different past-epoch identity components, without a relevant target epoch key or root key having been compromised before acceptance.

The property binds the accepted identity of a Child to the public tuple:

```text
epoch
epoch public key
predecessor
issuer
lineage
root
Parent A
Parent B
timeA
timeB
timeC
validity window
space
```

The final property permits a mismatch only when one of the explicitly modeled compromise disjuncts applies.

Accordingly, A48 does not claim that forged evidence remains distinguishable after every possible key compromise. It states that, absent the relevant modeled compromise before either acceptance, the same accepted Child identity cannot carry two different bound public histories.

## 8.2 Why the Direct Attack Search Was Not the Final Evidence

The original adversarial formulation negated the desired universal property and searched for an existential counterexample trace.

The frozen original log completed theory loading, translation, derivation checks, and source saturation, but the attack search did not resolve within the configured 1,800-second limit:

```text
AUDIT TIMEOUT AFTER 1800 SECONDS
```

A timeout is not a counterexample and is not a proof.

The intermediate Phase 2 state therefore classified A48 as unresolved rather than treating resource exhaustion as security evidence.

The final evidence changed the proof strategy, not the inherited C3 protocol rules. The security statement was decomposed into three reusable helper lemmas and a final universal property.

## 8.3 Integrated Theory

The final derived theory is:

```text
models/a48/oclm_phase1c3_a48_decomposed_h1_h2_h3.spthy
```

SHA-256:

```text
6a674d76a6c37479a10c727387a9a5771b7557064781ea4411b658e9bf355133
```

The theory inherits the C3 forward-secure epoch protocol and adds H1, H2, and H3 as proof obligations. It does not weaken the inherited acceptance, generation, signature, epoch, erasure, or compromise rules.

The integrated proof log is:

```text
logs/clean/A48_integrated_H1_H2_H3_final.txt
```

SHA-256:

```text
7a3b2b0e6b64e2d8bfca323dce4ca49c267fb78286044a11e4c39645a4a714c1
```

## 8.4 H1 — Same Child ID Implies the Same Lineage

H1 is:

```text
a48_h1_same_child_id_implies_same_lineage
```

Its premise contains two `ForwardSecureChildAccepted` events under the same `root_pk` and the same `child_id`.

Its conclusion is:

```text
lineage1 = lineage2
```

The purpose of H1 is to close the identity-to-lineage edge.

In the C3 model, the accepted Child identifier is checked against a lineage-bound construction. Under the symbolic term model, two accepted instances carrying the same bound Child identifier cannot detach that identifier from two different lineage terms.

Integrated result:

```text
a48_h1_same_child_id_implies_same_lineage
(all-traces): verified (6 steps)
```

H1 alone does not yet prove equality of every public ancestry field. It establishes equality of the lineage terms to which the shared Child identity is bound.

## 8.5 H2 — Same Generated Lineage Implies the Same Public Tuple

H2 is:

```text
a48_h2_same_generated_lineage_implies_same_public_tuple
```

Its premise contains two `ChildGeneratedInsideEpoch` events under the same `root_pk` and the same `lineage`.

Its conclusion equates:

```text
epoch
epoch public key
predecessor
issuer
child_id
root
Parent A
Parent B
timeA
timeB
timeC
validity window
space
```

between the two generation events.

H2 therefore closes the lineage-to-ancestry edge:

```text
same honestly generated lineage
→ same bound public ancestry tuple
```

Integrated result:

```text
a48_h2_same_generated_lineage_implies_same_public_tuple
(all-traces): verified (2 steps)
```

The lemma is deliberately stated over generation events rather than acceptance events. This prevents accepted evidence from being treated as self-authenticating; the proof still requires a bridge from acceptance back to an actual matching generation event.

## 8.6 H3 — Uncompromised Acceptance Has a Matching Generated Origin

H3 is:

```text
a48_h3_uncompromised_acceptance_has_generated_origin
```

Its premise contains one `ForwardSecureChildAccepted` event and excludes:

```text
a matching epoch-key compromise before acceptance
a root-key compromise before acceptance
```

Its conclusion requires an earlier matching `ChildGeneratedInsideEpoch` event with the same:

```text
root_pk
epoch
epoch public key
predecessor
issuer
child_id
lineage
root
Parents
times
window
space
```

H3 closes the acceptance-to-origin edge:

```text
uncompromised accepted certificate
→ matching prior generation event
```

Integrated result:

```text
a48_h3_uncompromised_acceptance_has_generated_origin
(all-traces): verified (52 steps)
```

H3 was the most expensive helper obligation because it traverses certificate acceptance, credential issuance, signature validity, epoch state, generation ancestry, and the temporal placement of compromise.

## 8.7 Final A48 Property

The final lemma is:

```text
past_epoch_identity_is_bound_or_target_compromised
```

Its premise contains two accepted certificates with:

```text
the same root_pk
the same child_id
```

The conclusion is a disjunction.

### Identity-binding branch

Every bound public field is equal:

```text
epoch1        = epoch2
epoch_pk1     = epoch_pk2
predecessor1  = predecessor2
issuer1       = issuer2
lineage1      = lineage2
root1         = root2
A1            = A2
B1            = B2
timeA1        = timeA2
timeB1        = timeB2
timeC1        = timeC2
window1       = window2
space1        = space2
```

### Explicit compromise branches

Alternatively, one of the following occurred before either acceptance:

```text
the first target epoch key was compromised
the second target epoch key was compromised
the root key was compromised
```

The compromise disjuncts are part of the security statement. They identify conditions under which the modeled evidence boundary no longer supports the uncompromised uniqueness conclusion.

Integrated result:

```text
past_epoch_identity_is_bound_or_target_compromised
(all-traces): verified (8 steps)
```

## 8.8 Logical Composition

The proof can be read as a case analysis.

Assume two accepted certificates share the same `root_pk` and `child_id`.

### Case 1 — A relevant compromise occurred

If either target epoch key or the root key was compromised before either acceptance, one of the explicit compromise disjuncts in the final property is satisfied.

No equality claim beyond the modeled evidence boundary is required in this branch.

### Case 2 — No relevant compromise occurred

Assume none of the final compromise disjuncts applies.

This assumption is strong enough to satisfy the no-prior-compromise premises of H3 separately for each accepted certificate.

Applying H3 twice yields two matching earlier generation events.

The reasoning then proceeds as follows:

```text
two accepted events share the same child_id
        ↓ H1
their accepted lineage terms are equal
        ↓ H3 applied to each acceptance
each acceptance has a matching prior generation event
        ↓ H2
the generated public ancestry tuples are equal
        ↓
the identity-binding branch of final A48 holds
```

Therefore, whether the proof enters the compromise branch or the uncompromised branch, the final disjunction holds.

Schematically:

```text
Accepted₁(root_pk, child_id, tuple₁)
∧ Accepted₂(root_pk, child_id, tuple₂)
        ↓
RelevantCompromise
∨
(
  H3(Accepted₁) ∧ H3(Accepted₂)
  ∧ H1(child_id)
  ∧ H2(lineage)
)
        ↓
RelevantCompromise
∨ tuple₁ = tuple₂
```

This is the core formal connection between Child identity, generated lineage, accepted evidence, and past-epoch ancestry.

## 8.9 Same-Invocation Verification

The final Tamarin execution selected all four obligations:

```text
H1
H2
H3
final A48
```

The integrated log reports:

```text
a48_h1_same_child_id_implies_same_lineage
(all-traces): verified (6 steps)

a48_h2_same_generated_lineage_implies_same_public_tuple
(all-traces): verified (2 steps)

a48_h3_uncompromised_acceptance_has_generated_origin
(all-traces): verified (52 steps)

past_epoch_identity_is_bound_or_target_compromised
(all-traces): verified (8 steps)
```

It also reports:

```text
All wellformedness checks were successful.
processing time: 707.76s
```

Verifying all four selected obligations in the same invocation closes the publication-artifact concern that the final A48 result might be accompanied only by unresolved helper obligations.

The recorded Tamarin exit status is:

```text
NOT_CAPTURED_POSTPROCESS
```

This is not presented as zero because the Tamarin process completed and wrote the full verified log, but a later shell `awk` post-processing error occurred before the stored exit status was printed. The publication preserves that fact rather than reconstructing an unrecorded value.

## 8.10 What A48 Establishes

Within the C3 symbolic model and its compromise assumptions, A48 establishes:

> Two accepted certificates carrying the same Child identity under the same root cannot encode different past-epoch lineages and different bound public ancestry tuples unless a specified target epoch key or the root key was compromised before one of the acceptances.

This is stronger than saying that two serialized certificates are byte-identical.

It binds accepted Child identity to:

- lineage;
- epoch;
- epoch public key;
- predecessor;
- issuer;
- root;
- parents;
- temporal fields;
- validity window;
- and space.

It also distinguishes later compromise from an unexplained retroactive rewrite. Compromise must occur in the temporal position allowed by the final disjunction.

## 8.11 What A48 Does Not Establish

A48 does not establish that:

- physical Oracle observations are necessarily true;
- endpoint software cannot misrepresent an event before it enters the model;
- a compromised root key remains trustworthy;
- hash functions or signatures resist attacks outside the symbolic abstraction;
- every cross-chain bridge refines the C3 theory;
- all implementations preserve the exact field encodings used in the model;
- or denial of service is impossible.

A48 also does not prove end-to-end refinement from every Phase 1 lower-level theory into C6B.

Its contribution is precise: it closes the tested past-epoch substitution property in the C3 forward-secure epoch model.

## 8.12 Significance for Canonical Lineage Non-Substitutability

A48 is the clearest Phase 2 expression of the distinction between changing a record and changing the past of an entity.

An attacker may create another certificate, another ledger entry, another identifier claim, or another accepted history after a modeled compromise.

Without the relevant compromise, however, the tested model does not admit two different bound pasts under the same accepted Child identity.

The result can be summarized as:

```text
same accepted Child identity
+ uncompromised evidence boundary
→ same generated lineage
→ same bound past-epoch ancestry tuple
```

This is the formal core of canonical lineage non-substitutability in the C3 model.

## 8.13 Reproducibility References

The frozen evidence archive contains:

```text
models/a48/oclm_phase1c3_a48_decomposed_h1.spthy
models/a48/oclm_phase1c3_a48_decomposed_h1_h2.spthy
models/a48/oclm_phase1c3_a48_decomposed_h1_h2_h3.spthy
logs/clean/A48_integrated_H1_H2_H3_final.txt
source/A48_INTEGRATED_RUN_METADATA.txt
A48_HELPER_RESULTS.csv
FINAL_88_RESULTS.csv
```

The publication package additionally provides:

```text
catalog/A48_HELPER_RESULTS.csv
results/A48_INTEGRATED_PROOF_SUMMARY.md
results/A48_PROOF_CHAIN.json
```

The archive hash and internal evidence hashes are recorded in `EVIDENCE_REFERENCE.md` and protected by the package-level `MANIFEST.sha256`.

## 8.14 Summary

The original direct A48 attack search timed out and was correctly left unresolved.

The final result did not reinterpret that timeout as success. Instead, it replaced one monolithic search obligation with three explicit helper lemmas and one final universal property.

The integrated run verified:

```text
H1: same Child ID implies the same lineage
H2: the same generated lineage implies the same public tuple
H3: uncompromised acceptance has a matching generated origin
A48: past-epoch identity is bound or a target key was compromised
```

All wellformedness checks succeeded.

A48 therefore moved from an unresolved attack search to a structured, warning-free, integrated proof of the tested past-epoch identity-binding property.
