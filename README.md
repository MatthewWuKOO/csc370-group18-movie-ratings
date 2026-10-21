# CSC 370 Group 18: Movie Ratings Database

This project builds a MySQL-backed movie rating system. Users can search movies by title or genre, rate movies from 1 to 5, write reviews, and view average ratings.

## Requirements

1. Each user has a unique account and username.
2. Each movie has a title, release year, and one or more genres.
3. Each user can have only one active rating per movie.
4. Ratings are integers from 1 to 5, with an optional review and timestamp.
5. Users can edit or delete their own ratings.
6. Users can search movies and view reviews, average scores, and rating counts.

## Goals for Sprint 1

1. Complete the requirements, ERD, and five SQL tables.
2. Apply Functional Dependencies, Minimal Basis, FD Projection, 3NF, and 4NF to review the database design.
3. Improve the ERD or SQL if necessary.
4. Verify that the database design matches the project requirements.
5. Optional: Explore the Medallion data model.

## Sprint 1 Progress

- Fixed the SQL syntax errors identified in the Project Kick-Off feedback.
- Successfully tested the five tables and database constraints using MySQL 8.
- Reviewed the database design using Functional Dependencies, Minimal Basis, FD Projection, 3NF, BCNF, and 4NF.
- Identified possible improvements to the database design, including the movie title constraint.

## Current Limitations

The database structure is established, but it does not yet include SQL queries for movie searching or rating statistics. The previous submission also lacked clear normalization evidence and measurable success criteria.

## Goals for Sprint 2 — Advanced SQL

| Goal | Course Topic | Success Criteria |
|---|---|---|
| Search movies by genre | JOIN | Correct results for 2 tested genres |
| Calculate average ratings and rating counts | GROUP BY, AVG, COUNT, HAVING | Correct results for 3 movies |
| Find movies rated above average | Subqueries | Results match expected calculations |
| Test database queries | SQL Testing | All planned queries execute correctly |

