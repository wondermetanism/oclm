# OCLM Phase 1-B3 — Verified Claim-Collapse Independence Baseline

Date: 2026-07-17
Tamarin Prover: 1.12.0
Maude: 3.5.1
Graphviz: 15.1.0

## Adversarial scenario

The symbolic model permits:

- Parent A to deny the legitimate Child
- Parent B to assert an alternative Child
- the Consensus layer to declare an arbitrary alternative world-view
- the network attacker to control externally supplied packages
- explicit Oracle signing-key compromise

Parent claims and Consensus decisions are operating-layer declarations.
They are not cryptographic truth roots and are not inputs to the final
Child-authenticity decision.

## Verified results

- executable_claim_collapse_lifecycle:
  verified (19 steps)

- post_collapse_acceptance_requires_generation_or_compromise:
  verified (7 steps)

- post_collapse_acceptance_has_collapse_ancestry:
  verified (4 steps)

- post_collapse_child_identity_is_bound_or_compromised:
  verified (79 steps)

## Proven scope

Within this symbolic model:

1. A complete claim-collapse lifecycle is executable without prior
   Oracle-key compromise.

2. Both Parent claims and a Consensus decision can conflict with the
   authentic Child lineage.

3. A Child accepted after claim collapse must have either:
   - a matching prior legitimate Oracle generation event, or
   - prior compromise of the relevant Oracle signing key.

4. Before Oracle-key compromise, one Child identifier cannot be accepted
   under two different issuance, lineage, Oracle root, Parent, generation
   time, time-window, or causal-space values.

5. Parent declarations and Consensus decisions do not acquire the power
   to rewrite the authentic Oracle–Child lineage merely by agreement,
   majority, unanimity, repetition, or contradiction.

## Precise architectural meaning

OCLM separates two layers:

- Operating assumptions:
  Parent declarations, node votes, Consensus decisions, and social claims

- Final truth root:
  the authentic Oracle-signed Child lineage

When the operating-assumption layer collapses, final verification falls
back to the Oracle–Child lineage rather than attempting to repair truth
through additional voting.

## Important limitation

This result depends on the verifier maintaining that architectural
separation.

A concrete implementation that incorrectly feeds Parent claims or
Consensus decisions into the cryptographic authenticity decision would
not inherit this proof.

## Not yet proven

- One combined model containing external signatures, the Time–Space
  state machine, claim collapse, and compromise handling simultaneously
- Forward security after later Oracle-key compromise
- Independent Oracle-root witnessing and equivocation detection
- Physical-location authenticity
- Numeric wall-clock accuracy
- Computational probability bounds
- Concrete implementation correctness
