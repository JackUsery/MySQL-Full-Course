
-- CREARTE TABES
-- CREATE TABLE [TABLE NAME]();
CREATE TABLE employees (
    employee_id INT,
    firt_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5,2),
    hire_date DATE
);

-- SELECT TABLES
SELECT * FROM employees; -- VIEW ALL THE CONTENT OF THE TABLE
SELECT * FROM workers;

-- RENAME TABLE
-- REANAME TABLE [TABLE NAME] TO [NEW TABLE NAME];
RENAME TABLE employees TO workers; -- CHANFE employees TO workers
RENAME TABLE workers TO employees; -- CHANFE workers TO employees

-- DROP TABLE
DROP TABLE employees; -- DROP employees TABLE

-- Alter database
ALTER DATABASE [DBName] READ ONLY = 1;  -- Set database to read only
ALTER DATABASE [DBName] READ ONLY = 0;  -- Set database to read write

-- ADD COLUMN
ALTER TABLE employees
ADD phone_number VARCHAR(15); -- ADD COLUMN phone_number

-- RENAME COLUMN
ALTER TABLE employees
RENAME COLUMN phone_number TO email; -- RENAME COLUMN phone_number TO email

ALTER TABLE employees
RENAME COLUMN firt_name TO first_name; -- RENAME COLUMN firt_name TO first_name

-- MODIFY COLUMN
ALTER TABLE employees
MODIFY COLUMN email VARCHAR(100); -- MODIFY COLUMN variable

-- CHANGE COLUME POSITION
ALTER TABLE employees
MODIFY COLUMN email VARCHAR(100)
AFTER last_name; -- CHANGE COLUME POSITION AFTER last_name

ALTER TABLE employees
MODIFY COLUMN email VARCHAR(100)
FIRST; -- CHANGE COLUME POSITION FIRST

-- DROP COLUMN
ALTER TABLE employees
DROP COLUMN email; -- DROP COLUMN email

-- INSERT ROWS INTO TABLE
INSERT INTO employees
VALUES (1, "Eugene", "Krabs", 25.50, "2023-01-02"); -- INSERT ROWS INTO TABLE

-- INSERT MULTIPLE ROWS INTO TABLE
INSERT INTO employees
VALUES (2, "Squidward", "Tentacles", 15.00, "2023-01-03"),
       (3, "Spongebob", "Squarepants", 12.50, "2023-01-04"),
       (4, "Patrick", "Star", 12.50, "2023-01-05"),
       (5, "Sandy", "Cheeks", 17.25, "2023-01-06"); -- INSERT MULTIPLE ROWS INTO TABLE

-- WILL ERROR DOESNT HAVE ALL COLUMN VALUES
INSERT INTO employees
VALUES (6, "Sheldon", "Plankton");

-- TO FIX ^
INSERT INTO employees (employee_id, first_name, last_name)
VALUES (6, "Sheldon", "Plankton"); 

-- QUERY DATA
SELECT * FROM employees; -- VIEW ALL THE CONTENT OF THE TABLE

-- QUERY DATA for specific columns
SELECT first_name, last_name
FROM employees; -- VIEW first_name, last_name OF THE TABLE

-- QUERY DATA with WHERE
SELECT *
FROM employees
WHERE employee_id = 1; -- VIEW employee_id = 1 OF THE TABLE

SELECT *
FROM employees
WHERE first_name = "Spongebob"; -- VIEW first_name = "Spongebob" OF THE TABLE

SELECT *
FROM employees
WHERE hourly_pay >= 15; -- VIEW hourly_pay >= 15 OF THE TABLE

SELECT *
FROM employees
WHERE hire_date <= "2023-01-03"; -- VIEW hire_date <= "2023-01-03" OF THE TABLE

-- QUERY DATA with WHERE AND != NOT EQUAL
SELECT *
FROM employees
WHERE hourly_pay != 12.50; -- VIEW hourly_pay != 12.50 OF THE TABLE

SELECT *
FROM employees
WHERE employee_id != 1; -- VIEW employee_id != 1 OF THE TABLE

-- QUERY DATA with WHERE AND IS 
SELECT *
FROM employees
WHERE hire_date IS NULL; -- VIEW hire_date IS NULL OF THE TABLE

