# OCLM Phase 1-B2 — Verified Time–Space Window Baseline

Date: 2026-07-17
Tamarin Prover: 1.12.0
Maude: 3.5.1
Graphviz: 15.1.0

## Verified results

- executable_complete_window_lifecycle:
  verified (8 steps)

- generated_child_has_open_window_ancestry:
  verified (4 steps)

- generated_child_precedes_matching_close:
  verified (20 steps)

- generated_parent_a_precedes_close:
  verified (20 steps)

- generated_parent_b_precedes_close:
  verified (20 steps)

- window_generates_at_most_once:
  verified (12 steps)

## Proven scope

Within this symbolic state-transition model:

1. A complete Oracle–Parent–Child–Close lifecycle is executable.

2. Every generated Child has:
   - a prior Oracle window-opening event,
   - a prior Parent A participation event,
   - a prior Parent B participation event.

3. Both Parent participation events precede Child generation.

4. A matching window-close event occurs after Child generation.

5. Closing a window consumes the current open-generation state.

6. One issuance window generates at most one Child.

## Precise meaning

The Time–Space window is not merely metadata attached to a Child.

It is a causal generation state that must remain open while both Parents
participate and the Child is generated. Once the state is consumed by
closure or generation, it cannot be reused to create another Child.

## Not yet proven

- Numeric wall-clock comparisons
- Accuracy of external clock sources
- Physical-location authenticity
- External signed verification combined with the window state machine
- Forward security after later Oracle-key compromise
- Independence from conflicting Parent claims and consensus votes
- Computational probability bounds
- Concrete implementation correctness
