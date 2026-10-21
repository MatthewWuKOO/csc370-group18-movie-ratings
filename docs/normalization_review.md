# Relational Design Review (CSC 370)

This review documents the *evidence* requested in the Project Kick-Off feedback: functional dependencies (FDs), candidate keys, normalization checks, and a BCNF justification. It applies the course material from **Projecting FDs (Lecture 12)**, **3NF (Lecture 23)**, and **4NF & MVDs (Lecture 24)** to the actual five-table schema in `Table.sql`.

## Assumptions from the project requirements

- `user_id` uniquely identifies a user; usernames are also unique.
- `movie_id` identifies a movie. **Titles are not unique**: two different movies may have the same title.
- `genre_id` identifies a genre; genre names are unique.
- One user can have at most one *active* rating for one movie.
- A movie can have several genres, and a genre can describe several movies.
- A movie can receive ratings from several users.
- A user's rating for a movie does not depend on the movie's genre.
- There are no additional functional or multivalued dependencies beyond those implied by these requirements. If requirements change, redo the check.

## 1. FDs, closures, and minimal basis (Lecture 12)

To examine why the schema separates movie information from genre membership, consider a hypothetical unnormalized relation (this is **not** a table in the implementation):

`MovieInfo(movie_id, title, release_year, genre_id)`

A movie with two genres would appear twice, repeating its title and release year. The business rules give these non-trivial FDs:

- `movie_id -> title`
- `movie_id -> release_year`

These two FDs are a **minimal basis** for the stated dependencies: both right-hand sides have one attribute, neither FD is redundant, and neither left-hand side has an unnecessary attribute.

Compute a few attribute closures under this basis:

- `{movie_id}+ = {movie_id, title, release_year}`
- `{genre_id}+ = {genre_id}`
- `{movie_id, genre_id}+ = {movie_id, genre_id, title, release_year}`

Thus `{movie_id, genre_id}` is a candidate key for this hypothetical association relation; `movie_id` alone is **not** a superkey.

**FD projection example:** project `MovieInfo` onto `S(movie_id, title, genre_id)`. Following Lecture 12, compute closures of every nonempty subset of the projected attributes using the original FDs, then retain only attributes in `S`.

| Subset X | X+ restricted to S |
| --- | --- |
| {movie_id} | {movie_id, title} |
| {title} | {title} |
| {genre_id} | {genre_id} |
| {movie_id, title} | {movie_id, title} |
| {movie_id, genre_id} | {movie_id, title, genre_id} |
| {title, genre_id} | {title, genre_id} |
| {movie_id, title, genre_id} | {movie_id, title, genre_id} |

After removing trivial and redundant dependencies, the projected **minimal basis** is:

`movie_id -> title`

This is a theoretical projection to demonstrate the method; it is not an extra application table.

## 2. 3NF and BCNF (Lecture 23 and earlier BCNF material)

In the hypothetical `MovieInfo` relation, `{movie_id, genre_id}` is the candidate key. For `movie_id -> title`:

1. `movie_id` is **not** a superkey.
2. `title` is **not** prime (it is not part of a candidate key).
3. Therefore the dependency violates **3NF** and **BCNF**.

The same applies to `movie_id -> release_year`. Keeping those attributes in an association table would repeat movie details for each genre, creating update anomalies.

The implemented design instead stores:

- `movie(movie_id, title, release_year)`
- `genre(genre_id, genre_name)`
- `movie_genre(movie_id, genre_id)`

This lets each movie's details be stored once, while the `movie_genre` relation records only memberships. The separation avoids the above FD-based redundancy.

### Current implementation: table-by-table FD and BCNF check

| Relation | Candidate key(s) under the documented rules | Non-trivial FD basis | BCNF justification |
| --- | --- | --- | --- |
| `app_user` | `user_id`; `username` | `user_id -> username`; `username -> user_id` | Every FD determinant is a candidate key. |
| `movie` | `movie_id` | `movie_id -> title`; `movie_id -> release_year` | `movie_id` is a candidate key; titles may repeat. |
| `genre` | `genre_id`; `genre_name` | `genre_id -> genre_name`; `genre_name -> genre_id` | Both determinants are candidate keys. |
| `rating` | `(user_id, movie_id)` | `(user_id, movie_id) -> score`; `(user_id, movie_id) -> review_text`; `(user_id, movie_id) -> rated_at` | The determinant is the composite candidate key. |
| `movie_genre` | `(movie_id, genre_id)` | No non-trivial FDs under these requirements | Neither single attribute determines the other; BCNF holds. |

A candidate key determines every attribute of its own relation. **BCNF requires the determinant of every non-trivial FD to be a superkey.** As shown, none of the listed FDs violates BCNF; therefore the five tables also satisfy 3NF for the documented rules. This is a design proof under the assumptions above, not a claim that MySQL itself checks normal forms.

## 3. MVD and 4NF check (Lecture 24)

To see why ratings and genres must not be stored together, consider another **hypothetical** combined relation:

`CombinedRatingGenre(movie_id, genre_id, user_id, score)`

Suppose movie 1 has genres 10 and 20, while users 101 and 102 give it scores 5 and 4. If genre membership and user ratings are independent given the movie, the relation requires the combinations:

| movie_id | genre_id | user_id | score |
| --- | --- | --- | --- |
| 1 | 10 | 101 | 5 |
| 1 | 20 | 101 | 5 |
| 1 | 10 | 102 | 4 |
| 1 | 20 | 102 | 4 |

This captures the non-trivial multivalued dependency:

`movie_id ->> genre_id` (a **multivalued** arrow, not an ordinary FD)

Here `movie_id` is not a superkey: there are multiple genres and multiple users per movie. Therefore this hypothetical combined relation violates **4NF**. It duplicates each rating across all genres and would be awkward to update.

The actual schema separates the independent information:

- `movie_genre(movie_id, genre_id)`
- `rating(user_id, movie_id, score, review_text, rated_at)`

This removes that cross-product redundancy. Under the stated business rules, there are no additional non-trivial MVDs with non-superkey determinants in these current tables. In particular, the two-attribute `movie_genre` relation has no non-trivial MVD. The current design therefore satisfies **4NF under the stated assumptions**.

## 4. Design decision and verification evidence

**Decision:** Keep the five-table structure and its existing primary/foreign keys. Remove `UNIQUE(title)` from `movie`: unique IDs are sufficient to identify films, and different films may have identical titles. Preserve the unique constraints on username and genre name because the requirements explicitly need those identities to be unique.

**DDL evidence:** The previous missing commas before `UNIQUE` were already fixed after the Kick-Off submission. `Table.sql` now contains correctly separated constraints. To verify execution rather than only visually inspect syntax, run the script against MySQL 8.0 on a fresh schema. The `tests/sample_data.sql` script inserts reproducible sample records; the `.github/workflows/mysql-validation.yml` workflow attempts to create the tables and checks constraints automatically.

**Honesty about testing:** A schema review and a committed test workflow are not the same thing as a successful MySQL execution. Record a successful run (local output or CI logs) as the evidence in the sprint video. If a run fails, report the failure and repair it before claiming completion.

**Relevant lessons:** Lecture 12, Projecting FD's (attribute closure, minimal basis, FD projection); Lecture 23, Third Normal Form (prime attributes, 3NF and dependency preservation); Lecture 24, 4NF & Multivalued Dependencies (independent multivalued facts and 4NF decomposition).
