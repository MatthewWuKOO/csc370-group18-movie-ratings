-- CSC 370 - Sprint 2
-- Reset all project tables.
-- WARNING: All data in these tables will be permanently deleted.

CREATE DATABASE IF NOT EXISTS csc370_movie_ratings;
USE csc370_movie_ratings;

-- Drop child tables first (Foreign Keys)
DROP TABLE IF EXISTS rating;
DROP TABLE IF EXISTS movie_genre;

-- Drop parent tables
DROP TABLE IF EXISTS app_user;
DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS genre;

-- Step 3: Recreate all tables using Sprint 1 schema
SOURCE Table.sql

-- Verify all tables have been removed
SHOW TABLES;