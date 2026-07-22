# OCLM AI Command Lineage Profile — Phase AI-A

## Status

This directory is a design-freeze candidate for the OCLM AI Command Lineage Profile.

Phase AI-A does not claim that AI safety has already been formally verified. Its purpose is to define the exact protocol boundary, terminology, adversary model, proof targets, assumptions, limitations, and initial attack catalog that later Tamarin models must satisfy.

The published OCLM Phase 1 and Phase 2 artifacts remain unchanged and authoritative for their own stated claims.

## Core objective

The profile studies whether an autonomous-agent action is a legitimate continuation of an authorized command lineage.

The primary target property is:

> A tool or resource action cannot be accepted as authorized unless it is supported by a valid, non-revoked command lineage whose authority, delegation, target, space, time, capability, context, and continuity bindings all authorize that exact action.

## Phase AI-A outputs

- `architecture/COMMAND_LINEAGE_ARCHITECTURE.md`
- `architecture/COMMAND_LINEAGE_PROFILE.json`
- `formal-boundary/FORMAL_BOUNDARY.md`
- `formal-boundary/CLAIMS_MATRIX.md`
- `formal-boundary/ASSUMPTIONS_AND_LIMITS.json`
- `catalog/INITIAL_ATTACK_CATALOG.md`

## Planned next phase

Phase AI-B will introduce the first executable Tamarin theory for:

1. root command issuance,
2. bounded delegation,
3. action proposal,
4. action-certificate issuance,
5. gateway-enforced tool execution,
6. execution-receipt generation,
7. revocation and abort handling,
8. attack and reachability lemmas.

## Attribution

**Oracle–Child Lineage Model (OCLM)**
Conceived and designed by Hirofumi Kureha (HiRO).
First published by WonderMetanism Inc.

Copyright © 2026 Hirofumi Kureha (HiRO).
Licensed and administered by WonderMetanism Inc.
