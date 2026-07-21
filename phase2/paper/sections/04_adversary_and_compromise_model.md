# 4. Adversary and Compromise Model

## 4.1 Purpose of the Threat Model

Phase 2 does not define one narrative attacker with a single preferred exploit path. It defines a family of symbolic adversarial objectives against the Phase 1 transition systems.

Each attack class asks whether the inherited rules admit a trace in which a prohibited state is reached, such as:

- an accepted Child without the required generation history;
- the same Child identity bound to different lineages;
- a stale, revoked, or forked state accepted without its required exception;
- a historical epoch rewritten through an unrelated later compromise; or
- evidence from separate executions combined into one accepted ancestry.

The threat model is therefore property-oriented. The adversary succeeds whenever the attack condition becomes reachable under the selected theory. The adversary fails for that class when no such symbolic trace exists.

This structure separates the security claim from assumptions about an attacker's motivation. A lineage-substitution trace is a counterexample whether it is produced for economic profit, governance capture, fraud, censorship, bridge manipulation, or another purpose.

## 4.2 Symbolic Cryptographic Setting

The inherited theories use Tamarin's symbolic term model, within the broader active-adversary tradition associated with Dolev–Yao protocol analysis [1,2]. Depending on the theory, the declared cryptographic built-ins are:

```text
hashing
```

or:

```text
hashing, signing
```

Cryptographic operations are treated according to their symbolic equations rather than through bit-level computational analysis. In particular, the model does not grant the adversary an unmodeled ability to:

- invert a hash;
- obtain a signing key from a public verification key;
- produce a valid signature without the corresponding signing key;
- or create an equality between distinct free terms merely by assertion.

Fresh values remain unavailable to the adversary unless a rule releases them or a modeled compromise exposes them. Where protocol data is sent through public `Out(...)` facts or received through `In(...)` facts, it is subject to the ordinary symbolic network-attacker treatment of the theory.

This is a perfect-cryptography abstraction. Computational reductions, concrete algorithm parameters, entropy failures, implementation defects, side channels, and cryptanalytic breakthroughs are outside the Phase 2 proof claim.

## 4.3 Adversarial Knowledge and Message Manipulation

Within the symbolic setting, the attacker may use terms that become available through public outputs, attacker-controlled inputs, or explicit compromise events. Known terms may be replayed, reordered, combined, and presented in later protocol interactions where the rules permit them.

This ability is important for the following attack families:

- replay and single-use violations;
- cross-instance ancestry splicing;
- certificate or credential reuse;
- stale-state presentation;
- conflicting public claims;
- and provenance collisions.

The attacker is not restricted to forwarding complete honest transcripts. It may attempt to combine known components from different executions. The defense therefore cannot rely merely on keeping messages grouped by convention. It must arise from term binding, equality constraints, event ordering, persistent or linear state, and the acceptance rules themselves.

The model does not assume that every network message is delivered, delivered once, or delivered in order. Availability and denial-of-service resistance are not established by the attack battery. The eight health properties show reachability of selected intended traces, not universal liveness under an actively blocking network.

## 4.4 Explicit Compromise Rather Than Implicit Omnipotence

Privileged failures are represented by explicit state transitions and trace events. A result may therefore distinguish an unexplained security failure from one that is attributable to a modeled compromise.

Across the Phase 1 model family, compromise roles include:

| Compromised component | Modeled consequence |
|---|---|
| Oracle or Oracle signing key | May explain otherwise unauthenticated external or post-collapse acceptance under the affected theory |
| Root key | May explain forged or unauthorized epoch credentials and root-authorized evidence after the compromise boundary |
| Live or target epoch key | May explain certificate evidence attributable to that epoch while the modeled key is available or explicitly compromised |
| Later epoch key | May affect the later epoch but does not automatically expose an erased earlier target epoch key |
| Composition root | May authorize the specific compromised composition path modeled by the contract |
| Lineage or epoch verifier | May permit stale-state acceptance or rollback under the corresponding contract |
| Revocation verifier | May explain acceptance after a compromised revocation-state rollback |
| Revocation authority | May explain explicit certificate reactivation after compromise |
| Transparency log | May explain conflicting checkpoints, roots, or forked views after log compromise |
| Generalized composition verifiers | May explain the corresponding stale, revoked, forked, or conflicting branch in the C6 contracts |

The table describes modeled consequences, not an unrestricted assertion that compromise of one role grants control over every OCLM component. Compromise is scoped by the rules of the selected theory.

## 4.5 Time-Indexed Compromise

A central feature of the threat model is that compromise has temporal position.

Security properties distinguish among:

- compromise before generation;
- compromise before issuance;
- compromise before acceptance;
- compromise after acceptance;
- compromise of the target epoch;
- compromise of a different later epoch;
- and compromise of a root or verifier authority.

