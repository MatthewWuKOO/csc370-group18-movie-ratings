# CSC370 group18: movie ratings
This is a solo project to build a MySQL-backed movie rating system. Users will be able to browse movies, search by title or genre, and give each movie a score from 1 to 5 with an optional short review. They can edit or remove their own rating and review. The system will display other users’ reviews, each movie’s average score, and its number of ratings.

The database will store users, movies, genres, ratings, reviews, and the time each rating was made. Each user can have one current rating and review per movie.

## Requirements
1. Each user has a unique account and username.
2. Each movie has a title and release year and can belong to multiple genres.
3. A user can rate many movies, but can have only one active rating for each movie.
4. A user can give a movie rating as an integer from 1 (lowest) to 5(highest), with no half scores such as 3.5.
5. A rating can include an optional written review and records when it was made.
6. Users can change or delete their own ratings and reviews.
7. Users can search movies by title or genre and read other users’ reviews.
8. The system calculates each movie’s rating count and average from its ratings.
