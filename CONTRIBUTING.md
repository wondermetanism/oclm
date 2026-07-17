# Contributing to OCLM

## Oracle–Child Lineage Model (OCLM)

Version 1.0

Copyright © 2026 Hirofumi Kureha (HiRO).
Licensed and administered by WonderMetanism Inc.

---

## 1. Purpose

Oracle–Child Lineage Model (OCLM) is publicly available for
independent verification, non-commercial research,
technical criticism, and educational use.

Contributions that improve reproducibility, identify genuine
counterexamples, correct technical errors, or clarify the
formally verified scope are welcome.

The canonical OCLM specification, governance, official
releases, certification rules, and commercial authorization
remain under the authority of WonderMetanism Inc.

---

## 2. Appropriate Contributions

Appropriate contributions include:

- reproducible counterexamples;
- corrections to formal models;
- corrections to proof records or manifests;
- improvements to verification reproducibility;
- documentation corrections;
- clarification of assumptions or attacker models;
- additional non-commercial verification results;
- portability improvements for verification scripts;
- precise technical criticism supported by evidence;
- proposals for future formal verification work.

Submissions should be technically specific and independently
reviewable.

---

## 3. Contributions That Require Prior Discussion

Open an issue before preparing a substantial change involving:

- changes to the OCLM truth semantics;
- changes to lineage acceptance conditions;
- new security properties or lemmas;
- changes to the attacker model;
- new protocol layers;
- modifications affecting multiple verified phases;
- changes to release packaging or integrity records;
- proposed official terminology;
- proposed compatibility or conformance rules.

Prior discussion does not guarantee acceptance.

---

## 4. Out-of-Scope Contributions

The following are not accepted through the ordinary
contribution process:

- requests for commercial-use authorization;
- proprietary product integrations;
- requests for official certification;
- unauthorized OCLM branding or compliance claims;
- changes that silently replace published artifacts;
- changes that remove or weaken required attribution;
- submissions claiming ownership or origination of OCLM;
- unrelated features or general-purpose framework additions;
- unsupported assertions without reproducible evidence.

Commercial, integration, certification, and partnership
requests must be directed separately to WonderMetanism Inc.

---

## 5. Security Reports

Do not submit a public issue for an undisclosed security,
integrity, or verification defect that could materially
increase the risk of exploitation, artifact substitution,
or false verification claims.

Follow the private reporting process defined in:

SECURITY.md

---

## 6. Required Information

A technical issue or contribution should include, where
applicable:

- affected OCLM version;
- affected phase;
- affected file paths;
- affected lemma or security claim;
- Tamarin version;
- operating system and architecture;
- exact reproduction commands;
- expected result;
- actual result;
- relevant traces, logs, models, or hashes;
- explanation of the technical impact;
- proposed correction.

Reports that cannot be reproduced may require additional
evidence before they can be evaluated.

---

## 7. Formal Model Changes

Changes to a Tamarin model must:

- identify the exact original model;
- explain the semantic purpose of the change;
- preserve unrelated behavior;
- include the exact verification command;
- identify all affected lemmas;
- include complete verification output;
- disclose newly introduced assumptions or restrictions;
- avoid representing partial verification as complete.

A modified model must not be described as canonical or
official unless WonderMetanism Inc. formally accepts and
publishes it as such.

---

## 8. Frozen Releases

Files under the official frozen release set must not be
silently modified or replaced.

Published artifacts are immutable historical records.

A correction to a published artifact requires:

- a new version;
- a new commit;
- a new signed tag;
- new SHA-256 values;
- updated integrity records;
- an explanation of the correction.

Do not overwrite an existing release ZIP, proof record,
manifest, or hash record.

---

## 9. Pull Request Requirements

A pull request should:

- address one coherent technical purpose;
- use the smallest reasonable change set;
- avoid unrelated formatting changes;
- identify generated files;
- identify binary files;
- include verification commands;
- include verification results;
- explain whether published hashes are affected;
- preserve attribution and license notices.

WonderMetanism Inc. may request that a proposal be divided
into smaller changes before review.

---

## 10. Attribution and Authorship

Submitting a contribution does not alter the original
attribution of OCLM.

Oracle–Child Lineage Model (OCLM) was conceived and designed
by Hirofumi Kureha (HiRO) and first published by
WonderMetanism Inc.

Contributors may be acknowledged for specific accepted
technical contributions.

Contribution acknowledgment does not confer:

- ownership of OCLM;
- joint authorship of the original OCLM theory;
- governance authority;
- certification authority;
- commercial-use rights;
- official implementation status;
- permission to use controlled names or marks.

---

## 11. Rights in Submitted Contributions

By submitting a contribution, you represent that:

- you have the right to submit the contribution;
- the contribution does not knowingly infringe
  third-party rights;
- any third-party material is clearly identified;
- the contribution may be reviewed publicly.

Acceptance of a contribution may require a separate
Contributor License Agreement or other written permission,
particularly where commercial licensing, official
implementation, or future specification use is involved.

Submission alone does not guarantee incorporation into
the canonical OCLM publication.

---

## 12. Canonical Governance

WonderMetanism Inc. determines:

- the canonical OCLM specification;
- official OCLM versions;
- accepted formal models;
- official lemma sets;
- official verification records;
- release status;
- compatibility definitions;
- certification and conformance rules;
- official implementation status;
- commercial authorization.

Independent forks and research variants must clearly state
that they are not the canonical OCLM publication and are not
officially approved unless written authorization states
otherwise.

---

## 13. Review Outcomes

A contribution may be:

- accepted;
- accepted with modifications;
- deferred;
- incorporated into a later version;
- retained as independent research;
- rejected.

Technical discussion and independent criticism remain
permitted even when a proposal is not incorporated into
the canonical OCLM publication.

---

## 14. Official Source

Canonical publication authority:

WonderMetanism Inc.

Official website:

https://www.wonder-metanism.com

---

## 15. Attribution

Oracle–Child Lineage Model (OCLM)

Conceived and designed by<br>
Hirofumi Kureha (HiRO)

Founder & CEO of<br>
WonderMetanism Inc.

First published by<br>
WonderMetanism Inc.
