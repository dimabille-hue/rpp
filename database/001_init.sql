-- ===========================================================
-- Regional Property Intelligence Platform
-- Initial database structure
-- Version: 0.1
-- ===========================================================

CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE EXTENSION IF NOT EXISTS btree_gist;

CREATE SCHEMA IF NOT EXISTS raw;
CREATE SCHEMA IF NOT EXISTS staging;
CREATE SCHEMA IF NOT EXISTS core;
CREATE SCHEMA IF NOT EXISTS market;
CREATE SCHEMA IF NOT EXISTS factors;
CREATE SCHEMA IF NOT EXISTS analytics;
CREATE SCHEMA IF NOT EXISTS report;
CREATE SCHEMA IF NOT EXISTS system;

COMMENT ON SCHEMA raw IS 'Исходные данные';
COMMENT ON SCHEMA staging IS 'Промежуточная обработка';
COMMENT ON SCHEMA core IS 'Основные объекты';
COMMENT ON SCHEMA market IS 'Рыночные наблюдения';
COMMENT ON SCHEMA factors IS 'Факторы стоимости';
COMMENT ON SCHEMA analytics IS 'Аналитика';
COMMENT ON SCHEMA report IS 'Представления';
COMMENT ON SCHEMA system IS 'Служебные данные';
