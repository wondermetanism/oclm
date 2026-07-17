# OCLM Phase 1-C1 — Verified Composition Contract Baseline

Date: 2026-07-17
Tamarin Prover: 1.12.0
Maude: 3.5.1
Graphviz: 15.1.0

## Final model

SHA-256:

44cba8f5a4268035be533333316cbc03fd5ffe9d0edbcb01269b903efdec9286

## Verified results

- executable_honest_composed_lifecycle:
  verified (14 steps)

- composed_acceptance_requires_closed_generation_or_compromise:
  verified (8 steps)

- uncompromised_acceptance_has_full_composed_ancestry:
  verified (8 steps)

- composed_child_identity_is_bound_or_compromised:
  verified (172 steps)

## Composition boundary

Phase 1-C1 connects the previously verified OCLM proof layers through the
persistent interface fact:

AuthenticatedGenerationContract

This fact represents a Child whose matching Oracle-authorized generation
window has completed its Parent participation, Child generation, and
post-generation closure lifecycle.

Parent claims and Consensus decisions establish only that the operating
assumption layer has collapsed. They do not determine the accepted Child
lineage.

## Proven scope

Within this symbolic composition-contract model:

1. A complete uncompromised lifecycle is executable:

   Oracle window opening
   -> Parent A participation
   -> Parent B participation
   -> Child generation
   -> post-generation window closure
   -> claim collapse
   -> final Child acceptance

2. Every final Child acceptance requires either:

   - a matching prior closed generation contract, or
   - prior compromise of the relevant Oracle authority.

3. If the Oracle has not been compromised before acceptance, the accepted
   Child has a complete matching causal ancestry.

4. Before Oracle compromise, one Child identifier cannot be accepted under
   two different values for:

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

5. Parent claims and Consensus decisions cannot replace the authenticated
   generation contract.

## Interface correction record

The initial draft of Phase 1-C1 had no executable honest trace because the
fresh issuance identifier was not published by OpenWindow.

Claim and Consensus rules receive their issuance identifier through the
public network, so they could not refer to the same private issuance.

The model was corrected by adding a public Oracle window announcement:

  Out(
    <'oclm-window-opened',
     oracle,
     issuance,
     root,
     ParentA,
     ParentB,
     window,
     space>
  )

After this interface correction, the honest composed lifecycle verified in
14 steps.

This was a reachability/interface defect in the draft model, not a
counterexample to an OCLM security property.

## Precise interpretation

Phase 1-C1 is a compositional architecture theorem.

It does not re-run all cryptographic details from Phase 1-B1 inside one
monolithic model. Instead, it proves that the verified output contracts of
the lineage, external-authenticity, time-space, and claim-collapse layers
remain coherent when connected through the defined interface.

## Not yet proven

- A single executable model containing all signature-verification and
  Time-Space state-machine details simultaneously
- Cryptographic authentication of the composition interface itself
- Forward security after later Oracle-key compromise
- Key rotation and historical-key validity
- Independent Oracle-root witnesses
- Physical-location authenticity
- Numeric wall-clock accuracy
- Computational probability bounds
- Concrete implementation conformance
