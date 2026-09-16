SET search_path TO ctgov, public;

-- =====================================================
-- 1. DATABASE INVENTORY
-- =====================================================

-- List all tables in the AACT ctgov schema
SELECT
    schemaname,
    tablename
FROM pg_tables
WHERE schemaname = 'ctgov'
ORDER BY schemaname, tablename;


-- =====================================================
-- 2. PRIMARY / FOREIGN KEY EXPLORATION
-- =====================================================

-- Identify primary-key and foreign-key constraints and the columns they use
SELECT
    tc.table_name,
    tc.constraint_name,
    tc.constraint_type,
    kcu.column_name
FROM information_schema.table_constraints AS tc
LEFT JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
    AND tc.table_schema = kcu.table_schema
    AND tc.table_name = kcu.table_name
WHERE tc.table_schema = 'ctgov'
  AND tc.constraint_type IN ('PRIMARY KEY', 'FOREIGN KEY')
ORDER BY tc.table_name, tc.constraint_type DESC;


-- =====================================================
-- 3. SANDBOX / DATA EXPLORATION
-- =====================================================

-- Fast exploratory sample from a large table
SELECT *
FROM baseline_measurements
TABLESAMPLE SYSTEM (0.01)
LIMIT 100;


-- =====================================================
-- 4. FIRST PRACTICE ANALYSIS
-- =====================================================

/*
Question:
Among completed interventional studies, which clinical trial phases tend to
have the longest duration from start date to completion date?
*/

-- Final query
SELECT
    phase,
    ROUND(AVG(completion_date - start_date), 2) AS avg_num_days,
    ROUND(
        PERCENTILE_CONT(0.5) WITHIN GROUP (
            ORDER BY completion_date - start_date
        )::numeric,
        2
    ) AS median_num_days,
    COUNT(*) AS num_studies
FROM studies
WHERE study_type = 'INTERVENTIONAL'
  AND overall_status = 'COMPLETED'
  AND phase != 'NA'
GROUP BY phase
HAVING COUNT(*) > 100
ORDER BY avg_num_days DESC;


-- Exploration step 1: inspect fields relevant to the question
SELECT
    target_duration,
    study_type,
    overall_status,
    phase,
    start_date,
    completion_date
FROM studies;


-- Exploration step 2: inspect available study types
SELECT DISTINCT study_type
FROM studies;


-- Additional sandbox queries
SELECT * FROM interventions;
SELECT * FROM studies;

SELECT schema_name
FROM information_schema.schemata;
