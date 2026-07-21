# 6. Verification Methodology and Reproducibility

## 6.1 Evidence Basis

Phase 2 was conducted against the frozen Phase 1 Tamarin source set and was later normalized into a final evidence package containing the models, generated attack theories, proof logs, machine-readable result tables, validation metadata, and SHA-256 manifests.

The frozen Phase 2 evidence archive used by this paper is:

```text
oclm-phase2-final-evidence-20260721T050537Z.zip
SHA-256:
de36e384b7583ddde8dfc655ac51eeb517bb64011b5cf4d59a850aad62abb51e
```

The archive passed a ZIP integrity test before inclusion in the publication draft. The evidence files cited in this section are retained inside that archive rather than reconstructed from memory or from later summaries.

## 6.2 Verification Environment

The initial 88-target battery recorded the following execution environment:

| Component | Recorded value |
|---|---|
| Operating system | macOS 26.5.2, arm64 |
| Darwin kernel | 25.5.0 |
| Tamarin Prover | 1.12.0 |
| Maude | 3.5.1 |
| Graphviz | 15.1.0 |
| Python | 3.9.6 |
| Initial worker count | 4 |
| Initial per-target timeout | 1,800 seconds |
| Source mode | Local directory |
| Source root | `~/Desktop/oclm` |

The Tamarin build recorded in the logs reports a compilation timestamp of 2026-03-08 09:49:47 UTC. The recorded Git revision and branch were `UNKNOWN`; therefore this paper identifies the verifier by its reported version and captured executable output rather than by an unverified source revision.

## 6.3 Source-Integrity Preflight

Before attack execution, the battery performed a preflight comparison over the 17 Phase 1 Tamarin theories.

For each theory, the preflight compared:

- filename;
- SHA-256 digest;
- byte size;
- rule count; and
- lemma count.

The preflight recorded:

```text
expected model files: 17
actual model files:   17
manifest result:      PASS
```

All expected and actual entries matched. This matters because Phase 2 was intended to attack the already frozen Phase 1 theories, not an altered or simplified substitute.

The attack-generation process preserved the protocol rules of the selected source theory and introduced a dedicated adversarial property. The generated theory was separately hashed and stored. Phase 2 therefore distinguishes:

1. the canonical Phase 1 source model;
2. the generated attack theory containing the test lemma; and
3. the proof log produced from that generated theory.

## 6.4 Counterexample-Oriented Attack Construction

Most Phase 1 security statements were universal trace properties. For adversarial validation, their failure conditions were expressed as explicit existential attack lemmas.

Schematically, a source property of the form:

```text
All x #i.
    Accepted(x) @ #i
    ==> RequiredCondition(x, #i)
```

was challenged by an attack property of the form:

```text
Ex x #i.
    Accepted(x) @ #i
    & not RequiredCondition(x, #i)
```

The generated attack lemma was declared as an `exists-trace` property. This permits the verifier to search directly for a trace witnessing the proposed violation.

Not every attack was a literal negation of one pre-existing lemma. Some Phase 2 properties, including the provenance-injectivity tests, were newly written adversarial formulations. In every case, however, the target was a concrete symbolic counterexample condition rather than an informal claim that a model “looked secure.”

## 6.5 Verdict Semantics

The verdict rules were intentionally asymmetric for attack and health properties.

### 6.5.1 Attack properties

For an `exists-trace` attack lemma:

| Tamarin result | Phase 2 interpretation |
|---|---|
| `verified` | A counterexample trace exists; the attack is **BROKEN** |
| `falsified - no trace found` | No modeled attack trace was found; the attack **SURVIVES** |
| timeout, incomplete analysis, or invalid artifact | **UNVERIFIED** |

Thus, “SURVIVES” does not mean that a universal theorem was inferred merely from silence. It means that Tamarin completed the specified symbolic search and falsified the existential attack property under the model.

### 6.5.2 Health and reachability properties

For an `exists-trace` health lemma:

| Tamarin result | Phase 2 interpretation |
|---|---|
| `verified` | The selected lifecycle is **REACHABLE** |
| `falsified` | The selected lifecycle is not demonstrated reachable |
| timeout or invalid artifact | **UNVERIFIED** |

The eight health properties are representative executability checks. They do not prove universal liveness, fairness, or availability.

## 6.6 Clean-Artifact Criteria

The first battery established the logical direction of most results, but publication required a stricter evidence standard. A result was treated as a clean final artifact only when all of the following were present:

1. the expected target verdict line;
2. `All wellformedness checks were successful.`;
3. no derivation-check timeout marker;
4. no non-zero wellformedness warning count;
5. the expected model and log files; and
6. SHA-256 digests recorded in the normalized result set.

This distinction separates two questions:

