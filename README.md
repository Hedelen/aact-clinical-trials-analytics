# AACT Clinical Trials Analytics

SQL and Python analysis of ClinicalTrials.gov data using the AACT PostgreSQL database, focused on clinical trial operations, timelines, bottlenecks, and outcomes.

## Current project stage

The project is currently in the data-understanding and schema-mapping phase. The AACT PostgreSQL snapshot has been restored locally and the `ctgov` schema is being explored before narrowing to the subset of tables needed for the main analysis.

## Work completed so far

- Restored the AACT ClinicalTrials.gov PostgreSQL database locally.
- Confirmed the `ctgov` schema contains 52 tables.
- Explored PostgreSQL metadata for tables, primary keys, and foreign keys.
- Used sampling methods for efficient exploration of large tables.
- Generated a full entity-relationship diagram (ERD) in DBeaver.
- Identified `studies` and several results-related tables as important hubs in the schema.

## Repository structure

- `sql/` — SQL used for schema exploration and analysis.
- `docs/` — schema diagrams and project documentation.
- `PROJECT_LOG.md` — concise running record of project progress and decisions.

## Data source

AACT (Aggregate Analysis of ClinicalTrials.gov), a relational PostgreSQL representation of ClinicalTrials.gov data.

Raw AACT database dumps are intentionally excluded from this repository.
