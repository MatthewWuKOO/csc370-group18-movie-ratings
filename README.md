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

Advanced SQL queries for movie searching and rating
statistics are not implemented yet.

The optional Medallion data model was not explored.

## Goals for Sprint 2 — Advanced SQL

| Goal | Course Topic | Success Criteria |
|---|---|---|
| Search movies by genre | JOIN | Correct results for 2 tested genres |
| Calculate average ratings and rating counts | GROUP BY, AVG, COUNT, HAVING | Correct results for 3 movies |
| Find movies rated above average | Subqueries | Results match expected calculations |
| Test database queries | SQL Testing | All planned queries execute correctly |

## Sprint 2 Progress

All four planned goals were completed.

- **Genre Search:** Implemented multi-table JOIN queries to search movies by genre. Tested with Drama and Sci-Fi.
- **Rating Statistics:** Used GROUP BY, COUNT, AVG, HAVING, and LEFT JOIN to calculate movie statistics, including movies without ratings.
- **Above-Average Movies:** Used a scalar subquery to find movies whose average ratings are higher than the overall average.
- **SQL Testing:** Verified query results, NULL handling, and database constraints.

Additional Advanced SQL tests included INSERT, UPDATE, DELETE, IS NULL, and COALESCE.

The dataset was expanded to 10 users, 20 movies, 2 genres, 22 movie-genre relationships, and 50 ratings.

The main challenge was making the database independent of Sprint 1 data. This was solved by creating separate reset, data insertion, and validation scripts.

## Sprint 2 Files

| File | Purpose |
|---|---|
| Table.sql | Creates the database schema |
| sprint2/00_reset.sql | Resets and recreates all five tables |
| sprint2/01_data.sql | Inserts the complete Sprint 2 dataset |
| sprint2/02_validate.sql | Validates data and query results |
| sprint2/queries/genre_search.sql | Searches movies by genre |
| sprint2/queries/rating_statistics.sql | Calculates rating statistics |
| sprint2/queries/above_average.sql | Finds above-average movies |
| sprint2/video_demo.sql | Runs the video demonstration |

## How to Run Sprint 2

Requirements: MySQL 8.0.

Run the following commands in the MySQL client:

```sql
SOURCE sprint2/00_reset.sql
SOURCE sprint2/01_data.sql
SOURCE sprint2/02_validate.sql
```

Run the implemented queries (only after the above commands):

```sql
SOURCE sprint2/queries/genre_search.sql
SOURCE sprint2/queries/rating_statistics.sql
SOURCE sprint2/queries/above_average.sql
```

For the video demonstration:

```sql
SOURCE sprint2/video_demo.sql
```

## Current Limitations

Although all Sprint 2 goals were completed, query performance, transaction management, and database security have not yet been fully explored.

These areas will be addressed in the Final stage.



## Goals for Final

The Final stage will cover ACID Transactions, Basic Security, and Analysing Query Algorithms.

| Goal | Course Topic | Success Criteria |
|---|---|---|
| Implement transactions | ACID Transactions | Verify COMMIT and ROLLBACK using rating operations |
| Improve database security | Basic Security | Create a read-only user and test access restrictions |
| Analyze B+-tree operations | External Memory Model and Index Design | Analyze lookup, range query, and insert I/O costs |
| Compare logical query plans | SQL Query Plans | Construct two equivalent plans for an existing JOIN query |
| Analyze query optimization | Physical Query Optimization | Compare the cost of applying selections before and after joins |

### Planned Work

- **Transactions:** Test COMMIT and ROLLBACK when modifying ratings.
- **Security:** Create a read-only database user and verify access restrictions.
- **B+-tree Analysis:** Analyze lookup, range query, and insertion I/O costs using the external memory model.
- **Logical Query Plans:** Construct equivalent query plans for the existing Genre Search query.
- **Query Optimization:** Analyze how pushing selections through joins can affect query execution cost.
