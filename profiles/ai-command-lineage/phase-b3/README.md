# OCLM AI Command Lineage — Phase AI-B3

Version: 0.4.0-ai-b3

Phase AI-B3 formalizes revocation, controlled Agent compromise,
command-wide emergency stop, branch-local subtree revocation, and bounded
subtree recovery.

The final Phase AI-B3 proof basis is deliberately decomposed into three
independent Tamarin models.

1. Emergency Stop Core

   Responsibility:

   - command-wide emergency stop,
   - stopped-epoch execution rejection,
   - fresh-epoch restart,
   - stale Action Certificate rejection across restart,
   - leaf-Agent compromise under uncompromised Authority and Verifier,
   - Authority-authorized exact-action binding,
   - single-use Action Certificates.

   Verified lemmas: 14/14.

2. Subtree Revocation Core

   Responsibility:

   - controlled intermediate Agent-B compromise,
   - targeted revocation of the B -> C subtree,
   - revocation after Action Certificate issuance,
   - later execution rejection for the revoked subtree,
   - invalidation of an already-issued unused certificate after subtree
     revocation.

   Verified lemmas: 5/5.

3. Subtree Recovery Core

   Responsibility:

   - bounded one-generation replacement of a revoked B -> C subtree,
   - fresh B' and C' identities,
   - fresh Authority execution-scope authorization,
   - fresh Verifier Action Certificate,
   - rejection of old certificates in the replacement lineage,
   - single-use replacement authorization.

   Verified lemmas: 7/7.

Total verified proof obligations across the Phase AI-B3 proof bundle:
26/26.

These 26 properties are not claimed to be a single 26-lemma theorem over
one monolithic transition system. They are a composition bundle of three
independently scoped formal models.

An experimental monolithic model is retained under results/diagnostics.
It is diagnostic evidence only and is not part of the final verified proof
basis.