This distinction prevents a later compromise from being treated as an automatic explanation for every earlier event.

Schematically:

```text
Compromise(K) after historical acceptance
≠ Compromise(K) before historical acceptance
```

The exact property determines which ordering is relevant. For example, an acceptance property may permit a compromise exception only when the corresponding compromise event precedes the acceptance event.

The Phase 2 results therefore do not claim that compromised keys remain trustworthy. They claim that the formal consequences of compromise remain bounded by the modeled key, epoch, authority, and event order.

## 4.6 Forward-Secure Epoch Boundary

The C3 and C3A theories distinguish a live epoch key from an erased epoch key and distinguish the target historical epoch from a later epoch.

A certificate may be issued and the corresponding epoch key erased. A later epoch key may subsequently be compromised. The threat model asks whether this later compromise permits the attacker to reconstruct or substitute the accepted identity of the erased past epoch.

The intended boundary is:

```text
compromise of a later epoch
≠ compromise of the erased target epoch
```

The attacker may use an explicit target-old-epoch or root-compromise path when such a path exists in the theory. It may not silently reinterpret later compromise as if it had occurred against the historical target key.

This boundary is exercised by the attack classes concerning:

- post-erasure compromise;
- unauthorized epoch credentials;
- old-certificate acceptance;
- complete ancestry of uncompromised erased-epoch acceptance;
- and past-epoch identity substitution.

## 4.7 Oracle and External-Evidence Boundary

OCLM uses Oracle evidence as an input to lineage formation, but Phase 2 does not prove that an external physical observation is objectively correct.

The formal models can establish relationships such as:

- the evidence was issued under a modeled Oracle authority;
- a signature verifies under a corresponding key;
- the acceptance event has a matching generation event;
- or a failure is attributable to Oracle-key compromise.

They do not independently establish that:

- a sensor measured the physical world correctly;
- a legal authority acted honestly;
- a human operator entered truthful data;
- a location attestation was physically unforgeable;
- or a hardware root was free of implementation defects.

A concrete deployment must define how physical or institutional facts cross the Oracle boundary. Phase 2 protects the formal lineage relation after those facts have been represented by the model; it does not eliminate the need to secure the evidence source.

## 4.8 Claims, Denial, and Malicious Consensus

The claim-collapse models deliberately include contradictory public behavior. Parent denial, alternative claims, and malicious consensus claims may occur as trace events.

These actions test whether public narrative can overwrite authenticated generation.

The attacker may therefore influence or produce modeled claims. The security boundary is that claims and consensus events do not, by themselves, modify the generation facts consumed by independent verification.

The threat model does not state that consensus systems are irrelevant. Consensus may determine which record a network presents or stores. OCLM tests the separate question of whether that record retains the authenticated lineage required by the Child identity.

## 4.9 Cross-Instance and Evidence-Splicing Attacks

Several attack classes attempt to create one accepted Child from otherwise legitimate components belonging to different executions.

Examples include combining:

- a window from one instance;
- Parent A participation from another;
- Parent B participation from a third;
- an unrelated generation or collapse event;
- a credential from one epoch;
- and a certificate from another lineage.

The symbolic attacker is allowed to reuse known terms where the rules make them available. The attack condition then asks whether acceptance can occur without one coherent matching ancestry.

These attacks are stronger than checking each component independently. They test whether the model binds the components to the same root, pair, window, Child, lineage, epoch, and contextual tuple.

## 4.10 Replay, Single Use, Staleness, and Rollback

The state-oriented portion of the threat model covers four distinct mechanisms.

### Replay

Previously available evidence may be presented again. The question is whether replay can create an additional Child or a second valid transition when the model requires one-time use.

### Single use

Linear state and consumption rules represent resources such as complementary issuance pairs or generation windows that must not be reused for multiple distinct Children.

### Staleness

A previously valid certificate, epoch, lineage state, or verifier state may be presented after a newer state has been established.

### Rollback

The attacker may attempt to lower the verifier's recorded state. The models distinguish an attempted rollback from a rollback that succeeds only after an explicit verifier compromise.

A stale record is not necessarily fabricated. Its danger is that authentic old evidence may be represented as current. OCLM therefore binds acceptance to the verifier's authenticated state progression and to explicit compromise exceptions.

## 4.11 Revocation and Reactivation

The revocation threat model distinguishes among:

- an active certificate;
- a certificate that has been revoked;
- a verifier that has not yet observed the update;
- a current verifier that must reject the revoked certificate;
- a verifier compromised and rolled back;
- and an authority compromised before explicit reactivation.

A missing update is modeled as a specific exception rather than as evidence that revocation never occurred. Likewise, reactivation is not treated as an ordinary state transition unless the theory provides the corresponding authority-compromise path.

