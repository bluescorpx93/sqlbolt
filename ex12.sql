FROM JOIN > WHERE > GROUP BY > HAVING > SELECT> DISTINCT> ORDER BY > LIMIT OFFSET 

-- Find the number of movies each director has directed
SELECT director,COUNT(title) FROM movies GROUP BY director;;

-- Find the total domestic and international sales that can be attributed to each director
SELECT SUM(domestic_sales + international_sales) AS total_sales, director FROM movies INNER JOIN boxoffice ON movies.id = boxoffice.movie_id GROUP BY director;