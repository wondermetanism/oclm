# 9. OCLM as a Higher Layer Binding Multiple Blockchains

## 9.1 Position of OCLM

OCLM is not proposed as a replacement for blockchains.

A blockchain can provide:

- transaction ordering;
- replicated state;
- consensus over a chain-local history;
- signature and authorization checks;
- finality or probabilistic finality;
- economic settlement;
- and availability of recorded evidence.

These functions remain useful. Representative permissionless and BFT ledger designs illustrate these chain-local ordering and consensus roles [3,4].

OCLM addresses a different question:

> When several blockchains, ledgers, databases, or evidence systems refer to an entity, do their records belong to the same authenticated lineage?

Accordingly, OCLM is positioned above chain-local consensus.

```text
Chain A consensus ┐
Chain B consensus ├── OCLM lineage layer
Chain C consensus ┘
```

Each chain may determine which records it accepts internally. OCLM evaluates whether accepted records across those systems preserve a common origin and authorized continuity.

## 9.2 Consensus and Canonical Lineage Are Different Relations

Blockchain consensus determines a chain-local state according to the rules of that blockchain.

Canonical lineage is a relation among:

- origin;
- parent or predecessor states;
- generation events;
- time;
- space or domain;
- context;
- authorization;
- and continuity.

These relations may coincide, but they are not identical.

A chain may reach consensus on a record that:

- was generated from the wrong predecessor;
- reuses an existing identifier;
- was minted without a valid migration event;
- represents a replayed bridge message;
- follows a compromised authority;
- or belongs to a different lineage.

The chain may still be internally consistent.

OCLM therefore treats consensus as one possible source of evidence, not as a mechanism that can redefine origin by itself.

```text
consensus-selected record
≠ automatically canonical successor
```

## 9.3 The Higher-Layer Binding Model

A multi-chain OCLM deployment can be viewed as four logical layers.

### Layer 1 — Chain-local execution

Each blockchain processes transactions and maintains its own local state.

Examples include:

- ownership records;
- token balances;
- burn or lock events;
- credential issuance;
- revocation state;
- application state;
- and governance decisions.

### Layer 2 — Evidence extraction and attestation

Relevant chain-local events are converted into authenticated evidence.

Evidence may include:

- finalized transaction inclusion;
- block or checkpoint references;
- state proofs;
- authenticated event logs;
- threshold attestations;
- hardware attestations;
- or signed Oracle statements.

### Layer 3 — OCLM lineage validation

OCLM evaluates whether the evidence establishes:

- the correct origin;
- the correct parent or predecessor;
- the required temporal order;
- the correct source and destination domains;
- the required authorization context;
- and uninterrupted canonical continuity.

### Layer 4 — Application and settlement action

A destination application decides what to do with the validated lineage result.

Possible actions include:

- minting or activating a successor representation;
- accepting a credential;
- transferring control;
- releasing escrow;
- recognizing ownership;
- or rejecting a substituted lineage.

This separation allows blockchains to retain their native consensus and execution models while OCLM supplies a common lineage criterion above them.

## 9.4 Canonical Cross-Chain Migration

Consider a Child represented on Blockchain A that is to continue on Blockchain B.

A canonical migration requires more than the appearance of a similar identifier on Blockchain B.

At minimum, the lineage relation must connect:

1. the source Child and its current lineage on Blockchain A;
2. an authorized migration, lock, burn, transfer, or succession event;
3. the relevant source-chain evidence;
4. the destination generation event;
5. the resulting destination Child or successor state;
6. and the continuity binding the source and destination states.

Conceptually:

```text
Child_A
  │
  │ authorized migration evidence
  ▼
Transition
  │
  │ destination generation
  ▼
Child_B
```

The destination representation may differ in serialization, contract address, token format, or storage system.

It remains canonical only if the transition preserves authenticated continuity.

Thus:

```text
different representation
+ authenticated continuity
= canonical migration
```

whereas:

```text
same visible identifier
+ no authenticated continuity
= substitution claim
```

## 9.5 Migration Does Not Require a Single Global Chain

OCLM does not require all participating blockchains to merge into one consensus network.

Blockchain A may use one consensus mechanism.  
Blockchain B may use another.  
Blockchain C may be permissioned.  
A separate evidence system may not be a blockchain at all.

The common element is not a shared block-production mechanism.

The common element is the lineage relation.

```text
heterogeneous ledgers
+ authenticated evidence
+ OCLM continuity rules
= higher-order lineage
```

This permits a canonical lineage to pass through multiple technological domains without claiming that those domains have become one ledger.

## 9.6 Chain Reorganizations and Finality

A chain-local reorganization changes which records a blockchain currently recognizes.

OCLM must therefore distinguish between:

- provisional evidence;
- finalized or sufficiently stable evidence;
- later-invalidated evidence;
- and evidence already used to generate a successor state.

