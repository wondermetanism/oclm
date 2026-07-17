# OCLM Phase 1-C2 — Verified Signed Composition Certificate

Date: 2026-07-17
Tamarin Prover: 1.12.0
Maude: 3.5.1
Graphviz: 15.1.0

## Final model

SHA-256:

e05f12eec9d3bb766b190f6d45d19ca67d27f8b21f3ed2ad41d2a1c90bde08b6

## Verified results

- executable_honest_signed_composition_lifecycle:
  verified (24 steps)

- signed_acceptance_requires_certificate_or_compromise:
  verified (8 steps)

- uncompromised_signed_acceptance_has_full_ancestry:
  verified (8 steps)

- signed_composition_identity_is_bound_or_compromised:
  verified (137 steps)

## Certificate structure

The signed Composition Certificate binds:

- Oracle public key
- issuance
- Child identifier
- lineage
- Oracle window root
- Parent A
- Parent B
- Parent A participation time
- Parent B participation time
- Child generation time
- generation window
- causal space

The complete certificate payload is signed by the Oracle signing authority.

## Proven scope

Within this symbolic model:

1. An uncompromised signed lifecycle is executable:

   Oracle window opening
   -> Parent A participation
   -> Parent B participation
   -> Child generation
   -> Composition Certificate issuance
   -> adversarial network delivery
   -> operating-claim collapse
   -> external verification
   -> final Child acceptance

2. Every signed final acceptance requires either:

   - a matching prior Composition Certificate issuance, or
   - prior compromise of the matching Oracle signing key.

3. Without prior Oracle-key compromise, every accepted certificate has a
   complete matching Oracle–Parent–Child causal ancestry.

4. Before Oracle-key compromise, one Child identifier cannot be accepted
   under two different values for:

   - issuance
   - lineage
   - Oracle root
   - Parent A
   - Parent B
   - Parent A participation time
   - Parent B participation time
   - Child generation time
   - generation window
   - causal space

5. An attacker may observe, retain, and replay a valid certificate package.

6. An attacker cannot modify a signed certificate payload and have the
   modified payload accepted without obtaining the Oracle signing key.

7. Parent claims and Consensus decisions do not determine or replace the
   accepted signed lineage.

## Open Chains notice

Tamarin reported:

  Too many chain constraints, stopping precomputation.
  Open Chains limits: 10

This is a precomputation-limit notice, not a failed security result.

All four target lemmas completed with verified results in the final
all-lemma proof run.

## Precise interpretation

Phase 1-C2 upgrades the internal Phase 1-C1 composition boundary into an
externally transportable signed certificate.

The network is controlled by the symbolic attacker. Certificate acceptance
nevertheless remains bound to either an authentic prior certificate issuance
or an explicit prior Oracle-key compromise.

This is a symbolic protocol theorem under Tamarin's perfect-cryptography
abstraction.

## Not yet proven

- forward security after later signing-key compromise
- signing-key rotation and historical certificate validity
- certificate revocation
- independent witness or transparency-root anchoring
- rollback-resistant verifier state
- replay prevention where one-time consumption is required
- numeric wall-clock accuracy
- physical-location authenticity
- computational probability bounds
- concrete implementation conformance
