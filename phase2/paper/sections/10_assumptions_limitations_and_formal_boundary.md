# 10. Assumptions, Limitations, and Formal Boundary

## 10.1 Purpose of This Section

The Phase 2 result is strongest when its boundary is explicit.

Formal verification does not become weaker by stating its assumptions. It becomes meaningful because readers can determine exactly which claims were established, which conditions were modeled, and which obligations remain for implementation and deployment.

This section therefore defines:

- the symbolic cryptographic assumptions;
- the event and compromise assumptions;
- the relationship between records and external truth;
- the scope of the 80 attack classes;
- the limits of health and reachability checks;
- the status of the C6B composition contract;
- and the additional work required for end-to-end deployment assurance.

## 10.2 Symbolic Cryptographic Model

The Phase 1 and Phase 2 analyses use the symbolic model supported by the Tamarin Prover.

Cryptographic operations are represented by terms and equations rather than by probabilistic algorithms operating over concrete bit strings.

Within the applicable theories, the model assumes that:

- signatures cannot be forged without the relevant signing capability;
- hashes behave according to the declared symbolic construction;
- private values remain unavailable unless disclosed through a rule;
- domain-separated constructors remain distinct;
- and the adversary can combine, replay, decompose, and transmit terms only according to the declared algebra.

This abstraction is appropriate for protocol-logic analysis.

It does not itself prove:

- concrete computational security bounds;
- resistance to implementation-specific side channels;
- resistance to fault injection;
- resistance to memory disclosure;
- security of random-number generation;
- or security against future cryptanalytic advances.

A deployment must select concrete primitives whose computational properties justify the symbolic assumptions.

## 10.3 Free-Constructor and Hash-Binding Assumptions

Several lineage properties rely on structured symbolic terms and domain-separated hash constructions.

For example, the C3 model binds lineage and Child identity through symbolic hash terms.

Under the symbolic model:

```text
equal constructed hashes
→ equal underlying constructor terms
```

where no collision rule is provided.

This is the basis for properties such as:

```text
same Child ID
→ same bound lineage
```

The result should therefore be interpreted as a symbolic binding property.

A concrete implementation must additionally ensure:

- collision-resistant hash functions;
- canonical serialization;
- unambiguous field boundaries;
- domain separation;
- stable encoding across implementations;
- and rejection of malformed or non-canonical encodings.

Without those implementation properties, a concrete system might violate the assumptions represented by the symbolic constructor.

## 10.4 Signature and Key Assumptions

The models treat signatures as evidence that the holder of the relevant signing capability authenticated the encoded statement.

A valid signature does not automatically establish that:

- the signer was honest;
- the signing device was uncompromised;
- the external facts were physically true;
- the key was used under the correct policy;
- or the signer understood the statement.

These concerns are represented through explicit compromise events, authorization rules, generation events, and model-specific acceptance predicates.

The security results therefore depend on the completeness of the modeled key roles and compromise rules.

A concrete deployment must identify all authorities whose compromise can affect lineage acceptance, including:

- roots;
- epoch issuers;
- revocation authorities;
- transparency authorities;
- Oracle operators;
- bridge or migration authorities;
- hardware roots;
- and governance-controlled emergency keys.

## 10.5 Temporal Compromise Boundary

Many Phase 2 properties distinguish compromise before acceptance from compromise after generation or after acceptance.

This distinction is central.

The model does not treat key compromise as a metaphysical rewrite of prior events.

Instead, compromise affects which later messages the adversary can create and which acceptance conclusions remain justified.

The exact security statement depends on the temporal relation encoded in each lemma.

For example:

```text
compromise before acceptance
```

may satisfy an explicit exception branch, while:

```text
compromise after an earlier protected generation
```

does not automatically establish that the earlier event had a different lineage.

A deployment must preserve trustworthy event ordering.

If timestamps, checkpoints, revocation state, or epoch transitions can be reordered by implementation behavior, the concrete system may fail to satisfy the temporal assumptions used in the proof.

## 10.6 Key Erasure Assumption

Forward-security reasoning depends on the modeled erasure of prior epoch secrets.

The symbolic model can represent that a previous key is no longer available after an epoch transition.

The proof does not verify physical erasure from:

- memory;
- backups;
- logs;
- crash dumps;
- secure enclaves;
- hardware devices;
- operator archives;
- or disaster-recovery systems.

A concrete forward-secure deployment must implement and audit key lifecycle controls that justify the modeled erasure event.

