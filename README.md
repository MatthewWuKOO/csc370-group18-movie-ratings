# CSC 370 Group 18: Movie Ratings Database

**Project type:** Solo MySQL database project (the repository name still contains "group18").

The Movie Ratings System is intended to let users browse and search movies, see genres and other users' reviews, rate each movie from 1 to 5, and eventually see rating counts and averages. The repository currently contains the **database schema and design documentation**, not a finished user interface.

## Requirements

1. Each user has a unique account and username.
2. Each movie has a title and release year and can belong to multiple genres.
3. A user can rate many movies, but can have only one active rating for each movie.
4. Ratings are integers from 1 (lowest) to 5 (highest), with no half scores such as 3.5.
5. A rating can include an optional written review and records when it was made.
6. Users can change or delete their own ratings and reviews.
7. Users can search movies by title or genre and read other users' reviews.
8. The system calculates each movie's rating count and average from its ratings.

## Implemented database design

- `Table.sql`: creates the database and five tables: `app_user`, `movie`, `genre`, `rating`, and `movie_genre`.
- `MovieRatingSystemERD.drawio`: conceptual entity-relationship diagram.
- `docs/normalization_review.md`: FD projection, minimal basis, 3NF, BCNF, and 4NF checks against the movie-rating requirements.
- `tests/sample_data.sql`: reproducible example rows and inspection queries.
- `.github/workflows/mysql-validation.yml`: automated MySQL 8 schema/constraint validation (check the Actions run result rather than assuming it passed).

**Design decision:** a movie is identified by `movie_id`, not title. Distinct movies may have the same title, so `UNIQUE(title)` has been removed. Usernames and genre names remain unique. `rating` uses the composite primary key `(user_id, movie_id)` so each user has at most one active rating per movie.

## Project Kick-Off feedback: fixes and evidence

The teaching team's feedback identified three delivery issues and two planning issues. This table maps each point to a concrete change or remaining submission action.

| Feedback | Change / evidence | How to verify |
| --- | --- | --- |
| DDL did not run because the `movie` and `genre` PRIMARY KEY lines lacked commas before UNIQUE constraints | The missing commas were corrected in `Table.sql` after the Kick-Off submission. A fresh schema test is now provided. | Run `Table.sql` with MySQL 8, confirm five tables are created, and check the CI logs. |
| No evidence for a normalized relational database, FDs or BCNF | Added `docs/normalization_review.md` with an FD/minimal-basis/projection example and individual 3NF/BCNF/4NF checks. | Recalculate the closures and check determinants against candidate keys using the documented business rules. |
| No commit hash in submission | Each Sprint submission **must include the exact final Git commit SHA**, as well as the repository link and video. | Copy the commit SHA from `git rev-parse HEAD` or the corresponding GitHub commit page at submission time. |
| No explicit current limitation or objective improvement measure | Added the limitations and measurable criteria below. | Compare each criterion against a query, design proof, or test result. |
| Some module objectives not covered; success criteria not explicit | Each proposed goal below names a course topic and objective pass condition. | Cross-check against Brightspace's exact module competencies before submitting. |

**Important:** a committed SQL file or test workflow is not sufficient proof that MySQL executed it successfully. Capture the **successful MySQL/Actions output** and show it in the Sprint video; disclose and fix any failing checks.

## Kick-Off Sprint goals (original plan, retained for comparison)

1. I have requirements, an ERD, and five SQL tables for my movie-rating system. I still need to check the design using the Advanced Relational Design lessons.
2. As we learn FDs in ERDs, minimal bases and projecting FDs, 3NF, and 4NF, I will use an example from my tables for each lesson. I will check whether the lesson shows a problem in my design.
3. By the end of the sprint, I will update my ERD or SQL if needed.
4. Course-level goal: I will check that my ERD and SQL tables match my movie-rating requirements, and fix any mistakes I find.
5. Optional: start learning about the Medallion data model and sketch how I could keep original data, clean it, and use it for movie-rating summaries.

