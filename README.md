# Kendrix Entity Resolution

Enterprise-style Entity Resolution / Master Data Management proof of concept
for the University of Auckland Datathon.

## Problem

The same real-world organisation can appear differently across multiple systems
because of inconsistent names, address changes and incomplete identifiers.

## Goal

Build a trusted single organisation view while preserving:

- source records
- matching evidence
- confidence scores
- exception handling
- auditability

## Source systems

1. GETS Supplier
2. Charities Register
3. IRD Donee Organisations
4. Business Registry / NZBN

LINZ NZ Addresses is used as authoritative address reference data.

## Platforms

- AWS
- Snowflake
- GitHub / GitHub Actions
- Terraform

## Architecture

Source systems
→ AWS S3
→ Snowflake RAW
→ Standardisation
→ Candidate Generation
→ Matching
→ Master Organisation
→ Review / Audit

## Current implementation stage

- [x] Stage 1 — Repository
- [ ] Stage 2 — Terraform foundation
- [ ] Stage 3 — S3 ingestion
- [ ] Stage 4 — Snowflake connection
- [ ] Stage 5 — Standardisation
- [ ] Stage 6 — Entity Resolution MVP
- [ ] Stage 7 — Master data
- [ ] Stage 8 — CI/CD
- [ ] Stage 9 — LINZ
- [ ] Stage 10 — AI/RAG
- [ ] Stage 11 — Demo