If an old epoch secret remains recoverable, the implementation does not refine the corresponding formal assumption.

## 10.7 Oracle and External-Truth Boundary

OCLM binds authenticated evidence concerning origin, parents, time, space, context, and continuity.

It does not create external truth from nothing.

An Oracle may attest that an event occurred at a certain time or place. The formal model can verify how that attestation is bound into lineage and whether the adversary can substitute another value under the stated rules.

The model does not independently verify that the physical event actually occurred.

Therefore:

```text
formally valid Oracle evidence
≠ automatic proof of physical truth
```

The external-truth boundary may depend on:

- sensor integrity;
- human observation;
- legal authority;
- hardware attestation;
- threshold governance;
- source-chain finality;
- or another external evidence process.

OCLM protects the authenticated relationship among the modeled claims. The trustworthiness of the initial external observation must be justified separately.

## 10.8 Records, Evidence, and Ontological Truth

The conceptual OCLM theory distinguishes records from the history they describe.

The formal model does not claim omniscient access to ontological truth.

It defines a canonical lineage relative to authenticated generation and continuity predicates represented in the theory.

Accordingly, the formal statement is:

> The tested model prevents substitution of a different lineage under the same accepted Child identity unless a modeled exception or compromise condition applies.

It is not:

> The verifier has perfect knowledge of every physical fact in the universe.

This distinction preserves the conceptual claim while keeping the machine-verified statement exact.

## 10.9 Scope of the 80 Attack Classes

The 80 attack classes were deliberately constructed to challenge the inherited Phase 1 properties across:

- lineage and identity substitution;
- cross-instance ancestry splicing;
- replay and stale evidence;
- rollback;
- key compromise timing;
- revocation;
- transparency;
- split views;
- generalized composition;
- and provenance injectivity.

They provide broad symbolic coverage of the modeled security objectives.

They are not a claim that exactly 80 attacks exist in the world.

They do not exhaust:

- implementation vulnerabilities;
- economic attacks;
- governance capture;
- denial of service;
- privacy leakage;
- traffic analysis;
- unsafe user interfaces;
- deployment misconfiguration;
- unmodeled cryptographic APIs;
- or attacks against external dependencies.

The correct claim is:

```text
80 tested symbolic adversarial classes
80/80 ruled out under the stated models and assumptions
```

## 10.10 Meaning of No Counterexample Trace

For 79 direct attack properties, Tamarin found no trace satisfying the prohibited existential condition.

For A48, the equivalent universal security property was verified through the integrated H1/H2/H3 proof.

“No counterexample trace” means that no violating trace exists in the analyzed symbolic transition system for the selected property.

It does not mean that:

- every implementation is correct;
- every possible model extension preserves the property;
- every physical deployment is secure;
- or every future threat has already been represented.

Changing the rules, equations, compromise events, acceptance predicates, or external assumptions creates a different formal problem that must be analyzed separately.

## 10.11 Health and Reachability Boundary

The eight health properties demonstrate that representative intended executions are reachable.

This helps rule out a common form of vacuity in which a security property holds only because the protocol cannot execute.

The health properties do not establish:

- universal liveness;
- guaranteed termination;
- fairness;
- availability under denial of service;
- bounded latency;
- throughput;
- economic viability;
- or usability.

They show that selected honest and adverse lifecycle patterns remain executable in the formal theories.

## 10.12 Soundness Relative to the Tamarin Models

The publication evidence establishes results for the exact model files identified by their SHA-256 hashes.

If a model file changes, the previous result does not automatically apply.

Relevant changes include:

- modified rules;
- added equations;
- altered compromise events;
- weaker acceptance checks;
- changed field bindings;
- modified restrictions;
- or additional adversary outputs.

The package therefore preserves:

- model files;
- proof logs;
- result mappings;
- metadata;
- and manifests.

These artifacts define the exact analyzed object.

## 10.13 Implementation-Refinement Boundary

A formally verified protocol model is not identical to its software implementation.

A concrete implementation may introduce:

- parsing ambiguity;
- incorrect serialization;
- missing domain separation;
- race conditions;
- state rollback;
- incomplete revocation checks;
- unsafe key storage;
- inconsistent clock handling;
- identifier truncation;
- database uniqueness failures;
- or acceptance paths absent from the model.

To transfer the formal result to an implementation, a refinement argument is required.

At minimum, the implementation must show that:

