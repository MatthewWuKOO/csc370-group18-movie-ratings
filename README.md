# CSC370 group18: movie ratings
This project builds a MySQL-backed movie rating system. Users can browse movies, search by title or genre, and rate each movie from 1 to 5 with an optional short review. They can edit or remove their own rating and review. The system will display other users’ reviews, each movie’s average score, and its number of ratings.


## Requirements
1. Each user has a unique account and username.
2. Each movie has a title and release year and can belong to multiple genres.
3. A user can rate many movies, but can have only one active rating for each movie.
4. A user can give a movie rating as an integer from 1 (lowest) to 5(highest), with no half scores such as 3.5.
5. A rating can include an optional written review and records when it was made.
6. Users can change or delete their own ratings and reviews.
7. Users can search movies by title or genre and read other users’ reviews.
8. The system calculates each movie’s rating count and average from its ratings.


## Goals for sprint 1
1. I have requirements, an ERD, and five SQL tables for my movie-rating system. I still need to check the design using the Advanced Relational Design lessons.
2. As we learn FDs in ERDs, minimal bases and projecting FDs, 3NF, and 4NF, I will use an example from my tables for each lesson. I will check whether the lesson shows a problem in my design.
3. By the end of the sprint, I will update my ERD or SQL if needed.
4. Course-level goal: I will check that my ERD and SQL tables match my movie-rating requirements, and fix any mistakes I find.
5. Optional: Start learning about the Medallion data model and sketch how I could keep the original data, clean it, and use it for movie-rating summaries