-- QUERY DATA with WHERE AND IS NOT
SELECT *
FROM employees
WHERE hire_date IS NOT NULL; -- VIEW hire_date IS NOT NULL OF THE TABLE

-- UPDATE DATA
UPDATE employees
SET hourly_pay = 10.25
WHERE employee_id = 6; -- UPDATE hourly_pay = 10.25 WHERE employee_id = 6
SELECT * FROM employees; -- VIEW ALL THE CONTENT OF THE TABLE

-- UPDATE MULTIPLE 
UPDATE employees
SET hourly_pay = 10.25,
    hire_date = "2023-01-07"
WHERE employee_id = 6; -- UPDATE hourly_pay = 10.25, hire_date = "2023-01-07" WHERE employee_id = 6

-- UPDATE DATA TO NULL
UPDATE employees
SET hourly_pay = NULL
WHERE employee_id = 6; -- UPDATE hourly_pay = NULL WHERE employee_id = 6

-- UPDATE ALL ROWS
UPDATE employees
SET hourly_pay = 10.25; -- UPDATE hourly_pay = 10.25
-- NO WHERE CLAUSE WILL UPDATE ALL ROWS

-- DELETE ROW FROM TABLE
DELETE FROM employees; -- DELETE ALL ROWS FROM TABLE

-- DELETE ROW FROM TABLE WITH WHERE
DELETE FROM employees
WHERE employee_id = 6; -- DELETE employee_id = 6 FROM TABLE
SELECT * FROM employees; -- VIEW ALL THE CONTENT OF THE TABLE

-- AUTOCOMMIT
SET AUTOCOMMIT = OFF; -- SET AUTOCOMMIT TO OFF
COMMIT; -- COMMIT CHANGES TO SVAE THEM

DELETE FROM employees; -- DELETE ALL ROWS FROM TABLE

-- ROLLBACK
ROLLBACK; -- ROLLBACK CHANGES

-- TEMPORARY TABLES GET DATE, TIME, AND DATETIME
CREATE TABLE test (
    my_date DATE,
    my_time TIME,
    my_datetime DATETIME
);

SELECT * FROM test; -- VIEW ALL THE CONTENT OF THE TABLE

-- INSERT CURRENT_DATE(), CURRENT_TIME(), NOW() INTO TABLE
INSERT INTO test
VALUES (CURRENT_DATE(), CURRENT_TIME(), NOW()); -- INSERT CURRENT_DATE(), CURRENT_DATE(), NOW() INTO TABLE

-- INSERT CURRENT_DATE(), NULL, NULL INTO TABLE
INSERT INTO test
VALUES (CURRENT_DATE(), NULL, NULL); -- INSERT CURRENT_DATE(), NULL, NULL INTO TABLE

-- INSERT CURRENT_DATE() + 1, NULL, NULL INTO TABLE FOR TOMORROW DATE
INSERT INTO test
VALUES (CURRENT_DATE() + 1, NULL, NULL);

-- DROP TABLE
DROP TABLE test; -- DROP test TABLE

-- UNIQUE CONSTRAINT TO MAKE SURE NO DUPLICATES
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(25) UNIQUE, -- UNIQUE CONSTRAINT CANT INSERT THE SAME PRODUCT_NAME
    price DECIMAL(4,2)
);

-- IF YOU FORGET TO ADD UNIQUE CONSTRAINT
ALTER TABLE products
ADD CONSTRAINT
UNIQUE(product_name); -- ADD UNIQUE CONSTRAINT

SELECT * FROM products; -- VIEW ALL THE CONTENT OF THE TABLE

INSERT INTO products
VALUES (100, "hamburger", 3.99),
       (101, "fries", 1.89),
       (102, "soda", 1.00),
       (103, "ice cream", 1.49); -- INSERT INTO products

-- add duplicate product_name
INSERT INTO products
VALUES (104, "hamburger", 3.99); -- ERROR CANT ADD DUPLICATE: Duplicate entry 'hamburger' for key 'products.product_name'
 
-- change the price of ice ceam price
UPDATE products
SET price = 1.75
WHERE product_name = "ice cream"; -- UPDATE price = 1.75 WHERE product_name = "ice cream"

-- how to create with NOT NULL CONSTRAINT
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(25),
    price DECIMAL(4,2) NOT NULL -- NOT NULL CONSTRAINT CANT INSERT NULL
)

