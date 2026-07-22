# OCLM AI Command Lineage Profile — Formal Boundary

## Established before this profile

The frozen OCLM Phase 1 and Phase 2 releases provide formal foundations for canonical lineage, origin and predecessor binding, time and space constraints, signed composition, forward-secure epochs, monotonic verifier state, revocation, transparency, split-view evidence, and generalized security composition under their stated models and assumptions.

Those results are not modified by this profile.

## Defined in Phase AI-A

Phase AI-A defines:

- the AI command-lineage architecture,
- the actors and protocol artifacts,
- the exact authorization bindings,
- the deterministic execution-gateway boundary,
- the initial adversary capabilities,
- the first attack and health catalog,
- the claims that Phase AI-B must prove,
- the assumptions and non-claims that limit those proofs.

## Target of Phase AI-B

The first dedicated AI Tamarin model will target the following central property:

> No tool or resource execution is accepted unless a valid Action Certificate exists for the exact action and that certificate descends from a valid, non-revoked Root Command through a valid, non-amplifying delegation lineage.

Supporting targets include:

- command-origin authenticity,
- exact action and argument binding,
- target, space, time, capability, and resource scope inclusion,
- delegation non-amplification,
- action-certificate non-transferability,
- replay resistance,
- revocation monotonicity,
- receipt-to-action correspondence,
- explicit compromise conditions,
- reachability of honest command and execution lifecycles.

## Assumed for the planned model

- symbolic cryptographic constructors and equations,
- collision-free symbolic hashing and canonical domain separation,
- explicit compromise events and temporal order,
- correctness of the modeled scope-inclusion predicates,
- deterministic enforcement by the Execution Gateway,
- absence of a production tool path that bypasses the gateway,
- correctness of modeled time, space, target, and resource evidence predicates,
- faithful refinement between implementation events and model events,
- integrity of Tamarin execution and preserved evidence.

## Not established by Phase AI-A

- any completed AI-specific Tamarin proof,
- correctness of natural-language command interpretation,
- moral alignment or benevolence of an AI model,
- absence of harmful action proposals,
- absence of zero-day vulnerabilities,
- security of every implementation,
- truth of every physical or external observation,
- resistance to all covert channels or side channels,
- privacy, anonymity, availability, or economic security,
- safety of tools that can be reached outside the Execution Gateway,
- exhaustion of every possible AI-agent attack.

## Publication-safe Phase AI-A statement

> OCLM Phase AI-A defines a command-lineage profile and formal proof boundary for binding autonomous-agent actions to authenticated authority, bounded delegation, exact execution scope, monotonic revocation, and execution evidence. No dedicated AI-agent security theorem is claimed as verified until the Phase AI-B Tamarin theories and preserved proof evidence are complete.
