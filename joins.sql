CREATE database HTECH;


CREATE TABLE employees (
 emp_id INT PRIMARY KEY,
 emp_name VARCHAR(50),
 dept_id INT,
 salary INT
);

CREATE TABLE departments (
 dept_id INT PRIMARY KEY,
 dept_name VARCHAR(50)
);

CREATE TABLE customers (
 customer_id INT PRIMARY KEY,
 customer_name VARCHAR(50),
 city VARCHAR(50)
);

CREATE TABLE orders (
 order_id INT PRIMARY KEY,
 customer_id INT,
 order_date DATE,
 amount INT
);

INSERT INTO employees VALUES
(1,'Amit',101,50000),
(2,'Rohit',102,60000),
(3,'Neha',101,55000),
(4,'Priya',103,45000),
(5,'Raj',NULL,40000);
-- Insert Departments
INSERT INTO departments VALUES
(101,'IT'),
(102,'HR'),
(103,'Finance'),
(104,'Marketing');
-- Insert Customers
INSERT INTO customers VALUES
(1,'Arjun','Delhi'),
(2,'Riya','Mumbai'),
(3,'Karan','Pune'),
(4,'Sara','Delhi');
-- Insert Orders
INSERT INTO orders VALUES
(1,1,'2024-01-01',500),
(2,2,'2024-01-02',700),
(3,1,'2024-01-05',300),
(4,3,'2024-01-06',900);

SELECT * 
FROM employees AS e
JOIN departments AS d
ON e.dept_id=d.dept_id;

SELECT e.emp_name,
e.salary,
d.dept_name
FROM employees AS e
INNER JOIN departments d
ON e.dept_id=d.dept_id;

SELECT e.emp_id,
e.emp_name,
d.dept_name
FROM employees as e
JOIN departments AS d
ON e.dept_id=d.dept_id
WHERE d.dept_name = 'IT';

SELECT e.emp_id,
e.emp_name,
e.salary,
d.dept_name
FROM employees AS e
JOIN departments AS d
ON e.dept_id=d.dept_id
WHERE e.salary >50000;

SELECT e.emp_id,
e.emp_name,
e.salary,
d.dept_id,
d.dept_name
FROM employees AS e
JOIN departments AS d
ON e.dept_id=d.dept_id
ORDER BY salary;

SELECT *
FROM orders AS o
LEFT JOIN customers AS c
ON o.customer_id=c.customer_id
WHERE c.city='Delhi';

SELECT c.customer_id,
c.customer_name,
COUNT(o.order_id) AS total_orders
FROM customers AS c
LEFT JOIN Orders AS o
ON c.customer_id=o.customer_id
GROUP BY c.customer_id,c.customer_name;

SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id=o.customer_id
WHERE o.amount>500;

SELECT c.customer_name,
SUM(o.amount) AS total_amount
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id=o.customer_id
GROUP BY c.customer_name;

SELECT * 
FROM employees AS e
JOIN departments AS d
ON e.dept_id=d.dept_id
WHERE e.salary>(
SELECT AVG(salary) 
FROM employees
WHERE dept_id=e.dept_id);

SELECT d.dept_name,
COUNT(e.emp_name)AS total_employee
FROM departments AS d
JOIN employees AS e
ON e.dept_id=d.dept_id
GROUP BY d.dept_name
HAVING COUNT(e.emp_id)>1;

SELECT e1.emp_name AS employee1,
       e2.emp_name AS employee2,
       e1.dept_id
FROM employees AS e1
JOIN employees AS e2
ON e1.dept_id = e2.dept_id
AND e1.emp_id < e2.emp_id;

SELECT d.dept_name,
MAX(e.salary) AS highest_salary
FROM employees AS e
RIGHT JOIN departments AS d
ON e.dept_id=d.dept_id
GROUP BY d.dept_name;

SELECT c.customer_name,
COUNT(o.order_id) AS total_order
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id=o.customer_id
GROUP BY customer_name
HAVING COUNT(o.order_id)>1;

SELECT c.customer_name,
o.amount
FROM customers AS c
JOIN orders AS o
ON c.customer_id=o.customer_id
WHERE o.amount=
            (SELECT MAX(amount) FROM orders );

CREATE database ABHIADITI;