- Did the symbolic attack search find a counterexample?
- Is the preserved proof artifact clean enough to support publication and independent review?

Intermediate logs containing a completed search result but a derivation-check or wellformedness warning were retained as historical evidence, but they were not used as the final direct evidence when a warning-free rerun was available.

## 6.7 Initial Battery Execution

The initial battery contained 88 principal targets:

```text
80 adversarial attack properties
 8 health and reachability properties
88 total targets
```

The recorded battery interval was:

```text
started:   2026-07-20T08:06:00.176168Z
completed: 2026-07-20T08:39:01.600707Z
```

The orchestration layer used four concurrent jobs and a per-target timeout of 1,800 seconds. The ordinary per-property command shape was:

```bash
tamarin-prover <model-or-generated-theory.spthy> \
  --prove=<target-lemma>
```

The initial aggregate result was:

```text
attack SURVIVES:  76
attack BROKEN:     0
attack UNVERIFIED: 4
health REACHABLE:  8
health failed:     0
```

The four initially unresolved attacks were A14, A46, A47, and A48. Their unresolved state was treated as a computational result, not as a security failure and not as a successful proof.

## 6.8 Warning-Free Direct Reruns

Sixteen principal targets were later replaced by warning-free direct reruns. This set consisted of fifteen attack properties and one health property.

The reruns used the same stored theories and target lemmas, while enabling source saturation and a search heuristic that proved effective for the larger C3 search spaces. The general command form was:

```bash
tamarin-prover <theory.spthy> \
  --derivcheck-timeout=<seconds> \
  --auto-sources \
  --heuristic=s \
  --prove=<target-lemma> \
  +RTS -N2 -RTS
```

The derivation-check timeout was selected per rerun:

- 600 seconds for the grouped cleanup, H03, and A14;
- 1,200 seconds for A46; and
- 1,800 seconds for A47.

The direct reruns produced clean final evidence for:

```text
A04, A08, A13, A14, A16,
A25, A42, A43, A44, A46,
A47, A73, A77, A79, A80,
and H03
```

Every one of those attack properties ended with `falsified - no trace found`; H03 ended with `verified`. All corresponding final logs recorded successful wellformedness checks.

## 6.9 Integrated A48 Proof

### 6.9.1 Reason for decomposition

A48 was the only principal target not closed by the ordinary existential attack search. Its direct search explored a substantially larger state space and did not complete within the practical resource budget used for the battery.

Rather than weaken the original C3 protocol rules or reduce the security property, the proof obligation was decomposed into three helper lemmas:

```text
H1: same Child ID
    -> same lineage

H2: same generated lineage
    -> same public ancestry tuple

H3: uncompromised acceptance
    -> matching generated origin
```

The final A48 statement then used those structural facts to establish that two accepted past identities for the same Child must agree on the bound tuple unless a modeled target epoch key or root key was compromised before a relevant acceptance.

### 6.9.2 Integrated invocation

H1, H2, H3, and the final A48 property were selected in the same Tamarin invocation:

```bash
tamarin-prover \
  oclm_phase1c3_a48_decomposed_h1_h2_h3.spthy \
  --derivcheck-timeout=1800 \
  --auto-sources \
  --heuristic=s \
  --prove=a48_h1_same_child_id_implies_same_lineage \
  --prove=a48_h2_same_generated_lineage_implies_same_public_tuple \
  --prove=a48_h3_uncompromised_acceptance_has_generated_origin \
  --prove=past_epoch_identity_is_bound_or_target_compromised \
  +RTS -N2 -RTS
```

The integrated log records:

```text
H1:  verified (6 steps)
H2:  verified (2 steps)
H3:  verified (52 steps)
A48: verified (8 steps)

All wellformedness checks were successful.
Processing time: 707.76 seconds
```

The integrated artifacts are fixed by:

```text
model SHA-256:
6a674d76a6c37479a10c727387a9a5771b7557064781ea4411b658e9bf355133

log SHA-256:
7a3b2b0e6b64e2d8bfca323dce4ca49c267fb78286044a11e4c39645a4a714c1
```

The shell wrapper completed the Tamarin run and produced the full log, but a later macOS `awk` post-processing command failed before the already stored process status was printed or written. The final metadata therefore records the exit status as `NOT_CAPTURED_POSTPROCESS` rather than inventing a value. The proof log itself is complete, contains all four verification results and the successful wellformedness statement, and is preserved under the digest above.

## 6.10 Final Evidence Normalization

The final evidence builder combined three evidence paths:

| Evidence path | Principal targets |
|---|---:|
| Original warning-free runs | 71 |
| Warning-free direct reruns | 16 |
| Integrated A48 proof | 1 |
| **Total** | **88** |

The normalization step performed machine checks before writing the final table. It required:

