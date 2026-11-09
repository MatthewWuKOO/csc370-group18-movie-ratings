-- Sprint 2: Search movies by genre

SELECT m.movie_id, m.title, g.genre_name
FROM movie AS m
JOIN movie_genre AS mg
    ON m.movie_id = mg.movie_id
JOIN genre AS g
    ON mg.genre_id = g.genre_id
WHERE g.genre_name = 'Drama';