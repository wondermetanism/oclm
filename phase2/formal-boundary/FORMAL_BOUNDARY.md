# OCLM Phase 2 — Formal Boundary

## Verified in Phase 2

- 80 symbolic adversarial attack classes ruled out
- 0 counterexample traces
- 0 unresolved attack classes
- 8/8 health and reachability properties reachable
- A48 H1/H2/H3 and final property verified in one integrated invocation
- exact model, log, metadata, and hash evidence preserved

## Assumed

- symbolic cryptographic constructors and equations
- signature and hash behavior represented by the models
- declared compromise events and their temporal order
- modeled key erasure
- correctness of accepted Oracle and external-ledger evidence predicates
- verifier behavior as represented by the theories
- integrity of the Tamarin execution and captured artifacts

## Not established

- truth of every physical Oracle observation
- security of every software implementation
- concrete cryptographic reduction
- side-channel resistance
- universal availability or liveness
- privacy or anonymity
- economic security
- security of every blockchain consensus system
- complete end-to-end refinement into the C6B contract
- security of an unspecified production bridge

## Publication-safe result statement

> Under the stated OCLM Phase 1 and Phase 2 symbolic models, attacker capabilities, cryptographic abstractions, and compromise conditions, all 80 tested adversarial attack classes were ruled out, no counterexample trace was found, no attack class remained unresolved, and all eight representative health and reachability properties were reachable.
