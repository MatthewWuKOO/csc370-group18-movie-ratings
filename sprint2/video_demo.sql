-- Complete Video Demonstration

SELECT 'STEP 1: Reset and Create Tables' AS section;
SOURCE sprint2/00_reset.sql

SELECT 'STEP 2: Insert Sprint 2 Data' AS section;
SOURCE sprint2/01_data.sql

SELECT 'STEP 3: Validate Database' AS section;
SOURCE sprint2/02_validate.sql

SELECT 'STEP 4: Search Movies by Genre' AS section;
SOURCE sprint2/queries/genre_search.sql

SELECT 'STEP 5: Movie Rating Statistics' AS section;
SOURCE sprint2/queries/rating_statistics.sql

SELECT 'STEP 6: Above-Average Movies' AS section;
SOURCE sprint2/queries/above_average.sql

SELECT 'STEP 7: NULL and COALESCE' AS section;
SELECT user_id, movie_id,
       COALESCE(review_text, 'No review') AS review
FROM rating
WHERE review_text IS NULL
LIMIT 5;

SELECT 'STEP 8: DML Demonstration' AS section;

INSERT INTO rating
    (user_id, movie_id, score, review_text, rated_at)
VALUES (101, 118, 4, 'Demo rating', NOW());

UPDATE rating
SET score = 5
WHERE user_id = 101 AND movie_id = 118;

SELECT user_id, movie_id, score
FROM rating
WHERE user_id = 101 AND movie_id = 118;

DELETE FROM rating
WHERE user_id = 101 AND movie_id = 118;

SELECT COUNT(*) AS final_rating_count
FROM rating;

SELECT 'DEMONSTRATION COMPLETE' AS section;