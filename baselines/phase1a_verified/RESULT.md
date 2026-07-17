# OCLM Phase 1-A — Verified Symbolic Baseline

Date: 2026-07-17
Tool: Tamarin Prover 1.12.0
Maude: 3.5.1
Graphviz: 15.1.0

## Result

All wellformedness checks were successful.

- executable: verified
- accepted_child_was_generated: verified
- generated_child_has_full_ancestry: verified
- complementary_pair_is_single_use: verified
- child_lineage_is_bound: verified
- oracle_equivocation_is_evidenced: verified

## Proven scope

Within this Phase 1-A symbolic model:

1. An accepted Child has a prior Child generation event.
2. A generated Child has a prior Oracle issuance and both Parent participation events.
3. One complementary issuance pair cannot generate more than once.
4. One Child cannot be accepted under two different Oracle–Parent–Time–Space lineages.
5. Oracle equivocation produces an evidence event.

## Not yet proven

- Verification of attacker-supplied external Child packages
- Cryptographic signature unforgeability
- Numeric clock accuracy
- Physical-space authenticity
- Computational security probability
- Oracle compromise resistance
- Real implementation correctness

These are intentionally deferred to later phases.
