# CSC 370 Group 18: Movie Ratings Database

This project builds a MySQL-backed movie rating system. Users can search movies by title or genre, rate movies from 1 to 5, write reviews, and view average ratings.

## Requirements

1. Each user has a unique account and username.
2. Each movie has a title, release year, and can belong to multiple genres.
3. Each user can have only one active rating per movie.
4. Ratings are integers from 1 to 5, with an optional review and timestamp.
5. Users can edit or delete their own ratings.
6. Users can search movies and view reviews, average scores, and rating counts.

## Goals for Sprint 1 (Set at Project Kick-Off)

1. Review the existing requirements, ERD, and five SQL tables using Advanced Relational Design.
2. Apply Functional Dependencies, Minimal Basis, FD Projection, 3NF, and 4NF to evaluate the database design.
3. Improve the ERD or SQL if necessary.
4. Verify that the ERD and SQL match the project requirements.
5. Optional: Explore the Medallion data model.

## Sprint 1 Progress

- Fixed the SQL syntax errors from the Project Kick-Off.
- Removed UNIQUE(title) to allow movies with the same title.
- Completed the Normalization Review, including FDs,
  Minimal Basis, FD Projection, 3NF, BCNF, and 4NF.
- Successfully created all five tables in MySQL.
- Inserted sample data and verified Primary Key,
  Foreign Key, and CHECK constraints.

## Current Limitations

The database still requires final SQL validation and documented normalization evidence. It also does not yet include SQL queries for movie searching or calculating rating statistics.

## Goals for Sprint 2 — Advanced SQL

| Goal | Course Topic | Success Criteria |
|---|---|---|
| Search movies by genre | JOIN | Correct results for 2 tested genres |
| Calculate average ratings and rating counts | GROUP BY, AVG, COUNT, HAVING | Correct results for 3 movies |
| Find movies rated above average | Subqueries | Results match expected calculations |
| Test database queries | SQL Testing | All planned queries execute correctly |

