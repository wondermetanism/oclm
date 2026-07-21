# 1. Introduction

Distributed ledgers, databases, certificate systems, and consensus protocols provide mechanisms for storing, ordering, authenticating, and agreeing upon records [3,4].

These mechanisms are valuable, but they primarily answer questions such as:

- Which record was accepted?
- Which transaction occurred first?
- Which key signed the data?
- Which chain has greater weight?
- Which state is currently recognized by a network?

They do not necessarily answer a different question:

> Does the accepted record possess the same authenticated origin and continuous lineage as the original entity it claims to represent?

This distinction becomes especially important when an entity, asset, credential, or state is represented across multiple systems.

A blockchain may preserve an internally consistent history. Another blockchain may preserve a different internally consistent history. A database may contain an identifier identical to one stored elsewhere. A compromised key may produce a formally valid signature. A majority may accept a replacement record.

None of these facts alone establishes that the replacement belongs to the same canonical lineage as the original entity.

The Oracle–Child Lineage Model addresses this problem by binding Child identity to a structured lineage composed from origin, parent relations, time, space, generation context, and continuity.

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

The resulting lineage is not intended merely as another mutable metadata field. It represents the authenticated generation relationship from which the Child derives its canonical identity.

OCLM therefore separates two concepts:

1. the history currently asserted by a record or system; and
2. the canonical lineage derived from authenticated generation and continuity.

This separation produces the central security property examined in this paper:

> A different lineage must not become the canonical lineage of the original Child merely because it has been recorded, signed, accepted, replicated, or selected by consensus.

## 1.1 Research Problem

The research problem addressed by OCLM Phase 2 is:

> Can an adversary cause a Child accepted under the OCLM Phase 1 models to be associated with a substituted origin, ancestry, epoch, temporal condition, spatial condition, or continuity relation without satisfying the explicitly modeled compromise conditions?

This question is broader than ordinary record immutability.

A record may remain internally valid while referring to the wrong entity.  
A signature may verify while having been produced after key compromise.  
A chain may remain internally consistent while diverging from an earlier lineage.  
A token may preserve its identifier while losing continuity with its origin.  
Two systems may each claim to represent the same asset while preserving incompatible histories.

Accordingly, the Phase 2 validation campaign was designed not simply to re-run the Phase 1 lemmas, but to construct explicit attack properties intended to falsify the lineage guarantees.

The campaign examined whether an attacker could:

- substitute a different lineage under the same Child identity;
- construct accepted certificates without the required origin;
- replace parents, time, space, context, or predecessor relations;
- use later key compromise to rewrite earlier epochs;
- revive revoked states;
- force verifier rollback;
- create conflicting but accepted transparency views;
- splice evidence from unrelated executions;
- or legitimize distinct Children under the same provenance.

## 1.2 Contributions

This paper makes five principal contributions.

### 1. A formal adversarial validation battery

It defines and evaluates 80 symbolic adversarial attack classes against the OCLM Phase 1 models.

The battery covers multiple layers of the model rather than testing only one certificate or identity rule.

### 2. Executability and health validation

It evaluates eight health and reachability properties to demonstrate that the security results are not caused by a model in which relevant protocol executions are impossible.

### 3. Validation of canonical lineage non-substitutability

It provides formal evidence that, under the stated assumptions, an alternative origin, ancestry, temporal-spatial tuple, or epoch history cannot be accepted as the canonical past of the same Child without satisfying a modeled compromise condition.

### 4. An integrated proof of the final A48 property

It decomposes the most computationally difficult property into three helper lemmas:

```text
H1: Same Child ID
    → Same lineage

H2: Same generated lineage
    → Same public ancestry tuple

H3: Uncompromised acceptance
    → Matching generated origin
```

H1, H2, H3, and the final A48 property were verified in the same Tamarin execution.

### 5. A higher-layer interpretation for multiple blockchains

It identifies OCLM not as a replacement for blockchains, but as a lineage layer capable of binding records across multiple blockchains, ledgers, and evidence systems.

