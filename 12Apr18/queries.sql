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

Ex5

List all the Canadian cities and their populations
SELECT city, population FROM north_american_cities WHERE country="Canada";

Order all the cities in the United States by their latitude from north to south
SELECT city FROM north_american_cities WHERE country = "United States" ORDER BY latitude desc;

List all the cities west of Chicago, ordered from west to east
SELECT city FROM north_american_cities WHERE longitude < -87.629798 ORDER BY longitude asc;

List the two largest cities in Mexico (by population)
SELECT * FROM north_american_cities WHERE country="Mexico" ORDER BY population DESC LIMIT 2;

List the third and fourth largest cities (by population) in the United States and their population
SELECT * FROM north_american_cities WHERE country="United States" ORDER BY population DESC LIMIT 2 OFFSET 2;

Ex6

Find the domestic and international sales for each movie
SELECT title, domestic_sales, international_sales FROM movies INNER JOIN boxoffice ON movies.id=boxoffice.movie_id;

Show the sales numbers for each movie that did better internationally rather than domestically
SELECT title, domestic_sales, international_sales FROM movies INNER JOIN boxoffice ON movies.id=boxoffice.movie_id WHERE international_sales > domestic_sales;

List all the movies by their ratings in descending order
SELECT title FROM movies INNER JOIN boxoffice ON movies.id=boxoffice.movie_id ORDER BY rating DESC;

Ex7

Find the list of all buildings that have employees
SELECT building_name FROM employees LEFT OUTER JOIN buildings ON employees.building = buildings.building_name WHERE employees.building IS NOT NULL GROUP BY buildings.building_name;

Find the list of all buildings and their capacity
SELECT * FROM buildings;

List all buildings and the distinct employee roles in each building (including empty buildings)
SELECT DISTINCT role, building_name FROM buildings LEFT OUTER JOIN employees ON buildings.building_name = employees.building;

Ex8

Find the name and role of all employees who have not been assigned to a building

SELECT name, role FROM employees OUTER LEFT JOIN buildings ON employees.building = buildings.building_name WHERE building IS null

Find the names of the buildings that hold no employees
SELECT building_name FROM buildings OUTER LEFT JOIN employees ON buildings.building_name = employees.building WHERE employees.building IS null

Ex 9

List all movies and their combined sales in millions of dollars
SELECT title, (domestic_sales + international_sales)/1000000 AS combined_sales FROM movies LEFT JOIN boxoffice ON movies.id = boxoffice.movie_id;

List all movies and their ratings in percent
SELECT title, rating*10 FROM movies LEFT JOIN boxoffice on movies.id=boxoffice.movie_id;

List all movies that were released on even number years
SELECT title, year FROM movies LEFT JOIN boxoffice ON movies.id=boxoffice.movie_id where year%2==0;

Ex10

Find the longest time that an employee has been at the studio
SELECT name, MAX(years_employed) FROM employees;

For each role, find the average number of years employed by employees in that role
SELECT role, AVG(years_employed) FROM employees GROUP BY role;

Find the total number of employee years worked in each building
SELECT building, SUM(years_employed) FROM employees GROUP BY building;

Ex11

Find the number of Artists in the studio (without a HAVING clause)
SELECT COUNT(role) FROM employees WHERE role='Artist';

Find the number of Employees of each role in the studio
SELECT role, COUNT(role) FROM employees GROUP BY role;

Find the total number of years employed by all Engineers
SELECT SUM(years_employed) FROM employees WHERE role="Engineer";

Ex12

FROM JOIN > WHERE > GROUP BY > HAVING > SELECT> DISTINCT> ORDER BY > LIMIT OFFSET 

Find the number of movies each director has directed
SELECT director,COUNT(title) FROM movies GROUP BY director;;

Find the total domestic and international sales that can be attributed to each director
SELECT SUM(domestic_sales + international_sales) AS total_sales, director FROM movies INNER JOIN boxoffice ON movies.id = boxoffice.movie_id GROUP BY director;

Ex13

Add the studio"s new production, Toy Story 4 to the list of movies (you can use any director)
INSERT INTO movies (title, director, year, length_minutes) VALUES ("Toy Story 4", "Mike Bloom", 2010, 125);

Toy Story 4 has been released to critical acclaim! It had a rating of 8.7, and made 340 million domestically and 270 million internationally. Add the record to the BoxOffice table. 
INSERT INTO boxoffice (movie_id, rating, domestic_sales, international_sales) VALUES (15, 8.7, 340000000, 270000000);

Ex14

The director for A Bug"s Life is incorrect, it was actually directed by John Lasseter
UPDATE movies SET director="John Lasseter" WHERE title="A Bug"s Life"

The year that Toy Story 2 was released is incorrect, it was actually released in 1999
UPDATE movies SET year = 1999 WHERE title="Toy Story 2"

Both the title and directory for Toy Story 8 is incorrect! The title should be "Toy Story 3" and it was directed by Lee Unkrich
UPDATE movies SET title="Toy Story 3", director="Lee Unkrich" WHERE title="Toy Story 8";

Ex15

This database is getting too big, lets remove all movies that were released before 2005.
DELETE FROM movies WHERE YEAR < 2005;

Andrew Stanton has also left the studio, so please remove all movies directed by him
DELETE FROM movies WHERE director="Andrew Stanton";

Ex16
Create a new table named Database with the following columns:
– Name A string (text) describing the name of the database
– Version A number (floating point) of the latest version of this database
– Download_count An integer count of the number of times this database was downloaded
CREATE TABLE IF NOT EXISTS database (
		id INTEGER PRIMARY KEY, name TEXT, version NUMBER, download_count INTEGER
)

Ex17
Add a column named Aspect_ratio with a FLOAT data type to store the aspect-ratio each movie was released in.
ALTER TABLE movies ADD aspect_ratio FLOAT;

Add another column named Language with a TEXT data type to store the language that the movie was released in. Ensure that the default for this language is English
ALTER TABLE movies ADD language TEXT DEFAULT "English";

Ex18
Lets clean up by removing the Movies table
DROP TABLE IF EXISTS movies

And drop the BoxOffice table as well
DROP TABLE IF EXISTS boxoffice

