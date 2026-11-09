-- Database Validation
-- Run only after 01_data.sql

USE csc370_movie_ratings;

-- Test 1: Verify record counts
-- Expected: all results are 1 (TRUE)

SELECT
    (SELECT COUNT(*) FROM app_user) = 10 AS users_pass,
    (SELECT COUNT(*) FROM movie) = 20 AS movies_pass,
    (SELECT COUNT(*) FROM genre) = 2 AS genres_pass,
    (SELECT COUNT(*) FROM movie_genre) = 22 AS relationships_pass,
    (SELECT COUNT(*) FROM rating) = 50 AS ratings_pass;


-- Test 2: Verify multiple genres
-- Expected: both movies (103 and 110) have 2 genres

SELECT movie_id, COUNT(*) AS genre_count
FROM movie_genre
WHERE movie_id IN (103, 110)
GROUP BY movie_id
ORDER BY movie_id;


-- Test 3: Verify rating statistics and NULL
-- Expected:
-- Movie 101: 4 ratings, average 3.5000
-- Movie 117: 0 ratings, average NULL
-- Movie 118: 0 ratings, average NULL

SELECT m.movie_id,
       m.title,
       COUNT(r.score) AS rating_count,
       AVG(r.score) AS average_score
FROM movie AS m
LEFT JOIN rating AS r
    ON m.movie_id = r.movie_id
WHERE m.movie_id IN (101, 117, 118)
GROUP BY m.movie_id, m.title
ORDER BY m.movie_id;


-- Test 4: Verify score range
-- Expected: 0 invalid scores

SELECT COUNT(*) AS invalid_scores
FROM rating
WHERE score NOT BETWEEN 1 AND 5;
