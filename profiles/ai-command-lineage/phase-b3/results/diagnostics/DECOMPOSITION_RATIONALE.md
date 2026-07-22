# Phase AI-B3 Model Decomposition Rationale

During Phase AI-B3 development, emergency stop, subtree lifecycle,
subtree revocation, restart, and replacement were temporarily composed into
one experimental Tamarin model.

The experimental monolith is preserved with SHA-256:

6010ca962d388bf709c8723809036fec222752e4d062a4e861bdaf2f17d81c33

Observed diagnostic behavior included:

- open-chain precomputation saturation;
- derivation-check timeout when restart machinery remained;
- proof-search timeout when replacement machinery remained;
- immediate verification of the targeted subtree-revocation reachability
  property after both unrelated responsibilities were removed.

The proof responsibilities were therefore separated into three final models.

This decomposition does not convert a failed monolithic proof into a claim
that the full arbitrary interleaving of all three models has been
machine-proved.

Instead, each final claim is explicitly scoped to its corresponding model,
and Phase AI-B3 is published as a composition proof bundle.

The experimental monolith is diagnostic evidence only.
