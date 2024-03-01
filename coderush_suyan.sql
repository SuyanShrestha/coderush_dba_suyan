-- Active: 1707998683902@@127.0.0.1@5432@coderush_suyan_db

-- to list the existing databases
\l 

-- to create DATABASE
CREATE DATABASE coderush_suyan_db;

-- to connect to my DATABASE
\c coderush_suyan_db;

-- now here i will create some tables like these 4
CREATE TABLE product (
    id SERIAL PRIMARY KEY, name VARCHAR(50) NOT NULL, description VARCHAR(150), price FLOAT NOT NULL, category VARCHAR(20)
);

CREATE TABLE store (
    id SERIAL PRIMARY KEY, name VARCHAR(50) NOT NULL, city VARCHAR(50), state VARCHAR(20)
);

CREATE TABLE sales (
    id SERIAL PRIMARY KEY, product_id INTEGER REFERENCES Product (id) ON DELETE CASCADE, store_id INTEGER REFERENCES Store (id) ON DELETE CASCADE, quantity INTEGER NOT NULL, sale_price FLOAT NOT NULL, sales_time TIMESTAMP NOT NULL
);

CREATE TABLE Users (
    id INTEGER NOT NULL, name VARCHAR(100) NOT NULL, product_id INTEGER NOT NULL
);

-- to display all tables
\dt 
-- lets insert some demo data into those tables before users
INSERT INTO
    Users (id, name, product_id)
VALUES (1, 'Suyan', 1),
    (2, 'Abhisekh', 5),
    (3, 'Kriti', 20),
    (4, 'Alex', 11),
    (5, 'Joey', 100);

-- now i will display schema and data from a table Users
SELECT * FROM Users;

-- now moving to the roles

--  lets first create a USER
CREATE USER suyan WITH ENCRYPTED PASSWORD 'admin';

-- to view the roles available
\du 

-- i will grant all privileges to USER
GRANT ALL PRIVILEGES ON DATABASE coderush_suyan_db TO suyan;

-- finally to showcase building of relationships, i created a table called orders and got it related to product table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY, user_id INTEGER NOT NULL, product_id INTEGER NOT NULL, order_date TIMESTAMP NOT NULL, quantity INTEGER NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product (id)
);