A concrete deployment must define the point at which a chain-local event becomes eligible as a lineage parent.

Possible policies include:

- deterministic finality;
- a confirmation-depth rule;
- a checkpoint accepted by a trusted or threshold authority;
- or a finality proof from the source protocol.

OCLM does not create finality where the underlying chain provides none. It makes the finality assumption explicit within the lineage evidence.

A reorganization that removes the asserted source event may therefore invalidate a pending migration or create a dispute requiring a defined recovery rule.

## 9.7 Forks and Competing Chain Histories

When a blockchain forks, more than one chain-local history may claim continuity from the same earlier state.

OCLM does not resolve every fork merely by choosing the longest or economically strongest branch.

Instead, a deployment must define which fork evidence satisfies the lineage policy.

Relevant criteria may include:

- protocol-native finality;
- checkpoint authority;
- governance rules;
- revocation state;
- non-equivocation evidence;
- and continuity with already accepted successor states.

The OCLM contribution is to prevent a branch from becoming the canonical history of a Child solely because it repeats the Child identifier.

A competing branch must establish the required lineage continuity under the applicable policy.

## 9.8 Bridge Messages Are Evidence, Not Identity

A bridge message may state that an asset was locked, burned, transferred, or released. Existing cross-chain research includes atomic swaps, cryptocurrency-backed asset protocols, and systematic analyses of communication across distributed ledgers [7–9].

The message is evidence concerning a transition.

It is not itself the canonical identity of the asset.

A secure cross-chain design must bind the message to:

- the source Child;
- source lineage;
- source-chain event;
- source and destination domains;
- transition nonce or single-use resource;
- authorized destination;
- destination generation;
- and resulting successor lineage.

Without these bindings, an otherwise authentic bridge message may be:

- replayed;
- redirected;
- reused in another domain;
- combined with evidence from another instance;
- or applied to the wrong Child.

The Phase 2 replay, cross-instance, time-space, and composition attack families directly motivate these requirements.

## 9.9 Multiple Representations of One Lineage

A canonical lineage may have more than one representation when the application explicitly permits it.

Examples include:

- a primary asset and a read-only mirror;
- a legal record and a technical representation;
- a credential displayed in several wallets;
- or synchronized states across several systems.

OCLM does not require every representation to be the same object.

It requires the relationship among representations to be explicit.

A deployment must distinguish:

- canonical successor;
- authorized mirror;
- derivative representation;
- temporary escrow representation;
- and unrelated substitute.

These roles must not be inferred solely from identifier equality.

## 9.10 One Canonical Successor and Authorized Multiplicity

Some applications require exactly one active successor.

Others permit several authorized descendants or views.

OCLM can support either policy, but the multiplicity rule must be part of the generation context.

For a single-successor asset:

```text
one valid transition
→ one active canonical successor
```

For an authorized multi-child composition:

```text
one parent lineage
+ explicit multi-child policy
→ several authorized descendants
```

The security objective is not to impose universal uniqueness.

It is to prevent an attacker from converting unauthorized multiplicity into canonical continuity.

## 9.11 Revocation Across Chains

Revocation is difficult when evidence has already propagated to several systems.

An OCLM-based design should bind revocation to:

- the authority entitled to revoke;
- the affected lineage state;
- the effective time or event order;
- the applicable domains;
- and the consequences for descendants.

A destination chain that accepts a stale pre-revocation proof may remain internally consistent while violating the intended cross-chain lineage policy.

The Phase 1 revocation and verifier-monotonicity models, together with the Phase 2 stale-state and unauthorized-reactivation attack classes, establish the formal basis for rejecting such acceptance under the tested rules.

A concrete deployment must still define propagation, latency, recovery, and dispute handling.

## 9.12 Transparency and Split-View Resistance

A cross-chain lineage service may publish checkpoints, roots, or evidence summaries.

If different verifiers receive conflicting views, an attacker may attempt to establish incompatible canonical histories.

OCLM therefore benefits from transparency mechanisms related to append-only logging, consistency proofs, and detection of conflicting views, as exemplified by Certificate Transparency [5]. Such mechanisms may provide:

- globally comparable checkpoints;
- consistency proofs;
- non-equivocation evidence;
- verifier memory;
- and monotonic acceptance rules.

The Phase 1 transparency and split-view theories model these concerns symbolically.

They do not mandate one specific transparency-log implementation, but they demonstrate that canonical lineage should not depend on an unverifiable private view supplied independently to each verifier.

## 9.13 Root and Epoch-Key Structure

A practical multi-chain deployment may use a long-lived root authority together with shorter-lived epoch keys.

The root can authorize epoch succession.

Epoch keys can issue or attest lineage evidence for bounded periods or domains.

This structure supports:

- key rotation;
- reduced exposure;
- forward-security reasoning;
- compartmentalization by chain or application;
- and explicit compromise windows.