-- IF YOU FORGET TO ADD NOT NULL CONSTRAINT
ALTER TABLE products
MODIFY COLUMN price DECIMAL(4,2) NOT NULL; -- ADD NOT NULL CONSTRAINT

INSERT INTO products
VALUES (104, "cookie", NULL); -- ERROR CANT ADD NULL: Column 'price' cannot be null

INSERT INTO products
VALUES (104, "cookie", 0); -- pice can be 0 but not null
SELECT * FROM products; -- VIEW ALL THE CONTENT OF THE TABLE

-- CHECK CONSTRAINT
CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5,2),
    hire_date DATE,
    CONSTRAINT chk_hourly_pay CHECK (hourly_pay >= 10.00) -- CHECK CONSTRAINT
);

-- ADD CHECK CONSTRAINT
ALTER TABLE employees
ADD CONSTRAINT chk_hourly_pay CHECK (hourly_pay >= 10.00); -- ADD CHECK CONSTRAINT
SELECT * FROM employees; -- VIEW ALL THE CONTENT OF THE TABLE

INSERT INTO employees
VALUES (6, "Sheldon", "Plankton", 5.00, "2023-01-07"); -- ERROR CANT ADD hourly_pay < 10.00: Check constraint 'employees.chk_hourly_pay' is violated.

-- DELETE CHECK CONSTRAINT
ALTER TABLE employees
DROP CHECK chk_hourly_pay; -- DELETE CHECK CONSTRAINT

-- DEFAULT CONSTRAINT
SELECT * FROM products; -- VIEW ALL THE CONTENT OF THE TABLE

INSERT INTO products
VALUES (104, "straw", 0.00),
       (105, "napkin", 0.00),
       (106, "fork", 0.00),
       (107, "spoon", 0.00);

DELETE FROM products -- DELETE ALL ROWS FROM TABLE
WHERE product_id >= 104; -- DELETE product_id >= 104 FROM TABLE

-- CREATE TABLE WITH DEFAULT CONSTRAINT
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(25),
    price DECIMAL(4,2) DEFAULT 0.00 -- DEFAULT CONSTRAINT
);

-- ADD DEFAULT CONSTRAINT
ALTER TABLE products
ALTER price SET DEFAULT 0.00; -- ADD DEFAULT CONSTRAINT

INSERT INTO products (product_id, product_name)
VALUES (104, "straw"),
       (105, "napkin"),
       (106, "fork"),
       (107, "spoon"); -- INSERT INTO products

CREATE TABLE transactions (
    transaction_id INT,
    amount DECIMAL(5, 2),
    transaction_date DATETIME DEFAULT NOW() -- DEFAULT CONSTRAINT
)

SELECT * FROM transactions; -- VIEW ALL THE CONTENT OF THE TABLE

INSERT INTO transactions (transaction_id, amount)
VALUES (1, 10.00),
       (2, 20.00),
       (3, 30.00),
       (4, 40.00); -- INSERT INTO transactions

DROP TABLE transactions; -- DROP transactions TABLE

-- PRIMARY KEY CONSTRAINT ONLY CAN HAVE ONE PRIMARY KEY PER TABLE
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY, -- PRIMARY KEY CONSTRAINT
    amount DECIMAL(5, 2)
);

SELECT * FROM transactions; -- VIEW ALL THE CONTENT OF THE TABLE

-- ADD PRIMARY KEY CONSTRAINT TO TABLE THAT ALREADY EXISTS
ALTER TABLE transactions
ADD CONSTRAINT
PRIMARY KEY(transaction_id); -- ADD PRIMARY KEY CONSTRAINT

INSERT INTO transactions
VALUES (1003, 3.99); -- INSERT INTO transactions EACH PK MUST BE UNIQUE

SELECT amount
FROM transactions
WHERE transaction_id = 1003; -- VIEW amount WHERE transaction_id = 1003

DROP TABLE transactions; -- DROP transactions TABLE

-- AUTO_INCREMENT ATTRIBUTE TO MAKE PK AUTO INCREMENT BY 1
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT, -- AUTO_INCREMENT ATTRIBUTE
    amount DECIMAL(5, 2)
);