## This sprint: progress and measurable success criteria

**Current limitations:** At Kick-Off, the submitted DDL had syntax errors, and I did not show the FD/BCNF reasoning needed to justify a normalized design. The database currently defines tables but has not yet delivered the promised search and rating-statistics queries. The priority this sprint is to substantiate the database design rather than build an unrelated feature.

| Goal | Course-level / lesson competency | Objective success criterion | Evidence to show |
| --- | --- | --- | --- |
| Verify working MySQL DDL and constraints | Implement a correct relational schema with keys and integrity constraints | All **five tables** create in a fresh MySQL 8 database; valid sample rows insert; invalid score, missing FK, and duplicate rating are rejected | SQL/CI output from `Table.sql` and `tests/sample_data.sql` |
| Project FDs and compute a minimal basis | Lecture 12: closures, minimal bases, projecting FDs | Show closures for all **seven nonempty subsets** of a three-attribute projection and reduce to a minimal basis | Section 1 of `docs/normalization_review.md` |
| Check 3NF and BCNF | Lecture 23 and BCNF material: keys, prime attributes, normalization | State keys and nontrivial FD basis for **all five tables**; demonstrate at least one 3NF/BCNF violation in a combined-table counterexample, and explain why the split design avoids it | Section 2 of `docs/normalization_review.md` |
| Check 4NF and independent multivalued facts | Lecture 24: MVD, 4NF and decomposition | Exhibit an example of **one non-trivial MVD** that violates 4NF, then explain the separation into `movie_genre` and `rating` | Section 3 of `docs/normalization_review.md` |

**Progress-report honesty:** The design work is documented in this branch. SQL execution must still be supported by actual MySQL output. The optional Medallion-model goal is not demonstrated by the current repo and should not be claimed as completed.

## Next sprint: planned Advanced SQL work (not yet implemented)

**Current limitation for the next sprint:** Tables and constraints alone do not provide the movie search and summary features promised in requirements 7 and 8.

| Planned goal | Advanced SQL topic | Objective success criterion |
| --- | --- | --- |
| Search movies by genre | Multi-table `JOIN` | One query joining `movie`, `movie_genre`, and `genre` returns the correct movie IDs for **two tested genres**. |
| Calculate movie statistics | `GROUP BY`, `COUNT`, `AVG`, `HAVING` | One query returns verified rating counts and averages for **three test movies**, and a filtered summary returns the expected subset. |
| Find movies above an average | Subquery | A query comparing movie ratings against a computed average matches independently calculated expected results for the sample dataset. |
| Demonstrate query correctness | SQL validation / testing | Save executable SQL and expected output; run all planned queries on the sample data, with no SQL errors. |

These are **proposed** targets aligned with core Advanced SQL techniques. The final plan must be checked against the specific Brightspace Advanced SQL competency list; do not claim that a module is fully covered before that check.

## How to demonstrate the database with MySQL

Use a **new, empty copy** of the project database for testing. `Table.sql` creates tables and will report existing-table errors if re-run on a populated schema. Do not drop an existing database containing useful data just to re-run the demo.

```bash
mysql -u root -p < Table.sql
mysql -u root -p < tests/sample_data.sql
```

Then inspect tables, keys, and constraints:

```sql
USE csc370_movie_ratings;
SHOW TABLES;
SHOW CREATE TABLE movie;
SHOW CREATE TABLE rating;
SHOW CREATE TABLE movie_genre;
SELECT * FROM rating;
```

The GitHub Actions workflow also attempts to reject an out-of-range rating, duplicate user/movie rating, missing referenced user, missing referenced genre, and duplicate username. Its **run logs** are the test evidence.

## Submission reminder

For the Sprint submission, provide **(1)** the GitHub repository URL, **(2)** the exact commit hash of the version being demonstrated, and **(3)** the video showing goals, evidence, challenges, and next-sprint planning. Confirm the video duration limit with the TA, as the written example conflicts with its formula.
