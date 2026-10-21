# CSC 370 — Sprint 1 Normalization Review

## 1. Functional Dependencies (FDs)

I checked the five tables using functional dependencies:

| Table | Functional Dependencies |
|---|---|
| app_user | user_id → username; username → user_id |
| movie | movie_id → title, release_year |
| genre | genre_id → genre_name; genre_name → genre_id |
| rating | (user_id, movie_id) → score, review_text, rated_at |
| movie_genre | No non-trivial FDs |

For the `rating` table, `(user_id, movie_id)+` includes all attributes. Neither attribute alone can determine the score, so the pair is a candidate key.

## 2. Minimal Basis and FD Projection

The FDs for `rating` can be split into three separate dependencies, each with one attribute on the right. None can be removed or simplified, so they form a minimal basis.

Projecting `rating` onto `(user_id, movie_id, score)` gives:

`(user_id, movie_id) → score`

However, projecting onto `(user_id, score)` produces no non-trivial FDs, since one user can give different scores.

## 3. 3NF and BCNF

In all five tables, every non-trivial FD has a candidate key on the left. Therefore, all five tables satisfy BCNF and 3NF under the project requirements.

Separating `movie` and `movie_genre` also prevents movie information from being repeated for every genre.

## 4. 4NF

A movie can have multiple genres and ratings independently. Combining these into one table would repeat ratings for each genre, causing a 4NF violation.

The current design stores genres in `movie_genre` and ratings in `rating`. This avoids that problem.

## Conclusion

The five-table design satisfies 3NF, BCNF, and 4NF under the stated business rules. No further table decomposition is needed.
