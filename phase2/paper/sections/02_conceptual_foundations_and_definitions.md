# 2. Conceptual Foundations and Definitions

## 2.1 Entities, Records, and Evidence

OCLM distinguishes among three different objects:

1. an entity or state that was generated;
2. a record claiming that the entity or state was generated; and
3. evidence supporting the relationship between that record and the generation event.

These objects may correspond, but they are not identical.

A database row is a record.  
A blockchain transaction is a record.  
A certificate is evidence.  
A signature is evidence concerning a key and a message.  
A consensus result is evidence that a network accepted a state.

None of these objects, in isolation, is identical to the generation event itself.

OCLM therefore does not define canonical identity solely through the continued existence of a particular record. It defines identity through the authenticated relationship among origin, generation conditions, ancestry, and continuity.

## 2.2 Oracle

An **Oracle** is a source, authority, mechanism, or evidence boundary that participates in establishing a generation fact.

The term does not necessarily refer to a single trusted server or human administrator.

Depending on the application, an Oracle may be:

- a cryptographic authority;
- a physical sensor;
- a hardware root of trust;
- a legal or administrative authority;
- an external protocol;
- a threshold group;
- an authenticated application;
- a blockchain state;
- or a composition of multiple evidence sources.

The role of the Oracle is not to create truth by declaration.

Its role is to supply authenticated evidence concerning an event, state, condition, or generation relationship.

An Oracle may be compromised, mistaken, unavailable, or contradicted. OCLM therefore treats Oracle evidence as part of a larger lineage composition rather than as an unlimited source of truth.

## 2.3 Parents and Predecessors

A **Parent** is an entity, state, input, lineage, or authority that participates in the generation of a Child.

A model may contain:

```text
Parent A
Parent B
```

or a more general set of parents and predecessors.

Parents need not always represent biological or physical parenthood. They may represent:

- prior ownership states;
- predecessor credentials;
- source and destination systems;
- two parties to an agreement;
- an object and an authorizing authority;
- two source lineages being composed;
- or previous protocol states.

A **predecessor** is the immediately preceding state from which succession is asserted.

Parenthood describes participation in generation.  
Predecessorship describes continuity from an earlier state.

The distinction is important because a Child may be generated from several inputs while continuing only one particular prior lineage.

## 2.4 Child

A **Child** is the entity, state, certificate, asset representation, or derived identity produced through an OCLM-recognized generation event.

A Child is not canonically identified merely because a system assigns it a particular identifier.

Its identity is derived from the lineage under which it was generated.

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

Here, `G` represents an authenticated generation relationship rather than a universal implementation-specific function.

The precise representation differs among the Phase 1 formal theories. Some models include root keys, epoch keys, predecessors, issuers, parent order, time windows, spatial domains, interaction contexts, certificates, revocation state, or transparency state.

The common principle is that the Child derives from a structured lineage rather than from a free-standing label.

## 2.5 Time

**Time** represents the temporal conditions under which generation, authorization, observation, succession, issuance, or acceptance occurs.

OCLM does not assume that one timestamp alone proves historical truth.

A temporal binding may include:

- event order;
- validity windows;
- issuance time;
- generation time;
- acceptance time;
- epoch membership;
- expiration;
- revocation order;
- or relations among several events.

The formal models use event-order relations and model-specific temporal fields to distinguish, for example:

- compromise before acceptance;
- compromise after generation;
- revocation before later use;
- and a later epoch compromise from an earlier erased epoch.

This prevents a later event from being automatically interpreted as if it had occurred earlier.

## 2.6 Space

**Space** represents the domain in which an event, identity, observation, or authorization is valid.

Space may refer to physical location, but it is not limited to physical geography.

It may represent:

- a physical location;
- a jurisdiction;
- a network;
- a blockchain;
- a computational domain;
- a hardware environment;
- an administrative scope;
- or a protocol namespace.

Two records may contain otherwise similar data while belonging to different spatial or logical domains.

OCLM therefore allows spatial conditions to participate in lineage identity.

A record generated in one domain does not automatically inherit the canonical lineage of a record generated in another domain merely because their visible identifiers match.

## 2.7 Context

**Context** is the collection of rules, interactions, environmental conditions, and auxiliary evidence under which generation occurs.

Context may include:

