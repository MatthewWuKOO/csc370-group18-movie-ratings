
USE csc370_movie_ratings;

-- 1. Insert Sample Data

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

-- 2. Verify Inserted Data
SELECT * FROM rating;

-- 3. Primary Key Test
-- Expected: ERROR 1062 (Duplicate entry)
INSERT INTO rating VALUES
(101, 1, 4, 'Duplicate rating', NOW());

-- 4. Foreign Key Test
-- Expected: ERROR 1452 (Foreign key violation)
INSERT INTO rating VALUES
(999, 1, 4, 'Test foreign key', NOW());

-- 5. CHECK Constraint Test
-- Expected: ERROR 3819 (Score must be 1-5)
INSERT INTO rating VALUES
(102, 2, 6, 'Invalid score', NOW());

-- 6. Verify Invalid Data Was Rejected
SELECT * FROM rating;