INSERT INTO transactions (amount)
VALUES (4.99); -- INSERT INTO transactions

INSERT INTO transactions (amount)
VALUES (5.99); -- INSERT INTO transactions

-- alter table to add auto_increment attribute
ALTER TABLE transactions
AUTO_INCREMENT = 1000; -- ADD AUTO_INCREMENT ATTRIBUTE

DELETE FROM transactions; -- DELETE ALL ROWS FROM TABLE

INSERT INTO transactions (amount)
VALUES (4.99); -- INSERT INTO transactions 1000 pk

INSERT INTO transactions (amount)
VALUES (5.99); -- INSERT INTO transactions 1001 pk

-- FOREIGN KEY CONSTRAINT
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

SELECT * FROM customers; -- VIEW ALL THE CONTENT OF THE TABLE

INSERT INTO customers (first_name, last_name)
VALUES ("Fred", "Fish"),
       ("Larry", "Lobster"),
       ("Bubble", "Bass");-- INSERT INTO customers

Drop TABLE transactions;

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5, 2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id) -- FOREIGN KEY CONSTRAINT
);

SELECT * FROM transactions; -- VIEW ALL THE CONTENT OF THE TABLE

-- DROP FOREIGN KEY CONSTRAINT
ALTER TABLE transactions
DROP FOREIGN KEY transactions_ibfk_1; -- DROP FOREIGN KEY CONSTRAINT

-- ADD FOREIGN KEY NAME
ALTER TABLE transactions
ADD CONSTRAINT fk_customer_id 
FOREIGN KEY(customer_id) REFERENCES customers(customer_id); -- ADD FOREIGN KEY NAME

DELETE FROM transactions; -- DELETE ALL ROWS FROM TABLE

ALTER TABLE transactions
AUTO_INCREMENT = 1000; -- ADD AUTO_INCREMENT ATTRIBUTE

INSERT INTO transactions (amount, customer_id)
VALUES (4.99, 3),
       (2.89, 2),
       (3.38, 3),
       (4.99, 1);