- authorization policy;
- contract state;
- transaction conditions;
- parent interaction;
- execution environment;
- protocol phase;
- governance decision;
- or external evidence.

Context prevents an attacker from extracting individually valid components from unrelated executions and combining them into a new lineage claim.

Evidence that is valid in one interaction does not automatically remain valid when transplanted into another generation context.

## 2.8 Continuity

**Continuity** is the authenticated relationship connecting a prior state or lineage to a later state or lineage.

Continuity may be established through:

- a valid predecessor reference;
- an authorized transfer;
- an epoch transition;
- a signed succession certificate;
- a monotonic verifier state;
- revocation-aware transition;
- or a composition contract.

Continuity is not equivalent to visual similarity or identifier reuse.

A later record may have the same name or token number as an earlier record while lacking authenticated continuity with it.

Conversely, a legitimate successor may have a different representation, location, ledger, or implementation while remaining part of the same canonical lineage.

This distinction is central to cross-chain migration.

## 2.9 Lineage

A **lineage** is the authenticated composition of the elements that determine how a Child arose.

At the conceptual level, it may be represented schematically as:

```text
L = Lineage(
    Origin,
    Parents,
    Time,
    Space,
    Context,
    Continuity
)
```

or, in a cryptographically bound implementation:

```text
L = H(
    domain_tag,
    Origin,
    Parents,
    Time,
    Space,
    Context,
    Continuity
)
```

This expression is schematic. The Phase 1 theories instantiate the lineage structure with model-specific fields.

In the forward-secure epoch model, for example, lineage is additionally bound to elements such as:

- a root;
- an epoch;
- an epoch public key;
- a predecessor;
- an issuer;
- parent identities;
- temporal fields;
- a validity window;
- a spatial field;
- and interaction context.

The security significance of lineage is that changing a bound component produces a different lineage term under the symbolic model.

## 2.10 Child ID

A **Child ID** is an identifier derived from or cryptographically bound to a lineage.

Conceptually:

```text
ChildID = H(
    child_domain_tag,
    Lineage
)
```

A Child ID is therefore not intended to be an arbitrary label independent of generation history.

Under this construction:

```text
same Child ID
→ same bound lineage
```

within the modeled symbolic assumptions.

This relationship was directly tested in the A48 helper lemma H1.

The purpose of the binding is not merely to make collisions computationally difficult. It is to ensure that the identity reference used by the protocol cannot be detached from the lineage that generated it.

## 2.11 Composition Certificate

A **Composition Certificate** is evidence that a Child or lineage state was generated, composed, issued, or accepted under specified conditions.

A certificate may bind:

- a Child ID;
- lineage;
- origin;
- parents;
- predecessor;
- issuer;
- root authority;
- epoch;
- time and space;
- and relevant context.

A valid signature over a certificate demonstrates that the signing key authenticated the encoded statement under the cryptographic model.

It does not, by itself, prove that the signer was uncompromised or that every external fact encoded in the certificate was physically true.

This issuer–evidence–verifier separation is compatible with, but not identical to, general verifiable-credential models [6].

OCLM therefore evaluates certificate validity together with:

- issuance events;
- generation events;
- compromise order;
- key erasure;
- revocation;
- verifier state;
- and lineage consistency.

## 2.12 Acceptance

**Acceptance** is a protocol or verifier event indicating that submitted evidence satisfies the modeled verification conditions.

Acceptance is not defined as an unrestricted declaration of truth.

It means that the evidence passed the rules specified by the model.

The security question is therefore not simply whether acceptance can occur, but:

> Under which preceding events, generation facts, or compromise conditions can acceptance occur?

Many Phase 1 and Phase 2 properties follow the structure:

```text
Accepted
→ Legitimate origin or explicitly modeled compromise
```

This makes compromise conditions visible rather than allowing invalid acceptance to be treated as unexplained protocol behavior.

## 2.13 Canonical Lineage

A **canonical lineage** is the lineage supported by the authenticated origin, parent relationships, temporal-spatial conditions, generation context, and continuity recognized by the OCLM model.

Canonical does not mean:

- most popular;
- longest;
- most replicated;
- most profitable;
- accepted by the largest network;
- or recorded by the most powerful actor.

It means that the lineage preserves the authenticated generation relationship required by the model.

Consensus may select a record.

