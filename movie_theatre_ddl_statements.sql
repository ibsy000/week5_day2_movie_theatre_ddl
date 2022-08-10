-- Create first table in database
CREATE TABLE movie(
movie_id SERIAL PRIMARY KEY,
name VARCHAR(50),
genre VARCHAR(25),
rating VARCHAR(10),
length NUMERIC(3)
);

-- Change the name of a column
ALTER TABLE movie
RENAME COLUMN name TO movie_name;

-- Change another name of a column
ALTER TABLE movie 
RENAME COLUMN length TO movie_length;

-- View newly created table and columns
SELECT *
FROM movie;

