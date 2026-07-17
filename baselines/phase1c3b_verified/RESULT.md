# OCLM Phase 1-C3B — Verified Result

## Phase

Phase 1-C3B — C2/C3 Forward-Secure Composition Contract

## Date

2026-07-17

## Verified model

`oclm_phase1c3b_verified.spthy`

SHA-256:

`20b5fb308997ed7148eb9f8d5f8c724a375b9fffcefbed22cdf05b7c1094aee9`

## Final all-lemma proof

`oclm_phase1c3b_proof_final.txt`

SHA-256:

`1fdb8f9b2e5a7aafb3147b421c8a3234576b1edf1cc8acb1ccb97601bd13e4d2`

## Tamarin result

All wellformedness checks were successful.

- `executable_forward_secure_composed_lifecycle`
  - exists-trace
  - verified in 32 steps

- `composed_acceptance_requires_contract_or_target_compromise`
  - all-traces
  - verified in 10 steps

- `uncompromised_composed_acceptance_has_full_ancestry`
  - all-traces
  - verified in 11 steps

- `forward_secure_composed_identity_is_bound_or_compromised`
  - all-traces
  - verified in 207 steps

## Established guarantees

1. A complete executable composition lifecycle exists:

   - a C2 Time-Space window is opened;
   - Parent A participates;
   - Parent B participates;
   - the Child is generated;
   - the C2 Composition Certificate is issued;
   - the certificate is sealed under the old epoch;
   - the old epoch key is erased;
   - a later epoch is started;
   - the later epoch key is compromised;
   - Parent and Consensus claims collapse;
   - the past Child is still accepted.

2. Every composed acceptance requires either:

   - the matching C2 certificate, old-epoch certificate, old-key erasure and
     later-epoch compromise contract ancestry;
   - compromise of the target old epoch key before acceptance; or
   - compromise of the Composition Root before acceptance.

3. When neither the target old epoch key nor the Composition Root was
   compromised before acceptance, the accepted Child has complete matching
   C2 and C3 ancestry.

4. Two accepted instances with the same `child_id` must agree on:

   - old epoch;
   - old epoch public key;
   - predecessor;
   - issuance;
   - lineage;
   - lineage root;
   - Parent A;
   - Parent B;
   - Parent participation times;
   - Child generation time;
   - Time-Space window;
   - logical space;

   unless the relevant target old epoch key or Composition Root was
   compromised before an acceptance.

5. Compromise of an unrelated later epoch key is not an exception permitting
   substitution of the past Child lineage.

6. The later epoch and later epoch public key identify the later verification
   environment. They are deliberately not part of the past Child identity.

## Composition meaning

Phase 1-C3B connects:

- the complete Oracle–Parent–Child Time-Space lineage and signed Composition
  Certificate guarantees established in Phase 1-C2; and
- the old-key erasure and later-epoch compromise separation established in
  Phase 1-C3A.

The composition contract establishes that later key compromise does not detach
an accepted past Child from its original C2 lineage.

## Proof boundary

Phase 1-C3B is an assume-guarantee composition model.

It does not repeat the cryptographic signature proofs of Phase 1-C2 or the
forward-secure epoch cryptographic core of Phase 1-C3A. Those guarantees are
represented as explicit composition-contract states and connected here.

## Model scope

The proof does not yet establish:

- physical or hardware-backed key destruction;
- computational cryptographic bounds;
- implementation conformance;
- secure wall-clock or physical-location accuracy;
- verifier rollback resistance;
- certificate revocation;
- transparency witnesses;
- Root-key forward security;
- arbitrary unbounded epoch-chain induction.

The earlier large experimental C3 variants are not part of this verified
Phase 1-C3B release.