A canonical-lineage determination asks whether that record belongs to the authenticated succession of the entity it claims to represent.

This produces an important distinction:

```text
consensus-selected history
≠ necessarily canonical lineage
```

Consensus may supply evidence.  
It does not independently redefine origin.

## 2.14 Lineage Equivalence

Two records may represent the same canonical lineage even when their serialized forms, storage systems, or network locations differ.

Lineage equivalence depends on whether they preserve the same bound origin and continuity, not whether their raw bytes are identical.

Accordingly:

```text
different record
≠ necessarily different lineage
```

and:

```text
same visible identifier
≠ necessarily same lineage
```

OCLM evaluates the bound generation relationship rather than superficial record equality.

## 2.15 Substitution

A **substitution** occurs when a record or entity from a different lineage is asserted to be the canonical continuation or past of an existing Child.

Examples include:

- assigning the same Child ID to a different origin;
- replacing one parent with another;
- altering the relevant time or space;
- inserting an unrelated predecessor;
- combining evidence from separate executions;
- or reproducing an asset representation without authorized continuity.

Substitution attempts to erase the distinction between two different generation histories.

The central OCLM security objective is that substitution must not succeed unless an explicitly modeled compromise condition explains why the verifier can no longer distinguish the evidence.

## 2.16 Migration

A **migration** is an authorized continuation of a lineage into a different system, ledger, representation, or domain.

Migration may involve:

- movement from Blockchain A to Blockchain B;
- replacement of one credential representation with another;
- rotation from one epoch key to the next;
- transfer between owners;
- transition between protocol versions;
- or relocation into another administrative domain.

Migration does not require every record representation to remain identical.

It requires authenticated continuity.

Conceptually:

```text
Original lineage
    ↓ authorized transition
Successor lineage state
```

The successor may exist on a different blockchain while remaining connected to the same origin.

Migration therefore differs from substitution as follows:

```text
Migration:
different representation
+ authenticated continuity
= canonical succession
```

```text
Substitution:
different lineage
+ missing or fabricated continuity
= non-canonical replacement
```

## 2.17 Cross-Chain Migration

In a cross-chain setting, the source chain and destination chain may each maintain internally valid records.

OCLM does not determine canonical migration merely by asking whether the destination chain minted a corresponding token or accepted a bridge message.

A canonical cross-chain migration requires evidence connecting:

1. the source lineage state;
2. an authorized transition or lock, burn, transfer, or succession event;
3. the destination generation event;
4. the resulting destination Child;
5. and the continuity between them.

Conceptually:

```text
Source Child on Blockchain A
        ↓
Authenticated migration event
        ↓
Successor Child on Blockchain B
```

Without that continuity, a destination-side representation is a new claim, not a canonical successor.

OCLM is therefore intended to bind several blockchain-local histories into one higher-order lineage without requiring the blockchains themselves to become one chain.

## 2.18 Formal Security Objective

The principal conceptual security objective may be stated as follows.

Let two accepted records claim the same Child identity.

If no relevant root or target epoch key was compromised under the modeled conditions, then the records must correspond to the same canonical lineage and the same bound public ancestry components.

Schematically:

```text
Accepted(C1, ChildID)
∧ Accepted(C2, ChildID)
∧ NoRelevantCompromise
→ Lineage(C1) = Lineage(C2)
```

and, for lineage-bound components:

```text
Lineage(C1) = Lineage(C2)
→ PublicTuple(C1) = PublicTuple(C2)
```

The public tuple may include model-specific values such as:

- origin;
- epoch;
- epoch public key;
- predecessor;
- issuer;
- root;
- parents;
- time fields;
- validity window;
- and space.

This is the formal basis for canonical lineage non-substitutability.

## 2.19 Conceptual Summary

OCLM separates identity from mere identifier equality.

It separates historical truth from current record acceptance.

It separates authorized migration from lineage substitution.

It separates key compromise from retroactive modification of generation facts.

Its core conceptual chain is:

```text
Authenticated origin
        ↓
Generation conditions
        ↓
Parents and predecessor
        ↓
Time, space, and context
        ↓
Continuity
        ↓
Lineage
        ↓
Child identity
```

A different record may describe this chain.

A different system may store this chain.

A different blockchain may continue this chain.

But a different chain of generation does not become the same canonical lineage merely because it adopts the same visible identity.
