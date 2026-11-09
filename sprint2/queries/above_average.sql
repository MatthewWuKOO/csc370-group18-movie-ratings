-- CSC 370 - Sprint 2
-- Feature 3: Above-Average Movies

-- Find the overall average rating

SELECT AVG(score) AS overall_average
FROM rating;

-- Find movies with an average rating
-- higher than the overall average

SELECT m.movie_id,
       m.title,
       AVG(r.score) AS average_score
FROM movie AS m
JOIN rating AS r
    ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.title
HAVING AVG(r.score) > (
    SELECT AVG(score)
    FROM rating
)
ORDER BY average_score DESC;