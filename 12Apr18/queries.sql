Ex1

Find the title of each film
SELECY title FROM movies;

Find the director of each film 
SELECT director FROM movies;

Find the title and director of each film 
SELECT title, director FROM movies;

Find the title and year of each film 
SELECT title, year FROM movies;

Find all the information about each film
SELECT * FROM movies;

Ex2

Find the movie with a row id of 6
SELECT * FROM movies WHERE id=6;

Find the movies released in the years between 2000 and 2010 
SELECT * FROM movies WHERE year BETWEEN 2000 AND 2010;
SELECT * FROM movies WHERE year >=2000 AND year<=2010;

Find the movies not released in the years between 2000 and 2010 
SELECT * FROM movies WHERE year <2000 OR year>2010;
SELECT * FROM movies WHERE year NOT BETWEEN 2000 AND 2010;

Find the first 5 Pixar movies and their release year
SELECT title, year FROM movies limit 5;

Ex3

Find all the Toy Story movies 
SELECT * FROM movies WHERE title LIKE "%toy story%";

Find all the movies directed by John Lasseter
SELECT * FROM movies WHERE director ="John Lasseter";

Find all the movies (and director) not directed by John Lasseter 
SELECT * FROM movies WHERE director NOT LIKE "John Lasseter";

Find all the WALL-* movies
SELECT * FROM movies WHERE title like "WALL-%";

Ex4

List all directors of Pixar movies (alphabetically), without duplicates
SELECT DISTINCT director FROM movies ORDER BY director ASC;

List the last four Pixar movies released (ordered from most recent to least)
SELECT title FROM movies ORDER BY YEAR DESC LIMIT 4;

List the first five Pixar movies sorted alphabetically
SELECT title FROM movies ORDER BY title ASC LIMIT 5;

List the next five Pixar movies sorted alphabetically
SELECT title FROM movies ORDER BY title ASC LIMIT 5 OFFSET 5;









 

