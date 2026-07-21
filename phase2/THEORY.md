# Oracle–Child Lineage Model
## A Theory of Canonical Lineage, Identity, and Non-Substitutability

## 1. What OCLM Is

The **Oracle–Child Lineage Model (OCLM)** is not merely a theory for making records immutable.

OCLM concerns the **canonical lineage** of an entity:

- from which origin it arose,
- through which parents or predecessor states,
- at what time,
- within what space or domain,
- and through which continuous generation process.

Records, signatures, databases, blockchains, certificates, and consensus outcomes are mechanisms for representing, preserving, and verifying claims about events.

Changing those records, however, does not cause an event that already occurred to become a different event.

OCLM treats this distinction as a formal structural property.

> **Changing a record is not the same as changing the lineage of truth.**

## 2. The Identity of a Child

In OCLM, a Child is not defined by a name, identifier, token number, database row, or ledger entry alone.

The canonical identity of a Child is derived from the composition of at least the following elements.

### Oracle / Origin

The origin of the Child, or an authority or mechanism that authenticates its generation.

### Parents

The parents, predecessors, inputs, owners, states, or prior lineages involved in generating the Child.

### Time

The temporal conditions under which generation, authorization, succession, or acceptance occurred.

### Space

The spatial, jurisdictional, computational, or environmental domain in which generation, observation, or authorization occurred.

### Context

The rules, environment, interactions, and conditions necessary for generation.

### Continuity

The authenticated succession from a preceding state or lineage to the next state or lineage.

Conceptually:

```text
Child = G(
    Oracle,
    Parents,
    Time,
    Space,
    Context,
    Continuity
)
```

These components determine a lineage, and the lineage determines the canonical identity of the Child.

An entity may be assigned the same name, appearance, identifier, or asset representation as another entity. If its origin, parents, time, space, context, or continuity differ, however, it does not belong to the same canonical lineage.

It is not a replacement for the original Child.

It is **a different entity arising from a different lineage**.

## 3. Canonical Lineage Non-Substitutability

The central property of OCLM is **canonical lineage non-substitutability**.

Suppose an adversary modifies historical records and constructs a replacement history containing different parents, a different origin, a different time, or a different space.

The existence or acceptance of that replacement record does not cause it to become the canonical past of the original Child.

An adversary may be able to:

- create a false record,
- persuade a majority to accept a false claim,
- compromise a key and produce new signatures,
- alter a database,
- reorganize a ledger,
- or reproduce an existing identifier.

None of these actions, by themselves, changes the generation relationship that already occurred.

OCLM distinguishes between:

```text
what a record currently claims to be the lineage
```

and:

```text
the lineage that actually followed from the authenticated origin,
generation conditions, and continuity
```

The purpose of OCLM is to preserve the ability to distinguish the latter from the former, even when records are altered, divided, relocated, or contradicted.

## 4. Records Are Not Truth Itself

Blockchains, databases, signatures, certificates, and audit logs are important.

They are not, however, truth itself.

They are evidence submitted about truth.

Consensus may determine which record a network accepts.

Computational weight may determine which history dominates.

A signature may demonstrate that data was signed using a particular key.

A ledger may preserve the order of states accepted within a particular network.

None of those mechanisms alone completely answers the following question:

> **Does this record possess the same authenticated origin and continuous lineage as the original entity?**

OCLM separates an accepted record from a canonical lineage.

A claim does not become historically true merely because it achieved consensus.

Rather, consensus and records may provide evidence concerning an event whose lineage must still be established.

## 5. A Higher Layer Binding Multiple Blockchains

OCLM is not intended to discard blockchains.

Blockchains already contain substantial assets, records, consensus mechanisms, computational resources, and user communities.

OCLM is designed to preserve those systems while binding multiple blockchains and ledgers at a higher layer through canonical lineage.

```text
Blockchain A ─┐
Blockchain B ─┼── OCLM Canonical Lineage
Blockchain C ─┘
```

Each blockchain may report the state accepted within its own system.

OCLM provides a structure for determining whether records across those systems:

- originate from the same source,
- refer to the same Child,
- preserve an authenticated transfer or succession,
- remain continuously connected,
- have been substituted by a different lineage,
- or represent conflicting branches of a previously shared history.

When an asset moves from Blockchain A to Blockchain B, creating the same name, token number, or identifier on Blockchain B does not by itself establish canonical succession.

There must be an unbroken and authenticated lineage from the origin on Blockchain A to the resulting Child on Blockchain B.

OCLM therefore does not merely combine ledger data.

> **It binds records distributed across multiple blockchains into a canonical lineage.**