- exactly 88 unique principal IDs;
- exactly 80 attack rows;
- exactly eight health rows;
- `SURVIVES` for every attack row;
- `REACHABLE` for every health row;
- existence of each referenced model and log;
- expected verdict text in each referenced log;
- clean wellformedness evidence for the selected final artifact; and
- SHA-256 calculation over each selected model and log.

A48 was treated specially: the normalized A48 row points to the integrated all-traces proof rather than to the timed-out direct attack search.

The normalization completed with:

```text
FINAL VALIDATION PASSED
ATTACK SURVIVES: 80/80
COUNTEREXAMPLES: 0
UNRESOLVED: 0
HEALTH REACHABLE: 8/8
A48 HELPERS VERIFIED: 3/3
```

## 6.11 Frozen Result Files

The primary normalized result files are:

```text
FINAL_88_RESULTS.csv
SHA-256:
4c9451cdb967914940c63742cc15bcb65ac6cf7870973becf8e3e6e942147e26

A48_HELPER_RESULTS.csv
SHA-256:
1de210e2480955b57e287af3dbb0853f69f85a4ad753f763081ad83643770405

FINAL_REPORT.md
SHA-256:
0fc16e9416e0d56c49cd0d13cb92dc5958916cbb43e871b46a9c96d9adc19da8

FINAL_VALIDATION.json
SHA-256:
428b0de447dbf3144b8c0c91fbbed40e6a2bad5b022917a8f729fc38d53391dd

MANIFEST.sha256
SHA-256:
fedfe11b3134780a8cdd425c2eeb5b75acfa2e6e618cd83e531047b111fc3960
```

The final CSV is the authoritative machine-readable map from each principal target to its selected final model, log, verification method, verdict, and evidence digest.

## 6.12 Reproduction Levels

Independent review can be performed at three levels.

### Level 1: Package-integrity verification

This level confirms that the downloaded release is byte-identical to the published archive and that the internal manifest matches.

```bash
shasum -a 256 oclm-phase2-final-evidence-20260721T050537Z.zip
unzip -tq oclm-phase2-final-evidence-20260721T050537Z.zip
```

After extraction:

```bash
cd oclm-phase2-final-evidence-20260721T050537Z
shasum -a 256 -c MANIFEST.sha256
```

### Level 2: Result-to-log audit

This level inspects `FINAL_88_RESULTS.csv`, opens every referenced evidence log, confirms the expected verdict and clean wellformedness statement, and recalculates model and log hashes.

The publication package includes a verification helper for this artifact-level audit. It does not rely on the original absolute `/Users/hiro/...` paths embedded in historical metadata.

### Level 3: Computational rerun

This level reruns selected or all Tamarin targets from the stored theories.

For ordinary attack targets:

```bash
tamarin-prover models/generated_theories/<attack-theory>.spthy \
  --prove=<attack-lemma>
```

For health targets:

```bash
tamarin-prover models/phase1_tamarin/<phase1-model>.spthy \
  --prove=<health-lemma>
```

For the final A48 result, the integrated command in Section 6.9.2 should be used.

The frozen final evidence archive preserves the theories, logs, result tables, and metadata needed for per-property reruns and auditing. The original Python orchestration wrapper that launched the initial parallel battery is not part of the frozen final-evidence archive; therefore byte-for-byte reproduction of that wrapper's scheduling behavior is not claimed. The mathematical targets and the Tamarin invocations remain independently rerunnable.

## 6.13 Reproducibility Boundaries

Several practical factors can change runtime without changing the target property:

- Tamarin and Maude versions;
- processor architecture and available memory;
- source-saturation behavior;
- heuristic choice;
- parallel runtime settings;
- derivation-check timeout; and
- implementation changes in future verifier versions.

A rerun that times out is not a counterexample and is not a proof. A verifier-version difference should be reported together with the exact environment and command used.

Conversely, artifact-level verification does not rerun symbolic search. It establishes that the reviewer is examining the same models, logs, and normalized decisions that form the Phase 2 publication record.

## 6.14 Methodological Summary

The Phase 2 method can be summarized as follows:

```text
freeze Phase 1 source models
        -> verify source manifest
        -> generate explicit attack theories
        -> run 80 attack searches and 8 health checks
        -> retain counterexamples, timeouts, and logs without reinterpretation
        -> rerun warning-bearing completed targets cleanly
        -> decompose and integrate A48 without weakening protocol rules
        -> normalize exactly 88 principal results
        -> hash models, logs, tables, and archive
        -> publish the frozen evidence
```

This process does not convert model assumptions into claims about every implementation. It provides a reproducible chain from a stated symbolic attack property to the exact theory, log, verdict rule, and digest used in the final Phase 2 result.
