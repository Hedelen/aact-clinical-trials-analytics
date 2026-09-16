# Project Log

## 2026-09-15 — Initial setup and schema exploration

### Completed
- Downloaded and restored the AACT PostgreSQL snapshot locally.
- Connected to the database through pgAdmin and DBeaver.
- Confirmed the `ctgov` schema contains 52 tables.
- Explored PostgreSQL metadata using `pg_tables` and `information_schema`.
- Built an initial query to map primary-key and foreign-key constraints to their columns.
- Tested `TABLESAMPLE SYSTEM` for fast exploration of multi-million-row tables.
- Generated a full entity-relationship diagram (ERD) for the AACT schema in DBeaver.

### Current direction
The project is being scoped toward clinical-trial operations and bottleneck analysis rather than bioinformatics or market-strategy work. The next step is to reduce the 52-table schema to a smaller working set centered on `studies` and related operational tables.

### Next steps
- Create a smaller working ERD focused on the likely analysis tables.
- Profile the `studies` table and identify fields related to phase, status, enrollment, start dates, completion dates, and study type.
- Identify the subset of supporting tables needed for operations / bottleneck analysis.
- Continue committing SQL and documentation as the project develops.