This is the role of OCLM as a higher-order lineage layer.

## 6. Key Compromise and Historical Truth

When a cryptographic key is compromised, an adversary may be able to produce false signatures or certificates.

Key compromise does not, however, alter a generation event that occurred before the compromise.

It changes the reliability of evidence derived from that key.

It does not retroactively change historical truth.

OCLM separates:

- which key was compromised,
- during which epoch,
- at what point in time,
- and which lineage events preceded or followed that compromise.

Compromise of a later epoch key does not automatically expose an erased earlier epoch key or rewrite the lineage of a Child that was validly generated before the compromise.

Records created after compromise must therefore be distinguishable from authenticated generation facts established before compromise.

## 7. What Phase 2 Tested

OCLM Phase 2 was designed to attack, rather than merely confirm, the Phase 1 formal models.

A total of **80 symbolic adversarial attack classes** were constructed.

They included attempts involving:

- substitution of one Child with a different lineage,
- replacement of Origin, Parents, Time, or Space,
- forgery of past epochs,
- retroactive rewriting after later key compromise,
- forged credentials and certificates,
- splicing of evidence from different lineages,
- rollback,
- restoration after revocation,
- split-view behavior,
- conflicting transparency roots,
- and attempts to legitimize distinct Children under the same provenance.

To exclude the possibility that the model prevented attacks merely because no meaningful execution was possible, Phase 2 also tested **eight health and reachability properties**.

The final result was:

```text
Symbolic adversarial attack classes: 80
Attack classes ruled out: 80 / 80
Counterexample traces found: 0
Unresolved attack classes: 0

Health and reachability properties: 8
Reachable properties: 8 / 8
```

## 8. The Final A48 Result

The final unresolved attack property, A48, concerned whether the accepted past identity of the same Child could be associated with a different lineage without compromise of a relevant target key.

The proof was decomposed into three helper lemmas.

```text
H1:
Same Child ID
→ Same lineage

H2:
Same generated lineage
→ Same public ancestry tuple

H3:
Uncompromised acceptance
→ Matching generated origin
```

The three helper lemmas and the final A48 property were then verified in the same Tamarin invocation.

The integrated result established, within the stated formal model, that the accepted past identity of the same Child could not be substituted with a different lineage unless one of the specified target epoch keys or the relevant root key had been compromised under the modeled conditions.

The integrated proof completed with:

```text
H1: verified
H2: verified
H3: verified
A48 final property: verified

All wellformedness checks successful.
```

## 9. Meaning of the Verification Result

The Phase 2 result does not claim that every attack that could ever exist in the physical or digital world has been enumerated.

It does not imply that every implementation, oracle, sensor, network, administrator, or key-management system is automatically secure.

The result applies to:

- the stated OCLM formal models,
- the modeled cryptographic primitives,
- the explicitly defined adversary capabilities,
- the defined compromise conditions,
- the 80 symbolic adversarial attack classes,
- and the eight health and reachability properties.

Within that scope, no counterexample was found that violated the tested OCLM security properties.

In particular, the tested models did not permit the canonical past of the same Child to be replaced by a different lineage without satisfying the modeled compromise conditions.

Real-world deployments must additionally address:

- oracle trust boundaries,
- the connection between physical events and digital evidence,
- key custody and rotation,
- time attestation,
- space or location attestation,
- administrative separation,
- implementation correctness,
- and operational security.

## 10. The Position of OCLM

OCLM is not itself a blockchain.

It is not a new voting mechanism.

It is not a longest-chain rule.

It is not a standalone signature scheme.

It is a theory and formal model for composing evidence through:

- origin,
- parents,
- time,
- space,
- context,
- and continuity.

> **Blockchains preserve records. OCLM binds their lineages.**

Individual blockchains may determine their internal state.

OCLM is intended to determine whether states across different chains belong to the same canonical lineage.

The objective of OCLM is not merely to create one record that can never be damaged.

Its broader objective is:

> **to preserve the identity of an entity’s origin and lineage even when records are altered, divided, migrated, contradicted, or claimed by substitutes.**

## Canonical Statement

> **A record may be changed.  
> A claim may be replaced.  
> A ledger may be reorganized.  
> Consensus may select a different history.  
>  
> But a different lineage does not become the canonical lineage of the original Child merely because it is recorded or accepted as such.**

## Attribution

**Oracle–Child Lineage Model (OCLM)**  
Conceived and designed by Hirofumi Kureha (HiRO).  
First published by WonderMetanism Inc.

Copyright © 2026 Hirofumi Kureha (HiRO).  
Licensed and administered by WonderMetanism Inc.
