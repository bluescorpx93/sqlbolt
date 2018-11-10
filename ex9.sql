-- List all movies and their combined sales in millions of dollars
SELECT title, (domestic_sales + international_sales)/1000000 AS combined_sales FROM movies LEFT JOIN boxoffice ON movies.id = boxoffice.movie_id;

-- List all movies and their ratings in percent
SELECT title, rating*10 FROM movies LEFT JOIN boxoffice on movies.id=boxoffice.movie_id;

-- List all movies that were released on even number years
SELECT title, year FROM movies LEFT JOIN boxoffice ON movies.id=boxoffice.movie_id where year%2==0;