-- Employees Table
CREATE TABLE employees (
 emp_id INT PRIMARY KEY,
 emp_name VARCHAR(50),
 dept_id INT,
 salary INT
);
-- Departments Table
CREATE TABLE departments (
 dept_id INT PRIMARY KEY,
 dept_name VARCHAR(50)
);
-- Customers Table
CREATE TABLE customers (
 customer_id INT PRIMARY KEY,
 customer_name VARCHAR(50),
 city VARCHAR(50)
);
-- Orders Table
CREATE TABLE orders (
 order_id INT PRIMARY KEY,
 customer_id INT,
 order_date DATE,
 amount INT
);
-- Insert Employees
INSERT INTO employees VALUES
(1,'Amit',101,50000),
(2,'Rohit',102,60000),
(3,'Neha',101,55000),
(4,'Priya',103,45000),
(5,'Raj',NULL,40000);
-- Insert Departments
INSERT INTO departments VALUES
(101,'IT'),
(102,'HR'),
(103,'Finance'),
(104,'Marketing');
-- Insert Customers
INSERT INTO customers VALUES
(1,'Arjun','Delhi'),
(2,'Riya','Mumbai'),
(3,'Karan','Pune'),
(4,'Sara','Delhi');
-- Insert Orders
INSERT INTO orders VALUES
(1,1,'2024-01-01',500),
(2,2,'2024-01-02',700),
(3,1,'2024-01-05',300),
(4,3,'2024-01-06',900);

SELECT * 
FROM employees AS e
JOIN departments AS d
ON e.dept_id=d.dept_id;

SELECT e.emp_name,
e.salary,
d.dept_name
FROM employees AS e
INNER JOIN departments d
ON e.dept_id=d.dept_id;

SELECT e.emp_id,
e.emp_name,
d.dept_name
FROM employees as e
JOIN departments AS d
ON e.dept_id=d.dept_id
WHERE d.dept_name = 'IT';

SELECT e.emp_id,
e.emp_name,
e.salary,
d.dept_name
FROM employees AS e
JOIN departments AS d
ON e.dept_id=d.dept_id
WHERE e.salary >50000;

SELECT e.emp_id,
e.emp_name,
e.salary,
d.dept_id,
d.dept_name
FROM employees AS e
JOIN departments AS d
ON e.dept_id=d.dept_id
ORDER BY salary;

SELECT *
FROM orders AS o
LEFT JOIN customers AS c
ON o.customer_id=c.customer_id
WHERE c.city='Delhi';

SELECT c.customer_id,
c.customer_name,
COUNT(o.order_id) AS total_orders
FROM customers AS c
LEFT JOIN Orders AS o
ON c.customer_id=o.customer_id
GROUP BY c.customer_id,c.customer_name;

SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id=o.customer_id
WHERE o.amount>500;

SELECT c.customer_name,
SUM(o.amount) AS total_amount
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id=o.customer_id
GROUP BY c.customer_name;

SELECT * 
FROM employees AS e
JOIN departments AS d
ON e.dept_id=d.dept_id
WHERE e.salary>(
SELECT AVG(salary) 
FROM employees
WHERE dept_id=e.dept_id);

SELECT d.dept_name,
COUNT(e.emp_name)AS total_employee
FROM departments AS d
JOIN employees AS e
ON e.dept_id=d.dept_id
GROUP BY d.dept_name
HAVING COUNT(e.emp_id)>1;

SELECT e1.emp_name AS employee1,
       e2.emp_name AS employee2,
       e1.dept_id
FROM employees AS e1
JOIN employees AS e2
ON e1.dept_id = e2.dept_id
AND e1.emp_id < e2.emp_id;

SELECT d.dept_name,
MAX(e.salary) AS highest_salary
FROM employees AS e
RIGHT JOIN departments AS d
ON e.dept_id=d.dept_id
GROUP BY d.dept_name;

SELECT c.customer_name,
COUNT(o.order_id) AS total_order
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id=o.customer_id
GROUP BY customer_name
HAVING COUNT(o.order_id)>1;

SELECT c.customer_name,
o.amount
FROM customers AS c
JOIN orders AS o
ON c.customer_id=o.customer_id
WHERE o.amount=
            (SELECT MAX(amount) FROM orders );



