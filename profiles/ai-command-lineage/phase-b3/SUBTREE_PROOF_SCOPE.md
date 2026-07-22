# Phase AI-B3 — Subtree Revocation Proof Scope

Model:

`model/tamarin/oclm_ai_b3_subtree_revocation_core.spthy`

This model isolates branch-local revocation from command-wide emergency stop
and from subtree replacement/recovery.

Verified properties:

1. A healthy authorized B -> C lineage can reach accepted execution.
2. Compromise of intermediate Agent B can be followed by Authority-issued
   subtree revocation.
3. A subtree remains revocable after an Action Certificate has already been
   issued.
4. After subtree revocation, the revoked leaf lineage cannot execute later.
5. An already-issued but unused Action Certificate cannot execute after its
   subtree has been revoked.

This model does not claim:

- command-wide Emergency Stop,
- command epoch restart,
- subtree replacement or re-delegation,
- arbitrary repeated recovery generations,
- natural-language intent correctness,
- universal AI safety.

Those are separate proof obligations.
