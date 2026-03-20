CREATE DATABASE company;

use company;

CREATE TABLE employee(
emp_id INT PRIMARY KEY,
name VARCHAR(20),
department VARCHAR(10),
salary INT NOT NULL,
city VARCHAR(20),
FOREIGN KEY(department) REFERENCES departments(dept_name)
);

INSERT INTO employee
(emp_id,name,department,salary,city)
VALUES
(101,"Rahul","HR",50000,"Delhi"),
(102,"Priya","Finance",60000,"Mumbai"),
(103,"Aman","IT",55000,"Delhi"),
(104,"Neha","Marketing",45000,"Chennai"),
(105,"Anil","IT",70000,"Mumbai");

CREATE TABLE departments(
dept_id TINYINT PRIMARY KEY,
dept_name VARCHAR(50) UNIQUE
);

INSERT INTO departments
(dept_id,dept_name)
VALUES
(1,"HR"),
(2,"Finance"),
(3,"IT"),
(4,"Marketing");

SELECT * FROM employee;

SELECT name,city
FROM employee;

SELECT * FROM employee
WHERE department ="IT";

SELECT * FROM employee
WHERE city="Delhi";

SELECT * FROM employee
WHERE salary >55000;

SELECT * FROM employee
WHERE salary BETWEEN 45000 AND 65000;

SELECT * FROM employee
WHERE name LIKE 'A%';

SELECT * FROM employee
ORDER BY salary DESC;

SELECT COUNT(*)
FROM employee;

SELECT MAX(salary) AS highest_salary
FROM employee;

SELECT MIN(salary) AS lowest_salary
FROM employee;

SELECT AVG(salary)
FROM employee;

SELECT city, COUNT(city) AS total_employee
FROM employee
GROUP BY city;

SELECT DISTINCT department 
FROM employee;

SELECT department, count(*) AS Total_employee
FROM employee
GROUP BY department;

SELECT department,SUM(salary) AS total_salary
FROM employee
GROUP BY Department;

UPDATE employee
SET salary=salary+5000
WHERE department="Finance";

UPDATE employee
SET city="Pune"
WHERE department="Finance";

CREATE TABLE backup_employee AS
SELECT * FROM employee;

DELETE FROM employee
WHERE emp_id=104;

INSERT INTO employee
SELECT * FROM backup_employee
WHERE emp_id = 104;

SELECT e.name,
d.dept_name
FROM employee e
JOIN departments d
ON e.department=d.dept_name;


SELECT d.dept_name,
e.name 
FROM departments d
LEFT JOIN employee e
ON d.dept_name=e.department;

SELECT d.dept_name,
count(e.emp_id) as total_employee
FROM departments d
LEFT JOIN employee e
ON d.dept_name=e.department
GROUP BY d.dept_name;

SELECT d.dept_name,
SUM(e.salary) as total_salary
FROM departments d
LEFT JOIN employee e
ON d.dept_name=e.department
GROUP BY d.dept_name;

SELECT * FROM employee e
INNER JOIN departments d
ON d.dept_name=e.department;

SELECT 
e.name,
e.department,
CASE WHEN d.dept_name IS NOT NULL THEN 'Valid' ELSE 'Invalid'
END as STATUS
FROM employee e
LEFT JOIN departments d
ON d.dept_name=e.department;

SELECT * FROM employee e
LEFT JOIN departments d
ON d.dept_name=e.department;


SELECT d.dept_name
FROM departments d
LEFT JOIN employee e
ON d.dept_name = e.department
WHERE e.emp_id IS NULL;

SELECT d.dept_name,
COUNT(e.emp_id) AS total_employee,
SUM(e.salary) AS total_salary
FROM departments d
LEFT JOIN employee e
ON d.dept_name=e.department
GROUP BY d.dept_name;

SELECT e.name,
d.dept_name,
d.dept_id
FROM departments d
JOIN employee e
ON d.dept_name=e.department
ORDER BY d.dept_name;

SELECT name,salary
FROM employee
WHERE salary >(SELECT AVG(salary) 
FROM employee);

SELECT AVG(salary) 
FROM employee;


SELECT * FROM employee
WHERE city=(
SELECT city FROM employee 
WHERE name="Rahul");

SELECT name 
FROM employee 
WHERE salary=(SELECT MAX(salary)
AS highest_salary
FROM employee);

SELECT department FROM employee
GROUP BY department
HAVING SUM(salary)=(SELECT MAX(TOTAL) FROM
(SELECT department,SUM(salary) AS total
FROM employee
GROUP BY department)AS dept_salary
);

SELECT * FROM employee
WHERE salary >(SELECT AVG(salary) AS average_salary 
FROM employee);

SELECT name 
FROM employee
WHERE salary=(SELECT MAX(SALARY) FROM employee);

SELECT d.dept_name
FROM departments d
LEFT JOIN employee e
ON d.dept_name=e.department
WHERE e.emp_id IS NULL;

SELECT name 
FROM employee
WHERE salary=(SELECT MIN(salary) FROM employee);

SELECT COUNT(*)
FROM employee
WHERE city=(SELECT city FROM employee
WHERE salary=(SELECT MAX(salary) FROM employee)
LIMIT 1);

SELECT city 
FROM employee
GROUP BY city
HAVING AVG(salary)<(SELECT AVG(salary) FROM employee);

SELECT * FROM employee
WHERE salary>(SELECT salary FROM employee 
WHERE name="Neha");

SELECT DISTINCT department
FROM employee
WHERE salary > 60000;

SELECT * 
FROM employee
WHERE department IN (
  SELECT dept_name 
  FROM departments 
  WHERE dept_name LIKE 'F%'
);

SELECT MAX(salary) AS second_highest_salary
FROM employee
WHERE salary < (SELECT max(salary)
FROM employee);

SELECT name,salary
FROM employee 
WHERE salary=(SELECT MAX(salary)
 AS highest_salary
FROM employee
 where salary<(SELECT MAX(salary) 
 FROM employee));
 
 SELECT * FROM employee e
 LEFT JOIN departments d
 ON e.department=d.dept_name;

SELECT department 
FROM employee
GROUP BY department
HAVING AVG(salary)>55000;

SELECT emp_id,name,department
FROM employee
WHERE department LIKE '%I%';

SELECT city,COUNT(emp_id) AS employee_count
FROM employee
GROUP BY city;

SELECT department,MAX(salary) AS total_salary
FROM employee
GROUP BY department
ORDER BY total_salary DESC
LIMIT 1;








SET SQL_SAFE_UPDATES=0;


