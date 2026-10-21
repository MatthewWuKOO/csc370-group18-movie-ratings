USE csc370_movie_ratings;

-- Users
INSERT INTO app_user VALUES
(101, 'Alice'),
(102, 'Bob');

-- Movies
INSERT INTO movie VALUES
(1, 'Titanic', 1997),
(2, 'Avatar', 2009);

-- Genres
INSERT INTO genre VALUES
(10, 'Drama'),
(20, 'Sci-Fi');

-- Movie genres
INSERT INTO movie_genre VALUES
(1, 10),
(2, 20);

-- Ratings
INSERT INTO rating VALUES
(101, 1, 5, 'Great movie', NOW()),
(102, 1, 4, 'Good movie', NOW()),
(101, 2, 3, NULL, NOW());
