# Phase AI-B3 — Emergency Stop Proof Scope

This model isolates command-wide emergency stop and fresh-epoch restart from
subtree-local revocation and subtree replacement/recovery.

Verified obligations cover:

- healthy Authority-authorized execution,
- emergency stop after certificate issuance,
- emergency stop after leaf-Agent compromise,
- prohibition of later execution under a stopped epoch,
- invalidation of an already-issued certificate after stop,
- Authority-controlled fresh-epoch restart,
- restart only after prior emergency stop,
- stale-certificate rejection after restart,
- fresh certificate execution in the restarted epoch,
- exact Authority action authorization,
- Verifier-controlled certificate issuance under leaf compromise,
- Gateway dependence on a Verifier-issued certificate,
- single-use Action Certificates,
- epoch separation of Action Certificates.

Intermediate-Agent subtree compromise, subtree-local revocation and subtree
replacement/recovery are separate Phase AI-B3 proof obligations.
