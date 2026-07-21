# OCLM Phase 2 — Results Overview

## Final result

- 80/80 symbolic adversarial attack classes ruled out
- 0 counterexample traces
- 0 unresolved attack classes
- 8/8 health and reachability properties reachable
- A48 H1/H2/H3 and final property verified in one integrated Tamarin invocation

## Evidence composition

| Evidence path | Count | Composition |
| --- | ---: | ---: |
| Original warning-free runs | 71 | 64 attacks + 7 health properties |
| Warning-free direct reruns | 16 | 15 attacks + H03 |
| Integrated A48 all-traces proof | 1 | A48, supported by H1/H2/H3 in the same invocation |
| Total principal targets | 88 | 80 attacks + 8 health properties |

## Attack-family coverage

| Attack family | Targets | SURVIVES | Counterexamples | Unresolved |
| --- | ---: | ---: | ---: | ---: |
| Lineage and Identity Substitution | 4 | 4/4 | 0 | 0 |
| Cross-Instance Ancestry Splicing | 4 | 4/4 | 0 | 0 |
| Replay, Single Use, Staleness, and Rollback | 4 | 4/4 | 0 | 0 |
| Temporal Boundaries of Key Compromise | 4 | 4/4 | 0 | 0 |
| Revocation and Unauthorized Reactivation | 5 | 5/5 | 0 | 0 |
| Transparency and Split-View Acceptance | 4 | 4/4 | 0 | 0 |
| Time, Space, and Oracle Binding | 4 | 4/4 | 0 | 0 |
| Final Composition and Canonical Conflict | 4 | 4/4 | 0 | 0 |
| Lineage, Identity, and Ancestry Invariants | 14 | 14/14 | 0 | 0 |
| Composition and Evidence Boundaries | 4 | 4/4 | 0 | 0 |
| Adversarial Semantics and Resource Reuse | 1 | 1/1 | 0 | 0 |
| Temporal Boundaries and State Transitions | 17 | 17/17 | 0 | 0 |
| Transparency Forks and Equivocation | 4 | 4/4 | 0 | 0 |
| Provenance Injectivity and Reverse Identity | 7 | 7/7 | 0 | 0 |

## Processing-time note

The selected final evidence logs report an aggregate of 2985.35 seconds across the 88 principal targets, with a median of 2.64 seconds. This aggregate is not the initial battery wall-clock duration.

## Authoritative source

`catalog/FINAL_88_RESULTS.csv` is the authoritative machine-readable per-property result map. The files in this directory are derived summaries for Section 7.


## A48 analytical proof

Section 8 and the following derived artifacts explain the integrated proof chain:

```text
paper/sections/08_integrated_a48_proof.md
results/A48_INTEGRATED_PROOF_SUMMARY.md
results/A48_PROOF_CHAIN.json
```

The frozen integrated model and log remain inside the evidence archive.
