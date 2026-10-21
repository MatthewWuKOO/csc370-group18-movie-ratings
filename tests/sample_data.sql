-- Demo data for a newly created csc370_movie_ratings database.
-- Run Table.sql first. This file is meant for an empty schema.
USE csc370_movie_ratings;

INSERT INTO app_user (user_id, username) VALUES
    (101, 'alice_demo'),
    (102, 'bob_demo');

-- Two distinct movies deliberately share a title.
-- This tests the decision to identify movies by movie_id, not title.
INSERT INTO movie (movie_id, title, release_year) VALUES
    (1, 'Shared Title', 2001),
    (2, 'Shared Title', 2024),
    (3, 'Another Film', 2010);

INSERT INTO genre (genre_id, genre_name) VALUES
    (10, 'Drama'),
    (20, 'Comedy');

INSERT INTO movie_genre (movie_id, genre_id) VALUES
    (1, 10),
    (1, 20),
    (2, 10),
    (3, 20);

INSERT INTO rating (user_id, movie_id, score, review_text, rated_at) VALUES
    (101, 1, 5, 'Great film', '2026-10-20 12:00:00'),
    (102, 1, 4, NULL, '2026-10-20 13:00:00'),
    (101, 2, 3, 'Good', '2026-10-20 14:00:00');

-- Inspection queries for the TA demo:
SHOW TABLES;
SELECT * FROM movie ORDER BY movie_id;
SELECT * FROM movie_genre ORDER BY movie_id, genre_id;
SELECT * FROM rating ORDER BY movie_id, user_id;
