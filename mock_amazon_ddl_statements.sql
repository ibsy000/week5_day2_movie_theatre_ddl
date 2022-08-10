-- Create table syntax
- CREATE TABLE table_name(col_name DATA_TYPE, ...)

-- Create customer table
-- ALL lowercase AND singular
CREATE TABLE customer(
 -- column_name DATATYPE <CONSTRAINTS>,
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	address VARCHAR(100),
	email VARCHAR(50),
	loyalty_member BOOLEAN
);


-- Add column to a table
-- ALTER TABLE table_name ADD COLUMN column_name DATATYPE
ALTER TABLE customer 
ADD COLUMN username VARCHAR(20);


-- Change email to VARCHAR(30)
ALTER TABLE customer 
ALTER COLUMN email VARCHAR(30);

-- Change name of column
ALTER TABLE customer 
RENAME COLUMN email TO email_address;

SELECT *
FROM customer;

-- Create Order Table ith Foreign key to Customer
-- Brian uses order_ because order turns red and thinks of it as order by and gets confusing
CREATE TABLE order_(
	order_id SERIAL PRIMARY KEY,
	order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- current_timestamp grabs CURRENT time
	customer_id INTEGER NOT NULL, -- NOT NULL means that this COLUMN cannot be EMPTY
	-- Syntax: FOREIGN KEY(column_in_domestic_table) REFERENCES foreign_table_name(column_in_foreign_table)
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

-- Create Order-Product Table (Join Table between order and product table)
CREATE TABLE order_product(
	order_id INTEGER NOT NULL,
	FOREIGN KEY(order_id) REFERENCES order_(order_id),
	product_id INTEGER NOT NULL,
--	FOREIGN KEY(product_id) REFERENCES product(product_id) -- CANNOT REFERENCE TABLE THAT DOES NOT EXIST
	quantity INTEGER
);


-- Create the Product Table (without FK right now)
CREATE TABLE product(
	product_id SERIAL PRIMARY KEY,
	prod_name VARCHAR(25),
	description VARCHAR(200),
	price NUMERIC(5,2)
);

-- Alter the order_product table to add foreign key column
ALTER TABLE order_product 
ADD FOREIGN KEY(product_id) REFERENCES product(product_id);


-- RENAME product to be item
ALTER TABLE product 
RENAME TO item;

-- Create a test table
CREATE TABLE test(
	test_id SERIAL PRIMARY KEY,
	column_1 INTEGER,
	column_2 BOOLEAN
);

SELECT *
FROM test;

-- DROP A COLUMN -- Be careful with DROP, no undoing it
ALTER TABLE test 
DROP COLUMN column_1;

-- Remove a table completely
DROP TABLE IF EXISTS test;



