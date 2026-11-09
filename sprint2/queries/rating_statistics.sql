-- CSC 370 - Sprint 2
-- Feature 2: Movie Rating Statistics

-- Query 1: Show rating statistics for all movies

SELECT m.movie_id,
       m.title,
       COUNT(r.score) AS rating_count,
       AVG(r.score) AS average_score
FROM movie AS m
LEFT JOIN rating AS r
    ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.title
ORDER BY m.movie_id;


-- Query 2: Find movies with at least 2 ratings

SELECT m.movie_id,
       m.title,
       COUNT(r.score) AS rating_count,
       AVG(r.score) AS average_score
FROM movie AS m
LEFT JOIN rating AS r
    ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.title
HAVING COUNT(r.score) >= 2
ORDER BY m.movie_id;