A later epoch-key compromise need not automatically rewrite evidence generated under an earlier erased epoch key.

This temporal separation is one of the central properties tested by the C3 model and the A48 proof.

## 9.14 OCLM and Existing Blockchain Assets

OCLM can be applied without discarding existing blockchain assets.

A deployment may attach OCLM lineage evidence to:

- fungible tokens;
- non-fungible tokens;
- credentials;
- real-world asset records;
- supply-chain objects;
- legal documents;
- identity claims;
- governance rights;
- or application-specific states.

The existing blockchain remains responsible for chain-local execution and settlement.

OCLM supplies an additional answer:

> Is this record a canonical continuation of the lineage it claims?

This allows existing blockchains to become components of a broader lineage system rather than isolated sources of absolute identity.

## 9.15 Minimal Cross-Chain Lineage Record

A concrete cross-chain lineage record may include fields such as:

```text
lineage version
source domain
source chain identifier
source object identifier
source state or transaction reference
source finality evidence
source lineage identifier
transition type
transition nonce
authorized destination domain
destination generation evidence
destination object identifier
predecessor lineage identifier
time or event-order constraints
revocation and transparency references
issuer or attesting authority
signature or threshold proof
```

This is an architectural template, not a frozen OCLM wire format.

A future implementation profile must specify:

- canonical serialization;
- domain separation;
- cryptographic algorithms;
- proof formats;
- finality rules;
- verifier state;
- revocation distribution;
- and failure recovery.

## 9.16 Verification Boundary

The Phase 2 result does not yet prove a complete deployed cross-chain system.

The current formal evidence establishes properties of the Phase 1 Tamarin theories and the Phase 2 adversarial battery.

A concrete end-to-end claim would additionally require:

1. a precise implementation architecture;
2. a mapping from implementation events to formal events;
3. proof that the implementation preserves the modeled rules;
4. proof that source-chain and destination-chain evidence satisfy the assumed predicates;
5. and refinement or composition arguments connecting lower-level models to the generalized contract.

In particular, the C6B generalized security-composition contract is an abstract assume-guarantee layer. It is not yet a machine-checked refinement proof connecting every Phase 1 model and every concrete blockchain implementation end to end.

This boundary does not weaken the Phase 2 result. It identifies the next formalization layer required for deployment-specific assurance.

## 9.17 Architectural Invariants

A concrete OCLM cross-chain profile should preserve at least the following invariants.

### Origin binding

Every successor must remain traceable to the authenticated origin required by the application.

### Predecessor binding

A successor must identify the correct prior lineage state.

### Domain binding

Evidence from one chain, network, jurisdiction, or application domain must not be silently reusable in another.

### Transition uniqueness

A single-use migration event must not authorize multiple incompatible successors unless the policy explicitly permits multiplicity.

### Temporal ordering

Generation, compromise, revocation, migration, and acceptance must retain their required event order.

### Context binding

Evidence from unrelated executions must not be composable into a valid new lineage.

### Monotonic verification

A verifier must not accept stale state after learning a later valid state where the policy requires monotonicity.

### Explicit compromise

Acceptance outside the normal lineage relation must be explainable only through a modeled compromise or governance exception, not through an unexplained substitution.

## 9.18 Example: Three-Chain Lineage

Consider one asset that moves from Blockchain A to Blockchain B and later to Blockchain C.

```text
Origin on A
   │
   │ Transition AB
   ▼
Successor on B
   │
   │ Transition BC
   ▼
Successor on C
```

A chain-local view may contain three different contract addresses and three different object identifiers.

The OCLM view contains one lineage with two authorized transitions.

For the representation on C to be canonical, the evidence must connect:

```text
Origin_A
→ Transition_AB
→ Generation_B
→ Transition_BC
→ Generation_C
```

Creating a new object on C with the same visible label but without this chain of authenticated continuity produces another object, not the canonical successor.

## 9.19 Security Interpretation

The higher-layer interpretation of OCLM can be summarized as follows.

Blockchains answer:

```text
What state did this chain accept?
```

OCLM asks:

```text
What authenticated lineage does this state belong to?
```

A blockchain can protect the integrity of its own record sequence.

OCLM is intended to protect the identity relation that crosses those sequences.

Therefore:

```text
blockchain integrity
+ OCLM lineage continuity
= stronger cross-system identity assurance
```

The two mechanisms are complementary.

## 9.20 Summary

OCLM does not require the abandonment of existing blockchains.

It allows multiple blockchains and evidence systems to remain independent while participating in one authenticated lineage.

The essential distinction is:

```text
chain-local consensus
≠ cross-system canonical lineage
```

A canonical migration may change chain, representation, contract, or storage location.

It must not change origin and continuity without creating a different lineage.

This is the architectural role of OCLM as a higher layer binding multiple blockchains.
