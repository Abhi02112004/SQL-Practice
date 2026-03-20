USE ABHI_COMPANY;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    manager_id INT,
    hire_date DATE,
    city VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'Amit', 'HR', 40000, NULL, '2020-01-10', 'Delhi'),
(2, 'Ravi', 'IT', 60000, 1, '2019-03-15', 'Noida'),
(3, 'Neha', 'IT', 65000, 1, '2021-07-20', 'Delhi'),
(4, 'Suresh', 'Finance', 50000, 2, '2018-11-01', 'Mumbai'),
(5, 'Anita', 'Finance', 55000, 2, '2022-02-25', 'Pune'),
(6, 'Karan', 'IT', 70000, 3, '2017-05-30', 'Bangalore'),
(7, 'Priya', 'HR', 45000, 1, '2023-06-18', 'Delhi'),
(8, 'Vikas', 'IT', 72000, 3, '2016-09-12', 'Noida');

DROP table department;


CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE,
    location VARCHAR(50)
);

INSERT INTO Department (dept_id, dept_name, location) VALUES
(1, 'HR', 'Delhi'),
(2, 'IT', 'Bangalore'),
(3, 'Finance', 'Mumbai');


SELECT *
FROM employees
WHERE salary IN 
(SELECT MAX(salary)
FROM employees);

SELECT * 
FROM employees
WHERE salary IN 
(SELECT MIN(salary)
FROM employees);

SELECT * 
FROM employees
WHERE salary >
(SELECT AVG(salary)
FROM employees);

SELECT * 
FROM employees
WHERE salary <
(SELECT AVG(salary)
FROM employees);

SELECT *
FROM employees AS e
WHERE salary <
(SELECT AVG(salary) 
FROM employees
WHERE department=e.department);

SELECT DISTINCT department
FROM employees
WHERE department IN
(SELECT department
FROM employees
GROUP BY department
HAVING AVG(salary)>50000);

SELECT *
FROM employees
WHERE department =
(SELECT department
FROM employees
WHERE name='Karan');