1. every security-relevant implementation event maps to a formal event;
2. every accepted implementation state satisfies the modeled acceptance predicates;
3. concrete cryptographic encodings preserve symbolic term distinctions;
4. persistent state preserves modeled monotonicity and single-use rules;
5. compromise and recovery behavior match the declared assumptions;
6. and no additional acceptance path bypasses the verified protocol.

Without this mapping, the formal result remains evidence about the design model rather than a complete software-security certification.

## 10.14 Concurrency and Distributed-State Assumptions

Tamarin models concurrent protocol traces symbolically.

A concrete distributed implementation must still preserve the intended atomicity and ordering of:

- single-use transitions;
- revocation updates;
- epoch changes;
- predecessor consumption;
- transparency checkpoints;
- and migration acceptance.

Database isolation, replication lag, message queues, retries, and failover behavior may create states not represented by a simplified protocol rule.

A deployment must ensure that concurrent implementation behavior refines the atomic or ordered events assumed by the model.

## 10.15 Finality and External Ledger Assumptions

When a blockchain or ledger is used as an Oracle or evidence source, OCLM depends on a defined finality predicate.

The formal models do not prove the consensus security of every external blockchain.

A deployment must specify:

- which chain state is accepted;
- how finality is determined;
- how reorganizations are handled;
- what happens after catastrophic consensus failure;
- and whether governance can override finalized history.

The lineage result is conditional on the accepted external-ledger evidence satisfying these predicates.

## 10.16 Revocation Distribution Assumption

Formal revocation properties assume that the verifier receives and applies the relevant revocation state according to the model.

A real deployment must address:

- propagation delay;
- offline verifiers;
- stale caches;
- partitioned networks;
- recovery after missed updates;
- and conflicting revocation authorities.

A verifier that never receives the revocation information may not satisfy the same assumptions as the formal verifier.

## 10.17 Transparency-System Assumption

The transparency theories model checkpoint, consistency, fork, and split-view behavior at a symbolic level.

They do not select or verify one production transparency implementation.

A concrete system must define:

- log data structures;
- append-only proofs;
- checkpoint signatures;
- gossip or witness mechanisms;
- consistency verification;
- storage retention;
- and recovery from equivocation.

The Phase 2 result supports the modeled non-equivocation and monotonicity requirements. It does not certify an unspecified log service.

## 10.18 Governance and Authorized Exceptions

Some real systems permit emergency recovery, judicial intervention, administrative reassignment, or governance-approved migration.

Such actions may be legitimate, but they change the lineage policy.

OCLM should represent them as explicit transitions or exception authorities rather than as silent rewrites.

An authorized exception may create:

- a successor lineage;
- a replacement credential;
- a recovery branch;
- or an administrative override.

It must not be described as unchanged canonical continuity unless the policy formally defines it that way.

The distinction between explicit governance transition and hidden substitution is essential.

## 10.19 Privacy Is Not Established by Phase 2

Phase 2 focuses on integrity, lineage, continuity, compromise boundaries, revocation, and transparency.

It does not establish privacy properties such as:

- anonymity;
- unlinkability;
- confidentiality of lineage fields;
- selective disclosure;
- resistance to traffic analysis;
- or minimization of personal data.

Because lineage evidence may contain rich historical relationships, privacy must be designed independently.

Possible approaches include:

- commitments;
- zero-knowledge proofs;
- selective-disclosure credentials;
- encrypted evidence;
- access-controlled attestations;
- and privacy-preserving accumulators.

These mechanisms require their own threat models and proofs.

## 10.20 Availability and Denial of Service

The verified properties do not guarantee availability.

An adversary may still:

- block messages;
- delay evidence;
- prevent checkpoint propagation;
- exhaust computational resources;
- attack Oracle infrastructure;
- or make a destination service unavailable.

OCLM can distinguish valid from invalid lineage evidence under its model. It does not force a verifier to remain online or guarantee that valid evidence will be processed within a deadline.

## 10.21 Economic and Incentive Assumptions

The models do not analyze incentives, bribery, market manipulation, validator economics, bridge liquidity, insurance, or governance-token concentration.

A technically valid authority may still act against the interests of users.

Economic security must therefore be evaluated separately from symbolic protocol correctness.

## 10.22 C6B Assume-Guarantee Boundary

The Phase 1 C6B model represents a generalized security-composition contract.

It expresses an abstract assume-guarantee relationship among security components.

