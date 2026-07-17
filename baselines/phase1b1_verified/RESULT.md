# OCLM Phase 1-B1 — Verified External Authenticity Baseline

Date: 2026-07-17
Tamarin Prover: 1.12.0
Maude: 3.5.1
Graphviz: 15.1.0

## Model

OCLM external Child verification under a Dolev–Yao network attacker.

The attacker may intercept, alter, replay, mix, suppress, or create
arbitrary network packages.

The verifier accepts a Child only through the authentic Oracle public key,
a valid Oracle signature, and a Child identifier derived from its lineage.

## Verified results

- executable_external_child:
  verified (8 steps)

- executable_honest_external_child:
  verified (15 steps)

- external_child_requires_generation_or_compromise:
  verified (6 steps)

- external_child_identity_is_bound_or_compromised:
  verified (65 steps)

## Proven scope

Within this symbolic model:

1. A legitimate Oracle-generated Child can be externally accepted
   without prior Oracle-key compromise.

2. Every externally accepted Child has either:
   - a matching prior legitimate Child generation event, or
   - a prior compromise of the relevant Oracle key.

3. Before Oracle-key compromise, one Child identifier cannot be accepted
   under two different issuance, lineage, Oracle-root, Parent, time,
   time-window, or causal-space values.

4. Full attacker control of transport and storage does not create
   canonical Child authenticity.

## Precise meaning

An attacker may copy, suppress, replay, or alter data.

However, without the authentic Oracle signing key, the attacker cannot
make an altered or nonexistent Child pass as the same canonical OCLM Child.

## Not yet proven

- Generation occurring inside the Oracle-authorized time window
- Parent participation occurring inside that window
- Window closure preventing later generation
- Physical-space authenticity
- Forward security after later key compromise
- Oracle non-equivocation using independent witnesses
- Computational probability bounds
- Concrete implementation correctness
