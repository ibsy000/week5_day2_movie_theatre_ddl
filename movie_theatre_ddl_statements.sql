-- Create first table MOVIE in database
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


-- Create second table TICKET WITHOUT FK
CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	movie_name VARCHAR(50),
	availability BOOLEAN, -- I this COLUMN would help make sure a ticket IS available BEFORE selling
	price NUMERIC(5,2),
	seat VARCHAR(5),
	employee INTEGER
);


-- Change the table name
ALTER TABLE ticket 
RENAME TO movie_ticket;


-- Add column to table
ALTER TABLE movie_ticket 
ADD COLUMN movie_id INTEGER NOT NULL;


-- Add FK to newly named movie_ticket table
ALTER TABLE movie_ticket
ADD FOREIGN KEY(movie_id) REFERENCES movie(movie_id);


-- Create third table CUSTOMER
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	customer_name VARCHAR(50),
	adult BOOLEAN, -- FOR rated R movies, OLD enough OR NOT 
	discount VARCHAR(10), -- Discounts LIKE (veteran, student, senior, matinee)
	payment VARCHAR(10), -- Cash, card, apple pay, zelle, etc.
	ticket_id INTEGER NOT NULL, 
	FOREIGN KEY(ticket_id) REFERENCES movie_ticket(ticket_id)
);


-- Create fourth table CONCESSION
CREATE TABLE concession(
	concession_id SERIAL PRIMARY KEY,
	snack VARCHAR(30),
	beverage VARCHAR(30),
	price NUMERIC(5,2),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);


-- Create fifth table SHOWTIME
CREATE TABLE showtime(
	showtime_id SERIAL PRIMARY KEY,
	showtime_month VARCHAR(10),
	showtime_day NUMERIC(2),
	showtime_time NUMERIC(4),
	am_pm VARCHAR(2)
);


-- Create Join Table MOVIE-SHOWTIME between MOVIE and SHOWTIME TABLES 
CREATE TABLE movie_showtime(
	movie_id INTEGER NOT NULL,
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id),
	showtime_id INTEGER NOT NULL,
	FOREIGN key(showtime_id) REFERENCES showtime(showtime_id)
);

-- And I think I'm done! 

SELECT *
FROM concession;

SELECT *
FROM customer;

SELECT *
FROM movie;

SELECT *
FROM movie_showtime;

SELECT *
FROM movie_ticket;

SELECT *
FROM showtime;






