# OCLM Security Policy

## Oracle–Child Lineage Model (OCLM)

Version 1.0

Copyright © 2026 Hirofumi Kureha (HiRO).
Licensed and administered by WonderMetanism Inc.

---

## 1. Purpose

This security policy applies to the official Oracle–Child
Lineage Model (OCLM) Phase 1 publication and its associated
formal models, verification results, release archives,
integrity records, and reproduction scripts.

OCLM is publicly verifiable.

Independent researchers are encouraged to report material
security, verification, integrity, or reproducibility issues
responsibly.

---

## 2. Supported Release

The currently supported official public release is:

OCLM Phase 1<br>
Version 1.0.0<br>
Tag: oclm-phase1-v1.0.0

Status:

FORMALLY VERIFIED<br>
COMPLETE

Canonical publication authority:

WonderMetanism Inc.

---

## 3. In-Scope Reports

The following reports are considered in scope:

- a reproducible counterexample to a published OCLM
  security claim;
- a Tamarin trace that invalidates a lemma represented
  as verified;
- a mismatch between the published formal model and
  the stated verification result;
- an integrity failure involving an official release ZIP,
  SHA-256 record, manifest, or proof index;
- a reproducibility failure caused by an error in an
  official script, command, dependency specification,
  or documented procedure;
- an unsafe or exploitable behavior in an official
  reproduction or verification script;
- a material ambiguity that causes the published
  security scope to misrepresent what was formally verified;
- unauthorized modification or substitution of an
  official OCLM publication artifact;
- a vulnerability in an official OCLM implementation
  expressly published by WonderMetanism Inc.

A report should identify the exact affected file,
release, model, lemma, command, or artifact whenever possible.

---

## 4. Out-of-Scope Reports

The following are not handled as security reports:

- general disagreement with the OCLM theory;
- unsupported claims without a reproducible trace,
  model, artifact, or technical explanation;
- feature requests;
- commercial licensing inquiries;
- requests for official certification;
- vulnerabilities in independent third-party implementations;
- vulnerabilities caused solely by modifying the official
  materials outside the published verification conditions;
- social engineering, spam, or denial-of-service testing;
- attempts to access systems, accounts, or data without
  explicit authorization.

Research criticism and non-security technical discussion
should use the repository's ordinary contribution process.

Commercial and certification inquiries should be directed
to WonderMetanism Inc.

---

## 5. Reporting a Security Issue

Do not disclose an unremediated issue publicly when doing so
would materially increase the risk of exploitation,
artifact substitution, or false verification claims.

Use one of the following private reporting channels:

1. GitHub Private Vulnerability Reporting or a private
   GitHub Security Advisory, when available for this repository.

2. The official WonderMetanism Inc. contact channel:

   https://www.wonder-metanism.com

The report should include:

- reporter name or chosen identifier;
- affected OCLM version;
- affected files and paths;
- affected lemma or security claim;
- technical description;
- reproduction commands;
- expected result;
- actual result;
- proof trace, model, logs, or hashes;
- potential impact;
- suggested correction, when available.

Do not include credentials, personal data, or unrelated
confidential information.

---

## 6. Verification of Reports

WonderMetanism Inc. will evaluate reports against:

- the canonical OCLM specification;
- the published attacker model;
- the stated assumptions;
- the exact formal model;
- the verified lemma set;
- the published artifact hashes;
- the documented reproduction environment.

A behavior outside the formally specified model or its
stated assumptions does not automatically invalidate
a published verification result.

However, an ambiguity or omission that materially misstates
the verified scope may still require correction.

---

## 7. Coordinated Disclosure

When a report is confirmed, WonderMetanism Inc. may coordinate
with the reporter regarding:

- validation of the finding;
- affected versions and artifacts;
- correction or mitigation;
- release of a new version;
- publication timing;
- reporter acknowledgment.

Published artifacts will not be silently replaced.

A confirmed correction will be released using:

- a new version;
- a new commit;
- a new signed tag;
- new SHA-256 values;
- an updated release record;
- an explanatory security notice.

---

## 8. No Unauthorized Testing

This policy does not authorize:

- access to non-public systems;
- bypassing authentication or authorization;
- disruption of services;
- acquisition of confidential information;
- testing against third-party systems;
- destructive testing;
- impersonation or social engineering.

Testing must remain limited to materials and systems
explicitly made available for public verification.

---

## 9. Security Scope

Formal verification establishes properties only within
the published formal model, attacker model, assumptions,
and lemma definitions.

It does not by itself establish that every independent
implementation, deployment environment, integration,
dependency, device, operator, or surrounding system
is secure.

Only an implementation expressly identified by
WonderMetanism Inc. as official may be described as an
official OCLM implementation.

---

## 10. Attribution

Oracle–Child Lineage Model (OCLM)

Conceived and designed by<br>
Hirofumi Kureha (HiRO)

Founder & CEO of<br>
WonderMetanism Inc.

First published by<br>
WonderMetanism Inc.