It is not yet a machine-checked end-to-end refinement proof showing that:

- each lower-level Phase 1 theory;
- every concrete Oracle;
- every concrete blockchain;
- and every production implementation

satisfies the C6B assumptions and jointly realizes its guarantees.

The C6B result is therefore a verified abstract composition statement under its own rules.

A future refinement phase should connect:

```text
concrete component model
→ component guarantee
→ C6B assumption
→ composed OCLM guarantee
```

This is the clearest remaining formal boundary between the Phase 2 model suite and a complete deployment-specific proof.

## 10.23 Trusted Computing Base

The effective trusted computing base for the Phase 2 evidence includes:

- the correctness of the Tamarin Prover and its dependencies;
- the correctness of the Tamarin model files;
- the declared equational theories;
- the operating environment used to run the proofs;
- the integrity of the captured logs;
- the SHA-256 implementation used for artifact identification;
- and the human interpretation connecting conceptual claims to formal lemmas.

The frozen evidence and manifests reduce the risk of artifact substitution.

They do not provide a formal proof of the verifier implementation itself.

## 10.24 Reproducibility Boundary

The publication package supports two kinds of reproducibility.

### Artifact-level reproducibility

A reviewer can verify:

- the frozen evidence ZIP;
- internal hashes;
- result counts;
- model-log mappings;
- and package manifests.

### Proof-level reproducibility

A reviewer can rerun Tamarin against the preserved theories with a compatible environment.

Exact processing times may differ because of:

- hardware;
- operating system;
- tool version;
- scheduling;
- and proof-search behavior.

The security result should be compared by lemma outcome and evidence identity, not by requiring identical wall-clock time.

## 10.25 Claims Supported by Phase 2

Phase 2 supports the following publication claim:

> Under the stated OCLM Phase 1 and Phase 2 symbolic models, attacker capabilities, cryptographic abstractions, and compromise conditions, all 80 tested adversarial attack classes were ruled out, no counterexample trace was found, no attack class remained unresolved, and all eight representative health and reachability properties were reachable.

It also supports the more focused conceptual claim:

> In the tested models, changing, duplicating, replaying, or re-recording evidence does not create a different canonical lineage under the same accepted Child identity unless an explicit modeled compromise or exception condition applies.

## 10.26 Claims Not Supported by Phase 2

Phase 2 does not support statements such as:

- OCLM is impossible to break;
- every possible attack has been tested;
- every blockchain bridge using OCLM is secure;
- OCLM automatically discovers physical truth;
- the implementation is verified merely because the model is verified;
- the 80 attack classes represent a statistical security probability;
- or C6B already constitutes a complete end-to-end implementation proof.

These stronger statements would exceed the evidence.

## 10.27 Future Formal Obligations

The principal future obligations are:

### End-to-end refinement

Connect concrete component models to the C6B assume-guarantee contract.

### Implementation model

Define a reference architecture and prove that its state transitions refine the symbolic rules.

### Concrete cryptographic profile

Specify canonical serialization, algorithms, key sizes, domain separation, and proof formats.

### Oracle profiles

Define how physical, legal, hardware, and blockchain evidence satisfy OCLM generation predicates.

### Cross-chain finality profiles

Formalize source-chain finality, reorganization handling, and destination activation.

### Privacy model

Add confidentiality, selective disclosure, and unlinkability properties where required.

### Recovery and governance model

Represent authorized recovery without collapsing the distinction between succession and substitution.

These obligations are extensions of the current work, not corrections to the completed Phase 2 result.

## 10.28 Formal Boundary Summary

The Phase 2 evidence establishes a verified symbolic result for exact preserved theories.

Its boundary can be summarized as:

```text
Verified:
protocol-level lineage properties
under declared symbolic and compromise assumptions

Not yet verified:
every physical input
every implementation
every external blockchain
every governance process
and complete end-to-end refinement
```

This boundary preserves both sides of the result:

- the verification is substantive and complete for the stated 88 targets;
- and the publication does not claim more than the evidence establishes.

## 10.29 Conclusion

The limitations identified in this section do not reduce the completed result to a mere proposal.

Phase 2 contains an executable formal model suite, an adversarial validation battery, clean final evidence, integrated resolution of A48, and reproducible artifact hashes.

The limitations define where the proof ends.

They also identify the exact path from a verified theory of canonical lineage non-substitutability toward a formally connected multi-blockchain implementation.
