# OCLM Phase 1-C3A — Verified Result

## Phase

Phase 1-C3A — Forward-Secure Epoch Core

## Date

2026-07-17

## Verified model

`oclm_phase1c3a_verified.spthy`

SHA-256:

`f887abfbaa2ca77adcb5a936f7d4a3dc37dccb407a57c86edf153b24acc0192d`

## Final all-lemma proof

`oclm_phase1c3a_proof_final.txt`

SHA-256:

`6519524f188e04c41e7f9dfb4f8eea8738b52c0049cbb1f8d4b34f9cd7c474d7`

## Tamarin result

All wellformedness checks were successful.

- `executable_old_certificate_after_later_epoch_compromise`
  - exists-trace
  - verified in 18 steps

- `erased_old_epoch_key_cannot_be_compromised_later`
  - all-traces
  - verified in 5 steps

- `accepted_epoch_credential_requires_issuance_or_root_compromise`
  - all-traces
  - verified in 8 steps

- `accepted_old_certificate_requires_issuance_or_target_compromise`
  - all-traces
  - verified in 6 steps

## Established guarantees

1. A valid execution exists in which:
   - an old-epoch certificate is issued;
   - the old-epoch private key is erased;
   - a later epoch is started;
   - the later-epoch private key is compromised;
   - the old certificate is still successfully accepted.

2. Once the old-epoch key is erased, the model cannot later produce an
   `OldEpochKeyCompromised` event for that same epoch key.

3. An accepted epoch credential requires either:
   - an earlier matching `EpochCredentialIssued` event; or
   - compromise of the Oracle Root key before acceptance.

4. An accepted old certificate after later-epoch compromise requires either:
   - an earlier matching `OldCertificateIssued` event;
   - compromise of the target old-epoch key before acceptance; or
   - compromise of the Oracle Root key before acceptance.

5. Compromise of an unrelated later-epoch key is deliberately not an exception
   permitting forgery or substitution of an old-epoch certificate.

## Formal meaning

Phase 1-C3A establishes forward-security separation between certificate epochs.

A compromise of a later epoch does not grant the adversary the signing authority
of an already erased old epoch and does not, by itself, permit the creation of a
different accepted old certificate.

## Composition boundary

Phase 1-C3A proves only the forward-secure epoch and two-stage signature core.

The complete Oracle–Parent–Child lineage, Time-Space ancestry, claim-collapse
behavior and signed Composition Certificate guarantees remain established by
the earlier OCLM phases, especially Phase 1-C2.

Their explicit assume-guarantee connection is reserved for:

Phase 1-C3B — C2/C3 Forward-Secure Composition Contract.

## Model scope

The model uses symbolic Dolev–Yao cryptography and linear fact consumption to
represent old-key erasure.

The proof does not yet establish:

- physical or hardware-backed key destruction;
- computational cryptographic bounds;
- implementation conformance;
- secure clock or physical-location accuracy;
- verifier rollback resistance;
- certificate revocation or transparency witnesses;
- Root-key forward security;
- arbitrary unbounded epoch-chain composition.

The earlier monolithic C3 model is retained as an experimental research model
and is not part of this verified C3A release.
