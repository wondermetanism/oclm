# Phase AI-B3 — Subtree Recovery Proof Scope

This model isolates recovery of an already-revoked compromised subtree.

It models one bounded Authority-authorized replacement generation.

Lifecycle:

    certified old B/C
      -> controlled compromise
      -> Authority revocation
      -> fresh B'/C'
      -> Authority reauthorization
      -> fresh Verifier certificate
      -> accepted replacement execution

Verified obligations cover:

- reachable recovery after old-subtree compromise and revocation,
- matching prior revocation as a prerequisite for replacement,
- fresh replacement Agent identities,
- Authority reauthorization of the replacement execution scope,
- fresh Verifier certificate requirement for replacement execution,
- rejection of old certificates in the replacement lineage,
- single-use replacement authorization per revoked subtree.

This model does not claim arbitrary-depth or indefinitely repeated
replacement generations.

Command-wide Emergency Stop, fresh command-epoch restart, and ordinary
subtree-local revocation are proved independently in the other Phase AI-B3
formal models.
