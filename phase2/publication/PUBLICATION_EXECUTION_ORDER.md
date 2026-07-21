# OCLM Phase 2 Publication Execution Order

## 1. GitHub

1. Commit the frozen public-release repository.
2. Confirm `.zenodo.json`, `CITATION.cff`, the Phase 2 release ZIP, and SHA-256 files are present.
3. Create tag `oclm-phase2-v2.0.0`.
4. Create the GitHub Release using `GITHUB_RELEASE.md`.
5. Attach `oclm_phase2_adversarial_validation_20260721.zip` and its `.sha256` file.

## 2. Zenodo

1. Confirm the GitHub repository is enabled in Zenodo.
2. Allow Zenodo to ingest the GitHub release, or upload the exact frozen release ZIP manually.
3. Use the metadata in `.zenodo.json` and `ZENODO_UPLOAD.md`.
4. Before publishing, confirm:
   - creator name and ORCID;
   - version `2.0.0`;
   - publication date `2026-07-21`;
   - public access;
   - custom OCLM license note;
   - exact release ZIP;
   - Phase 1 DOI reference.
5. Publish and record the minted DOI and record URL.

## 3. Post-DOI metadata update

Update the default branch only:

- root `CITATION.cff`;
- `phase2/CITATION.cff`;
- root `OCLM_PHASE2_PUBLICATION_MANIFEST.json`;
- `phase2/publication/PUBLICATION_VARIABLES.json`;
- root README and Phase 2 README DOI links.

Do not alter the frozen `oclm-phase2-v2.0.0` tag or replace the attached release ZIP.

## 4. Official website

Replace the placeholders in:

- `WEBSITE_ANNOUNCEMENT_JA.md`;
- `WEBSITE_ANNOUNCEMENT_EN.md`.

Publish the official page and record its URL.

## 5. Official X account

Replace the GitHub and Zenodo placeholders in `X_ANNOUNCEMENT_JA.md`, then publish the thread.

## 6. Final cross-check

Confirm the SHA-256 shown on GitHub, Zenodo, and the official website is identical.
