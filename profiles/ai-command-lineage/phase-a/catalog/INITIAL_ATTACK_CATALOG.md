# OCLM AI Command Lineage Profile — Initial Attack and Health Catalog

## Status

This is the Phase AI-A candidate catalog.

No entry is marked verified. Phase AI-B must map every retained entry to an exact Tamarin theory, lemma, verification method, result log, and evidence hash.

## Initial counts

- candidate attack classes: **16**
- candidate health and reachability properties: **5**
- AI-specific verified attack classes at Phase AI-A: **0**
- AI-specific verified health properties at Phase AI-A: **0**

## Command origin and action authorization

| ID | Objective | Planned result condition |
|---|---|---|
| AI-A01 | Can an attacker forge a Root Command without authority compromise? | No accepted command unless matching authorized issuance exists or the declared authority is compromised |
| AI-A02 | Can an agent obtain an Action Certificate without a valid Root Command lineage? | No issued Action Certificate without a valid command origin and parent lineage |
| AI-A03 | Can one Action Certificate authorize a different action or different arguments? | Certificate acceptance binds the exact action, tool, arguments, target, and resource |
| AI-A04 | Can a certificate issued to one agent be transferred to another agent? | Certificate acceptance binds the intended agent identity |

## Delegation and scope amplification

| ID | Objective | Planned result condition |
|---|---|---|
| AI-A05 | Can a sub-agent receive capabilities not held by its delegator? | Every accepted delegation is a non-amplifying subset of active parent authority |
| AI-A06 | Can separate delegation chains be spliced into one apparently valid lineage? | Accepted lineage has one coherent origin and parent chain unless an explicit compromise condition holds |
| AI-A07 | Can an allowed target be substituted with an unauthorized third-party target? | Accepted execution target exactly satisfies the authorized target scope |
| AI-A08 | Can an agent escape the authorized execution space or network domain? | Accepted execution space is included in the active command and delegation scopes |
| AI-A09 | Can an action execute outside its authorized time window? | Accepted execution occurs only while command, delegation, and action certificate are temporally valid |
| AI-A10 | Can read-only authority be widened into write, delete, exploit, or administrative authority? | Accepted capability is a subset of every active parent scope |

## Resource, credential, and execution control

| ID | Objective | Planned result condition |
|---|---|---|
| AI-A11 | Can an agent use a credential or resource not named by the command lineage? | Accepted execution binds the exact authorized resource and credential class |
| AI-A12 | Can an agent execute a tool action without passing through the Execution Gateway? | No accepted execution event exists without gateway validation of a valid Action Certificate |
| AI-A13 | Can an Action Certificate be replayed after one-time use or nonce consumption? | One-time execution certificates cannot authorize a second accepted execution |
| AI-A14 | Can a revoked command, delegation, or certificate authorize later execution? | Post-revocation acceptance requires an explicit modeled compromise or declared exception |
| AI-A15 | Can an in-flight action finalize after an applicable abort or emergency stop? | Finalization after abort is rejected unless the declared in-flight policy explicitly permits it |

## Receipt and evidence substitution

| ID | Objective | Planned result condition |
|---|---|---|
| AI-A16 | Can an execution receipt claim a different action, result, target, or certificate? | Every accepted receipt corresponds to the exact certified and observed execution unless the required witness is compromised |

## Health and reachability properties

| ID | Objective | Planned result |
|---|---|---|
| AI-H01 | Honest root-command issuance is reachable | REACHABLE |
| AI-H02 | Honest bounded delegation to a sub-agent is reachable | REACHABLE |
| AI-H03 | Honest action proposal, certificate issuance, and gateway execution are reachable | REACHABLE |
| AI-H04 | Honest receipt generation and verification are reachable | REACHABLE |
| AI-H05 | Honest revocation or abort prevents a later unauthorized execution while preserving an allowed pre-revocation lifecycle | REACHABLE |

## First integrated scenario

The first model should include an abstract benchmark-evaluation scenario:

```text
Root Command:
Evaluate exploit capability inside the declared benchmark environment.

Allowed:
- declared benchmark targets,
- declared sandbox,
- declared tools,
- declared test credentials,
- declared time window.

Denied:
- third-party production targets,
- external-network escape,
- undeclared credentials,
- answer or dataset theft,
- any capability not inherited from the command lineage.
```

The security result must not depend on the agent understanding that the external action is unethical. It must depend on the absence of a valid execution lineage and the deterministic refusal of the Execution Gateway.

## Attribution

**Oracle–Child Lineage Model (OCLM)**
Conceived and designed by Hirofumi Kureha (HiRO).
First published by WonderMetanism Inc.

Copyright © 2026 Hirofumi Kureha (HiRO).
Licensed and administered by WonderMetanism Inc.
