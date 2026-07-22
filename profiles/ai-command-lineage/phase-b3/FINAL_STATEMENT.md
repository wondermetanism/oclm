# Phase AI-B3 Final Formal Statement

Phase AI-B3 establishes a formally verified command-revocation and bounded
recovery layer for the OCLM AI Command Lineage Profile under the assumptions
and boundaries of its three symbolic Tamarin models.

## Verified Emergency Stop properties

Within the Emergency Stop Core model:

- an Authority-issued emergency stop prevents later accepted execution under
  the stopped command epoch;
- an already-issued Action Certificate cannot be used for accepted execution
  after a certified command has been stopped;
- restart requires a prior emergency stop and creates a fresh command epoch;
- stale Action Certificates cannot cross the restart boundary;
- a fresh post-restart proposal, certificate, and accepted execution are
  reachable;
- accepted execution remains dependent on an Authority-authorized exact
  action and a Verifier-issued Action Certificate;
- modeled compromise of the leaf Agent does not bypass those requirements;
- an Action Certificate is single-use;
- Action Certificates cannot cross command epochs.

## Verified subtree-revocation properties

Within the Subtree Revocation Core model:

- controlled compromise of intermediate Agent B can be followed by an
  Authority-issued targeted revocation of the B -> C subtree;
- the subtree can still be revoked after an Action Certificate has already
  been issued;
- after subtree revocation, later accepted execution by the revoked leaf
  lineage is impossible;
- an already-issued but unused Action Certificate cannot execute after its
  subtree has been revoked;
- healthy authorized subtree execution remains reachable before revocation.

This is branch-local revocation and does not require command-wide emergency
stop in that model.

## Verified bounded-recovery properties

Within the Subtree Recovery Core model:

- a compromised certified old subtree can be revoked, replaced, freshly
  authorized, freshly certified, and successfully executed;
- replacement requires a matching prior Authority revocation;
- replacement creates fresh B' and C' Agent identities;
- a fresh replacement Action Certificate requires Authority reauthorization
  of the replacement execution scope;
- accepted replacement execution requires a fresh Verifier-issued
  certificate;
- an old Action Certificate cannot be carried into the replacement lineage;
- replacement authorization is single-use for the modeled revoked subtree.

## Composition boundary

Phase AI-B3 is a composition proof bundle.

The three models intentionally isolate separate proof responsibilities:

    Emergency Stop
        command-wide stop and fresh-epoch restart

    Subtree Revocation
        branch-local B -> C invalidation

    Subtree Recovery
        one-generation revoked-subtree replacement

The 26 verified properties are therefore not represented as one monolithic
26-lemma transition-system theorem.

An attempted experimental monolithic composition caused Tamarin derivation
and source-precomputation explosion. That model and associated diagnostics
are retained as research evidence, but they are not used as proof evidence
for the final Phase AI-B3 claims.

## Explicit non-claims

Phase AI-B3 does not prove:

- natural-language intent correctness;
- moral alignment or universal AI safety;
- universal prevention of all zero-day exploitation;
- security after Authority compromise;
- security after Verifier compromise;
- security after Execution Gateway compromise;
- arbitrary repeated or unbounded subtree replacement generations;
- concrete real-world policy-subset semantics for symbolic attenuation;
- side-channel or covert-channel elimination;
- availability;
- privacy;
- universal implementation security;
- exhaustive coverage of every possible AI attack.

Authority authorization in these models is exact-action symbolic
authorization. It must not be overstated as a proof of arbitrary real-world
policy interpretation.
