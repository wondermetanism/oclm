# Post-Publication DOI Update

After Zenodo publishes the Phase 2 record, replace the following null values and placeholders on the default branch:

- `zenodo_doi`
- `zenodo_record_url`
- `{{ZENODO_DOI}}`
- `{{ZENODO_DOI_URL}}`
- `{{ZENODO_RECORD_URL}}`

Do not rebuild or replace the frozen release ZIP merely to insert its own DOI.

The Git tag and attached ZIP remain immutable. DOI metadata is added to the continuing default branch and official website.
