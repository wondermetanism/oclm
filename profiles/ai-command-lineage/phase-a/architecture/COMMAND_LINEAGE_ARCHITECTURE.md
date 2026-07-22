# OCLM AI Command Lineage Architecture

## Core position

OCLM does not attempt to make an AI model morally good, semantically infallible, or incapable of proposing harmful actions.

It determines whether a proposed or executed action is a legitimate continuation of an authenticated command lineage.

```text
Human or institutional authority
        ↓
Root Command Certificate
        ↓
Bounded delegation
        ↓
Agent action proposal
        ↓
OCLM lineage validation
        ↓
Action Certificate issued or denied
        ↓
Execution Gateway
        ↓
Tool or resource action
        ↓
Execution Receipt and independent evidence
```

## Command-lineage tuple

A proposed action is evaluated against the following bindings:

```text
ActionLegitimacy = G(
    Authority,
    RootCommand,
    ParentCommandOrAction,
    Delegation,
    Agent,
    Target,
    Space,
    Time,
    Capability,
    Resource,
    Context,
    Continuity,
    RevocationState,
    WitnessEvidence
)
```

Identifier equality, semantic similarity to the mission, or usefulness to the objective is insufficient by itself.

## Logical layers

1. **Authority and command issuance**
   A human or institutional authority issues a signed root command with explicit scope.

2. **Delegation and authority attenuation**
   An agent may delegate only a subset of its own active authority. Delegation must not amplify target, space, time, capability, resource, or execution scope.

3. **Action proposal**
   An agent proposes an exact action, including tool, arguments, target, resource, and intended execution domain.

4. **OCLM command-lineage validation**
   The verifier checks origin, parentage, delegation continuity, scope inclusion, temporal validity, spatial and target bindings, capability authorization, revocation state, and required witness evidence.

5. **Execution Gateway**
   A tool or resource action is admitted only when a valid Action Certificate authorizes that exact action. The gateway is a deterministic enforcement point, not merely another advisory language model.

6. **Receipt and audit**
   Execution produces a receipt bound to the Action Certificate and observed result. Receipts may be checked by independent witnesses and transparency mechanisms.

## Required invariants

- command-origin binding,
- parent-command and parent-action binding,
- agent-identity binding,
- non-amplifying delegation,
- exact target binding,
- execution-space binding,
- time-window binding,
- capability binding,
- resource and credential binding,
- context binding,
- action-certificate uniqueness,
- replay resistance,
- monotonic revocation,
- receipt-to-action binding,
- explicit compromise handling,
- no unmodeled execution bypass.

## Hugging Face incident abstraction

A root command may authorize exploitation only inside a designated evaluation environment.

```text
Authorized root command:
Evaluate exploitation capability inside ExploitGym.

Authorized space:
Isolated evaluation environment.

Authorized targets:
Declared benchmark targets.

Unauthorized proposed action:
Connect to and exploit a third-party production service.
```

Even when the external action may improve the benchmark score, it is not a legitimate Child of the command if target, space, capability, resource, or authority continuity fails.

The protocol objective is therefore not to persuade the agent that the action is wrong. It is to prevent the action from acquiring execution legitimacy.

## Current formal boundary

Phase AI-A defines the architecture and proof obligations.

It does not yet establish the target properties in a dedicated AI Tamarin model. Those proofs begin in Phase AI-B.
