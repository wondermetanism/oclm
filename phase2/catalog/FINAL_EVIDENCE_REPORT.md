# OCLM Phase 2 — Final Adversarial Validation Report

## Final result

- Symbolic adversarial attack classes: **80**
- Attack classes ruled out: **80/80**
- Counterexample traces found: **0**
- Unresolved attack classes: **0**
- Health and reachability properties: **8/8 reachable**

These results apply under the formal models, cryptographic abstractions, adversary capabilities, and assumptions stated in the OCLM Phase 1 and Phase 2 artifacts.

## Evidence composition

- Original warning-free runs: **71**
- Warning-free direct reruns: **16**
- A48 integrated all-traces proof: **1**

## A48 integrated result

The final A48 evidence verifies, in the same Tamarin invocation:

- H1: same Child ID implies the same lineage
- H2: the same generated lineage implies the same public tuple
- H3: uncompromised acceptance has a matching generated origin
- Final: past-epoch identity is bound or a target key was compromised

All wellformedness checks completed successfully.
