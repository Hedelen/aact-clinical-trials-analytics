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
