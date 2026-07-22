# OCLM AI Command Lineage Profile — Phase AI-B2

## Status

Phase AI-B2 extends the verified Phase AI-B1 command-lineage core with bounded multi-agent delegation.

The model introduces a two-hop delegation chain:

```text
Authority
  -> Root Agent A
  -> Delegated Agent B
  -> Delegated Agent C
  -> Action
  -> Verifier
  -> Execution Gateway
```

## Core objective

A delegated agent must not acquire execution legitimacy unless its authority is a legitimate descendant of the same Root Command lineage.

## Symbolic attenuation

Phase AI-B2 represents delegated scope as a structural descendant:

```text
S1 = attenuate(S0, R1)
S2 = attenuate(S1, R2)
```

where:

- `S0` is the Root Command scope,
- `R1` and `R2` are delegation restrictions,
- `S1` and `S2` are child scopes.

This proves lineage-preserving derivation under the symbolic model.

It does not yet prove that an arbitrary real-world policy language implements mathematical subset semantics correctly. Concrete policy-lattice refinement remains a later obligation.

## Primary targets

Phase AI-B2 targets:

1. honest two-hop delegation is reachable,
2. delegated execution is reachable,
3. first delegation requires a matching Root Command,
4. second delegation requires the matching first delegation,
5. first delegated scope is derived only from its parent scope,
6. second delegated scope is derived only from its parent scope,
7. execution requires one coherent Root Command and delegation lineage,
8. cross-Root-Command delegation splicing cannot produce accepted execution,
9. the final Action Certificate is bound to the delegated leaf Agent,
10. the executed scope remains a nested attenuation descendant of the Root Command scope.

## Formal boundary

Phase AI-B2 does not yet establish:

- arbitrary delegation depth,
- a concrete policy-language subset algorithm,
- delegation revocation,
- agent-key compromise recovery,
- quorum delegation,
- independent witness composition,
- implementation-level gateway bypass resistance,
- natural-language intent correctness,
- complete AI safety.

Phase AI-B1 remains authoritative for its own verified properties.