DELETE FROM customers -- DELETE ALL ROWS FROM TABLE
WHERE customer_id = 3; -- DELETE customer_id = 3 FROM TABLE: Cannot delete or update a parent row: a foreign key constraint fails (`mysql_full`.`transactions`, CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`))

-- JOIN TABLES: COMEBIONE ROWS FROM MULTIPLE TABLES
SELECT * FROM transactions; -- VIEW ALL THE CONTENT OF THE TABLE

INSERT INTO transactions (amount, customer_id)
VALUES (1.00, NULL); -- INSERT INTO transactions

INSERT INTO customers (first_name, last_name)
VALUES ("Poppy", "Puff"); -- INSERT INTO customers
SELECT * FROM customers; -- VIEW ALL THE CONTENT OF THE TABLE

-- INNER JOIN
SELECT *
FROM transactions INNER JOIN customers -- INNER JOIN
ON transactions.customer_id = customers.customer_id; -- ON transactions.customer_id = customers.customer_id

SELECT transaction_id, amount, first_name, last_name -- SELECT SPECIFIC COLUMNS
FROM transactions INNER JOIN customers -- INNER JOIN
ON transactions.customer_id = customers.customer_id;

-- LEFT JOIN: display all rows from the left table and matching rows from the right table
SELECT * 
FROM transactions LEFT JOIN customers -- INNER JOIN
ON transactions.customer_id = customers.customer_id;

-- RIGHT JOIN: display all rows from the right table and matching rows from the left table
SELECT * 
FROM transactions RIGHT JOIN customers -- INNER JOIN
ON transactions.customer_id = customers.customer_id;

-- FUNCTION

-- COUNT FUNCTION: COUNT THE NUMBER OF ROWS IN THE COLUMN
SELECT COUNT(amount) AS "Todays Transactions" -- give it a name
FROM transactions; -- COUNT THE NUMBER OF ROWS IN THE COLUMN

-- MAX FUNCTION: FIND THE MAX VALUE IN THE COLUMN
SELECT MAX(amount) AS "Max amount" -- give it a name
FROM transactions;

-- MIN FUNCTION: FIND THE MIN VALUE IN THE COLUMN
SELECT MIN(amount) AS "Min amount" -- give it a name
FROM transactions;

-- AVG FUNCTION: FIND THE AVG VALUE IN THE COLUMN
SELECT AVG(amount) AS "Avg amount" -- give it a name
FROM transactions;

-- SUM FUNCTION: FIND THE SUM VALUE IN THE COLUMN
SELECT SUM(amount) AS "Sum amount" -- give it a name
FROM transactions;

-- cincatinate function: CONCAT first_name, last_name. PUT THE TWO COLUMNS TOGETHER
SELECT CONCAT(first_name, last_name) AS "Full Name" -- give it a name
FROM employees; -- CONCAT first_name, last_name

-- LOGICAL OPERATORS: AND, OR, NOT, between, in
ALTER TABLE employees
ADD COLUMN job VARCHAR(25) AFTER hourly_pay; -- ADD COLUME job VARCHAR(25) AFTER hourly_pay
SELECT * FROM employees; -- VIEW ALL THE CONTENT OF THE TABLE

UPDATE employees
SET job = "manager"
WHERE employee_id = 1; -- UPDATE job = "cashier" WHERE employee_id = 1

UPDATE employees
SET job = "cashier"
WHERE employee_id = 2; -- UPDATE job = "cashier" WHERE employee_id = 2

UPDATE employees
SET job = "cook"
WHERE employee_id = 3; -- UPDATE job = "cashier" WHERE employee_id = 3

UPDATE employees
SET job = "cook"
WHERE employee_id = 4; -- UPDATE job = "cashier" WHERE employee_id = 4

UPDATE employees
SET job = "asst. manager"
WHERE employee_id = 5; -- UPDATE job = "cashier" WHERE employee_id = 5

UPDATE employees
SET job = "janitor"
WHERE employee_id = 6; -- UPDATE job = "cashier" WHERE employee_id = 6

-- AND OPERATOR
SELECT *
FROM employees
WHERE hire_date < "2023-01-5"; -- VIEW hire_date < "2023-01-5"

SELECT *
FROM employees
WHERE hire_date < "2023-01-5" AND job = "cook"; -- VIEW hire_date < "2023-01-5" AND job = "cook"

-- OR OPERATOR
SELECT *
FROM employees
WHERE job = "cook" OR job = "cashier"; -- VIEW job = "cook" OR job = "cashier"

-- NOT OPERATOR
SELECT *
FROM employees
WHERE NOT job = "manager"; -- VIEW NOT job = "manager"

-- combine logical operators
SELECT *
FROM employees
WHERE NOT job = "manager" AND NOT job = "asst. manager"; -- VIEW NOT job = "manager" AND NOT job = "asst. manager"

-- BETWEEN OPERATOR
SELECT *
FROM employees
WHERE hire_date BETWEEN "2023-01-04" AND "2023-01-07"; -- VIEW hire_date BETWEEN "2023-01-04" AND "2023-01-07"

-- IN OPERATOR
SELECT *
FROM employees
WHERE job IN ("cook", "cashier", "janitor"); -- VIEW job IN ("cook", "cashier", "janitor")

-- Wiled Cards: %, _  with the like operator = substitute for any number of characters
SELECT *
FROM employees
WHERE first_name LIKE "S%"; -- VIEW first_name LIKE "S%" names that start with S

SELECT *
FROM employees
WHERE hire_date LIKE "2023%"; -- VIEW hire_date LIKE "2023%" dates that start with 2023

SELECT *
FROM employees
WHERE last_name LIKE "%r"; -- VIEW last_name LIKE "%R" names that end with R

SELECT *
FROM employees
WHERE first_name LIKE "Sp%"; -- VIEW first_name LIKE "Sp%" names that start with Sp


SELECT *
FROM employees
WHERE job LIKE "_ook"; -- VIEW job LIKE "_OOK" jobs that have ook in the middle

SELECT *
FROM employees
WHERE hire_date LIKE "____-01-__"; -- VIEW hire_date LIKE "____-01-__" dates that have 01 in the middle

SELECT *
FROM employees
WHERE hire_date LIKE "____-__-02"; -- VIEW hire_date LIKE "____-__-02" dates that have 02 at the end

-- COMBINE WILD CARDS
SELECT *
FROM employees
WHERE job LIKE "_a%"; -- VIEW job LIKE "_a%" jobs that have a in the second cahracter


-- ORDER BY: ASC, DESC
SELECT * FROM employees
ORDER BY last_name; -- ORDER BY first_name ASC

SELECT * FROM employees
ORDER BY last_name DESC; -- ORDER BY first_name DESC

SELECT * FROM transactions
ORDER BY amount, customer_id; -- ORDER BY amount ASC, customer_id ASC: if two amouts are the same then order by customer_id

-- Limit clause: is used to limit the number of rows returned from the query
SELECT * FROM employees
LIMIT 3; -- LIMIT 3

SELECT * FROM customers
ORDER BY last_name LIMIT 1; -- ORDER BY last_name LIMIT 1

-- LIMIT OFFSET: is used to skip rows before beginning to return rows from the query
SELECT * FROM customers
LIMIT 1, 1; -- LIMIT 1, 1: skip 1 row and return 1 row


CREATE TABLE income (
    income_name VARCHAR(25),
    amount DECIMAL(5, 2)
);

CREATE TABLE expenses (
    expense_name VARCHAR(25),
    amount DECIMAL(5, 2)
);

ALTER TABLE income
MODIFY COLUMN amount DECIMAL(10, 2); -- ALTER TABLE income column amount DECIMAL(10, 2)

INSERT INTO income (income_name, amount)
VALUES ("orders", 1000000.00),
       ("merchandise", 50000.00),
       ("services", 125000.00);

ALTER TABLE expenses
MODIFY COLUMN amount VARCHAR(20); -- ALTER TABLE expenses column amount DECIMAL(10, 2)

INSERT INTO expenses (expense_name, amount)
VALUES ("wages", -250000.00),
       ("tax", -50000.00),
       ("repairs", -1500.00);


-- UNION: is used to combine the result-set of two or more SELECT statements
SELECT * FROM income
UNION
SELECT * FROM expenses; -- UNION

DROP TABLE income; -- DROP income TABLE
DROP TABLE expenses; -- DROP expenses TABLE

-- DOSNT WORK BC THEY HAVE A DIFFERENT NUMBER OF COLUMNS
SELECT * FROM employees -- VIEW ALL THE CONTENT OF THE TABLE
UNION
SELECT * FROM customers; -- UNION

SELECT first_name, last_name FROM employees -- VIEW ALL THE CONTENT OF THE TABLE
UNION
SELECT first_name, last_name FROM customers; -- UNION

-- UNION ALL: shows all rows from both tables including duplicates
SELECT first_name, last_name FROM employees -- VIEW ALL THE CONTENT OF THE TABLE
UNION ALL
SELECT first_name, last_name FROM customers;

-- SELF JOIN: is used to combine rows from two or more tables based on a related column between them
ALTER TABLE customers
ADD COLUMN referal_id INT; -- ADD COLUMN referred_by INT

UPDATE customers
SET referal_id = 1
WHERE customer_id = 2; -- UPDATE referal_id = 1 WHERE customer_id = 1

UPDATE customers
SET referal_id = 2
WHERE customer_id = 3; -- UPDATE referal_id = 2 WHERE customer_id = 2;

UPDATE customers
SET referal_id = 2
WHERE customer_id = 4; -- UPDATE referal_id = 2 WHERE customer_id = 4; 

SELECT *
FROM customers AS a
INNER JOIN customers AS b
ON a.referal_id = b.customer_id; -- SELF JOIN

SELECT a.customer_id, a.first_name, a.last_name, CONCAT(b.first_name, " ", b.last_name) as "Referred By"
FROM customers AS a
INNER JOIN customers AS b
ON a.referal_id = b.customer_id; -- SELF JOIN

SELECT * FROM employees;

ALTER TABLE employees
ADD supervisor_id INT; -- ADD supervisor_id INT

UPDATE employees
SET supervisor_id = 1
WHERE employee_id = 5; -- UPDATE supervisor_id = 1 WHERE employee_id = 2

SELECT * 
FROM employees AS a
INNER JOIN employees AS b
ON a.supervisor_id = b.employee_id; -- SELF JOIN

SELECT a.first_name, a.last_name, 
    concat(b.first_name, " ", b.last_name) AS "Supervisor"
FROM employees AS a
INNER JOIN employees AS b
ON a.supervisor_id = b.employee_id; -- SELF JOIN