Individual chains may determine their own internal states. OCLM addresses whether states across those chains belong to the same canonical lineage.

## 1.3 Main Result

The final validation result is:

```text
Symbolic adversarial attack classes: 80
Attack classes ruled out: 80 / 80
Counterexample traces found: 0
Unresolved attack classes: 0

Health and reachability properties: 8
Reachable properties: 8 / 8

A48 helper lemmas: 3
Verified helper lemmas: 3 / 3
```

The 88 principal verification targets were established through:

```text
Original warning-free runs: 71
Warning-free direct reruns: 16
Integrated A48 proof: 1
Total: 88
```

The A48 integrated proof additionally verified three helper lemmas in the same invocation.

## 1.4 Scope of the Claim

The result does **not** claim that OCLM is universally unbreakable.

It does not claim that the 80 attack classes represent every attack possible in all physical and digital environments.

It does not automatically establish the correctness of:

- physical sensors;
- external oracle operators;
- hardware implementations;
- software implementations;
- key-storage devices;
- time and location attestation systems;
- governance processes;
- or cross-chain bridge deployments.

The formal result is narrower and more precise:

> Under the stated OCLM models, symbolic cryptographic abstractions, attacker capabilities, and compromise conditions, no counterexample was found for the 80 tested adversarial properties, and all eight health and reachability properties were reachable.

This distinction is essential.

Phase 2 tests the internal consistency and adversarial resistance of the formalized OCLM properties. Deployment security remains dependent on how real-world evidence is generated, authenticated, transported, and interpreted.

## 1.5 Paper Organization

The remainder of the paper is organized as follows.

**Section 2** defines the conceptual foundations of OCLM and canonical lineage.

**Section 3** describes the Phase 1 formal-model foundation inherited by Phase 2.

**Section 4** defines the adversary and compromise model.

**Section 5** describes the 80 adversarial attack classes and eight health properties.

**Section 6** presents the verification methodology and reproducibility environment.

**Section 7** reports the complete results.

**Section 8** presents the integrated A48 proof.

**Section 9** discusses the use of OCLM as a higher layer binding multiple blockchains.

**Section 10** states assumptions, limitations, and unresolved implementation questions.

**Section 11** concludes the paper.

## 1.6 Relation to Existing Work

OCLM is built using established symbolic-protocol-analysis methods rather than proposing a new proof engine. The active network-adversary tradition originates in work such as Dolev and Yao's formal treatment of public-key protocols [1], while the Tamarin Prover provides an expressive multiset-rewriting framework for unbounded symbolic analysis of concurrent security protocols [2].

Distributed-ledger research generally focuses on chain-local transaction ordering, consensus, finality, and replicated state. Bitcoin introduced a permissionless peer-to-peer ledger based on proof of work [3], while Tendermint represents a BFT approach to ordering events under adversarial conditions [4]. OCLM does not replace these mechanisms; it asks whether states accepted by one or more such systems preserve the same authenticated generation lineage.

OCLM also intersects with, but is not equivalent to, credential and transparency systems. The W3C Verifiable Credentials Data Model separates issuers, holders, verifiers, claims, and securing mechanisms [6]. Certificate Transparency uses append-only logs and consistency evidence to make misissuance and log equivocation detectable [5]. OCLM draws on related concerns—authenticated evidence, revocation, verifier state, and split views—while making canonical lineage and non-substitutability its primary object.

Cross-chain research has studied atomic exchange [7], cryptocurrency-backed assets and interoperability protocols [8], and the trust assumptions required for communication across distributed ledgers [9]. OCLM's distinct position is to define a higher-order lineage relation: it does not merely coordinate transfer or prove that a chain-local event occurred, but asks whether a destination state is an authenticated continuation of the same origin and predecessor history.

This paper therefore presents OCLM as complementary to symbolic protocol verification, distributed-ledger consensus, credential systems, transparency logs, and cross-chain communication. A complete comparative novelty claim against every provenance or interoperability system is outside the scope of Phase 2 and is not required for the formal result reported here.
