CREATE DATABASE csc370_movie_ratings;
USE csc370_movie_ratings;

-- user
CREATE TABLE app_user (
    user_id INT NOT NULL,
    username VARCHAR(50) NOT NULL,
    PRIMARY KEY (user_id),
    UNIQUE (username)
);
-- movie
CREATE TABLE movie (
    movie_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    release_year SMALLINT NOT NULL,
    PRIMARY KEY (movie_id)
);
-- genre
CREATE TABLE genre (
    genre_id INT NOT NULL,
    genre_name VARCHAR(60) NOT NULL,
    PRIMARY KEY (genre_id)
);
-- rating, connect user_id with movie_id
CREATE TABLE rating (
    user_id INT NOT NULL,
    movie_id INT NOT NULL,
    score INT NOT NULL,
    review_text VARCHAR(1000) NULL,
    rated_at DATETIME NOT NULL,
    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES app_user (user_id),
    FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
    CONSTRAINT rating_score_range CHECK (score BETWEEN 1 AND 5)
);

-- hasgenre, connect movie_id with genre_id
CREATE TABLE movie_genre (
    movie_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
    FOREIGN KEY (genre_id) REFERENCES genre (genre_id)
);
