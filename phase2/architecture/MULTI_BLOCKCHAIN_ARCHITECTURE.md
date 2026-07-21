# OCLM Multi-Blockchain Architecture Note

## Core position

OCLM does not replace blockchain consensus.

It binds chain-local records into an authenticated lineage above multiple chains.

```text
Blockchain A ─┐
Blockchain B ─┼─> Evidence adapters ─> OCLM lineage validation ─> Application action
Blockchain C ─┘
```

## Four logical layers

1. **Chain-local execution**  
   Transactions, ownership, finality, revocation, and local application state.

2. **Evidence extraction**  
   Inclusion proofs, checkpoints, state proofs, signed attestations, or threshold evidence.

3. **OCLM lineage validation**  
   Origin, predecessor, time, space/domain, context, authorization, and continuity.

4. **Application action**  
   Mint, activate, release, recognize, transfer, or reject.

## Canonical migration

```text
Source lineage state
+ authorized transition
+ source finality evidence
+ destination generation
= canonical successor
```

Identifier equality by itself is insufficient.

## Required invariants

- origin binding
- predecessor binding
- source/destination domain binding
- transition uniqueness
- temporal ordering
- context binding
- monotonic verification
- explicit compromise handling

## Current proof boundary

Phase 2 verifies symbolic properties of the inherited Phase 1 models.

It does not yet provide a complete implementation-refinement proof for a concrete bridge or blockchain deployment.
