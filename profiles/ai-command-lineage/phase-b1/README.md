# OCLM AI Command Lineage Profile — Phase AI-B1

## Status

Phase AI-B1 is the first executable AI-specific Tamarin model.

It formalizes the clean command-lineage core:

1. authority and agent initialization,
2. authenticated Root Command issuance,
3. potentially arbitrary Agent Action Proposal,
4. exact scope validation,
5. verifier-signed Action Certificate issuance,
6. gateway-enforced one-time execution,
7. execution-receipt binding,
8. monotonic Root Command revocation before execution.

## Primary property

No tool execution is accepted unless it descends from:

- an issued Root Command,
- the Agent named by that Root Command,
- an Agent-signed Action Proposal,
- an exact target, space, time-window, capability, resource, and context match,
- a Verifier-signed Action Certificate,
- an active, non-revoked Root Command,
- a previously unused Action Certificate.

## Deliberately outside Phase AI-B1

- Agent-to-Sub-Agent delegation,
- authority attenuation across delegation chains,
- actual clock or epoch semantics,
- in-flight abort after execution begins,
- key-compromise exception paths,
- independent witness quorum,
- transparency-log composition,
- implementation-level gateway bypass,
- natural-language intent interpretation,
- model alignment or moral reasoning,
- zero-day and side-channel elimination.

These are later phases and are not claimed by Phase AI-B1.
