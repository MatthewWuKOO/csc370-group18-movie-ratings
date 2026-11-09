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

Open a terminal in the project root directory and connect to MySQL.

Run the following commands in the MySQL client:

```sql
SOURCE sprint2/00_reset.sql
SOURCE sprint2/01_data.sql
SOURCE sprint2/02_validate.sql
```

Run the implemented queries:

```sql
SOURCE sprint2/queries/genre_search.sql
SOURCE sprint2/queries/rating_statistics.sql
SOURCE sprint2/queries/above_average.sql
```

For the video demonstration:

```sql
SOURCE sprint2/video_demo.sql
```

**Warning:** The reset script permanently deletes existing data in the five project tables and recreates them using Table.sql. The video demonstration also runs the reset script.

## Current Limitations

The project currently provides SQL queries rather than a graphical interface. Query correctness has been tested, but query execution algorithms and performance have not yet been analyzed.


## Goals for Final

The Final stage will cover the remaining course modules: ACID Transactions, Basic Security, and Analysing Query Algorithms.

| Goal | Course Topic | Success Criteria |
|---|---|---|
| Implement transactions | ACID Transactions | Test COMMIT and ROLLBACK with rating operations |
| Improve database security | Basic Security | Create a read-only user and verify access restrictions |
| Analyze query execution | Analysing Query Algorithms | Explain execution plans for 3 existing queries |
| Evaluate query performance | Analysing Query Algorithms | Compare query execution using 2 dataset sizes |

### Planned Work

- **Transactions:** Use transactions to manage rating updates and deletions, and verify that ROLLBACK restores previous data.
- **Security:** Apply database user permissions and test whether unauthorized modifications are rejected.
- **Query Algorithms:** Use EXPLAIN to examine how MySQL executes JOIN, aggregation, and subqueries.
- **Performance:** Compare query execution with different dataset sizes and investigate possible improvements.

### Expected Final Results

- Working transaction examples with successful COMMIT and ROLLBACK tests.
- Database access restrictions with verification.
- Execution plans for the three existing SQL queries.
- Query performance comparisons and possible improvements.