The adversarial objective is to make revoked evidence appear canonically active without the required exception or compromise history.

## 4.12 Transparency, Forks, and Split Views

The transparency models do not assume that a log is incapable of equivocation.

A compromised log may issue a conflicting checkpoint or forked view under explicit rules. The threat model then asks:

- whether a checkpoint can be accepted without matching issuance;
- whether conflicting roots can exist without prior log compromise;
- whether the same certificate can be accepted under incompatible histories;
- whether conflicting gossip produces equivocation evidence;
- and whether a final composed acceptance can use a forked root without the corresponding compromise history.

Thus, fork existence and fork legitimacy are separated. A compromised component may generate a fork, while the model still requires the fork to be attributable and detectable under the stated trace conditions.

## 4.13 Generalized Composition Adversary

The C6 models expose attack paths at the generalized composition layer. The adversary may attempt to combine:

- stale or conflicting epochs;
- verifier-compromise state;
- revoked-certificate exceptions;
- forked transparency evidence;
- lineage freshness evidence;
- and imported component contracts.

The C6B result is conditional on its assume–guarantee component contracts. Phase 2 attacks the top-level contract as formalized. It does not convert C6B into an end-to-end refinement proof from every lower-level operational rule.

This distinction limits the assurance claim to the abstract composition boundary identified in Section 3.10.

## 4.14 Attack-Query Semantics

For 79 of the 80 attack classes, the generated theory appends an `exists-trace` lemma describing the prohibited condition.

The interpretation is:

```text
exists-trace lemma verified
→ a modeled counterexample trace exists
```

and:

```text
exists-trace lemma falsified - no trace found
→ the prohibited condition is unreachable in that theory
```

The Phase 2 term **SURVIVES** means the attack query was falsified with no counterexample trace, or, for A48, that the equivalent all-traces safety property was verified by the integrated proof described below. It does not mean that Tamarin proved every conceivable attack outside the query.

### A48 exception

Direct counterexample search for A48 exhausted practical resources. The security statement was therefore expressed as an all-traces property and decomposed into three helper lemmas:

```text
H1: same Child ID implies the same lineage
H2: the same generated lineage implies the same public ancestry tuple
H3: uncompromised acceptance has a matching generated origin
```

H1, H2, H3, and the final past-epoch identity property were verified in the same Tamarin invocation with successful wellformedness checks. A48 is counted once among the 80 attack classes; the three helper lemmas are supporting proof obligations rather than additional attack classes.

## 4.15 Health and Reachability Semantics

Security claims can be vacuous when a model has no executable honest behavior. Phase 2 therefore includes eight `exists-trace` health properties.

For a health property:

```text
exists-trace lemma verified
→ the selected intended lifecycle is reachable
```

The eight health properties cover:

- foundational generation and acceptance;
- a complete time-space window;
- honest signed composition;
- old-certificate verification after later compromise;
- rollback-resistant composition;
- revocation lifecycle;
- transparency split-view detection;
- and clean generalized multi-epoch composition.

These results demonstrate selected executability. They do not prove fairness, eventual delivery, termination of every run, or availability under arbitrary denial of service.

## 4.16 Explicitly Out-of-Scope Capabilities

The Phase 2 adversary does not automatically include capabilities that are absent from the formal rules and symbolic equations. The following remain outside the direct proof claim:

- computational attacks on concrete hash or signature algorithms;
- hash collisions or signature forgeries not represented by compromise;
- random-number-generator failure;
- memory-safety errors, injection, parser ambiguity, and serialization bugs;
- side-channel and fault-injection attacks;
- physical theft or cloning of devices except where abstracted as key compromise;
- false physical observations at the Oracle boundary;
- economic incentives, bribery, governance capture, and legal coercion except where represented by explicit compromise or claim events;
- probabilistic blockchain finality and network-specific reorganization rules;
- denial of service and global liveness;
- implementation-level cross-chain bridge behavior;
- and a complete refinement proof from all lower-level models to C6B.

These exclusions do not weaken the meaning of the verified properties. They define the boundary within which the properties were established.

## 4.17 Threat-Model Summary

The Phase 2 adversary is strong at symbolic record manipulation and explicit state abuse, but it is not undefined or omnipotent.

It may attempt to:

```text
replay known evidence
combine terms from different executions
present stale or conflicting state
publish contradictory claims
trigger modeled compromise paths
exploit revocation and transparency exceptions
and search for any trace satisfying an attack condition
```

It may not silently receive powers that the selected theory does not grant.

The resulting security question is precise:

> Given the inherited Phase 1 rules, symbolic cryptographic equations, public-message behavior, state transitions, and explicit compromise events, is the prohibited lineage or acceptance condition reachable?

Phase 2 answers that question separately for each of the 80 attack classes and verifies executability through eight health properties.
