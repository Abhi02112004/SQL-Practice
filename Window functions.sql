USE ABHIADITI;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    job_role VARCHAR(30),
    city VARCHAR(30),
    salary INT,
    bonus INT,
    experience_years INT,
    joining_date DATE,
    manager_id INT
);

INSERT INTO employees (emp_id, emp_name, department, job_role, city, salary, bonus, experience_years, joining_date, manager_id) VALUES
(1, 'Amit',   'IT',       'Developer',    'Delhi',      55000,  5000, 2, '2021-01-15', 101),
(2, 'Ravi',   'IT',       'Developer',    'Mumbai',     70000,  8000, 4, '2020-03-10', 101),
(3, 'Neha',   'HR',       'Recruiter',    'Delhi',      50000,  4000, 3, '2022-07-18', 102),
(4, 'Sita',   'Finance',  'Analyst',      'Bangalore',  65000,  7000, 5, '2019-06-11', 103),
(5, 'Karan',  'IT',       'Tester',       'Pune',       48000,  3000, 2, '2023-02-01', 101),
(6, 'Pooja',  'HR',       'Manager',      'Noida',      85000, 10000, 7, '2018-09-25', 102),
(7, 'Arjun',  'Finance',  'Accountant',   'Delhi',      52000,  3500, 3, '2021-11-20', 103),
(8, 'Meena',  'Sales',    'Executive',    'Mumbai',     47000,  4500, 2, '2022-05-17', 104),
(9, 'Rohan',  'Sales',    'Manager',      'Chennai',    90000, 12000, 8, '2017-04-09', 104),
(10,'Priya',  'IT',       'Developer',    'Hyderabad',  72000,  8500, 4, '2020-08-14', 101),
(11,'Vikas',  'Finance',  'Analyst',      'Pune',       61000,  5000, 4, '2021-03-22', 103),
(12,'Anjali', 'HR',       'Recruiter',    'Delhi',      49000,  3200, 2, '2023-01-10', 102),
(13,'Deepak', 'IT',       'Manager',      'Bangalore',  95000, 15000, 9, '2016-12-05', 101),
(14,'Sneha',  'Sales',    'Executive',    'Noida',      53000,  4000, 3, '2021-07-29', 104),
(15,'Rahul',  'Finance',  'Manager',      'Mumbai',     88000, 11000, 8, '2017-10-30', 103),
(16,'Kavya',  'IT',       'Tester',       'Chennai',    51000,  3000, 2, '2022-06-12', 101),
(17,'Manish', 'Sales',    'Executive',    'Delhi',      46000,  2800, 1, '2024-01-05', 104),
(18,'Tina',   'HR',       'Coordinator',  'Pune',       43000,  2500, 1, '2024-02-20', 102),
(19,'Yash',   'Finance',  'Accountant',   'Hyderabad',  54000,  3600, 3, '2021-09-08', 103),
(20,'Nisha',  'IT',       'Developer',    'Delhi',      68000,  7500, 5, '2019-05-16', 101);

DROP TABLE employees;

SELECT *,
ROW_NUMBER () OVER (ORDER BY salary DESC ) AS Ranking
FROM employees;

SELECT*,
RANK() OVER (ORDER BY salary DESC) AS position
FROM employees;

UPDATE  employees_window
SET salary=90000 WHERE salary=88000;

ALTER TABLE employees
CHANGE  emp_salary salary INT;

SELECT *,
DENSE_RANK() OVER(ORDER BY salary DESC )
FROM employees;

SELECT *,
AVG(salary) OVER () AS Avg_salary
FROM employees;

SELECT *,
MAX(Salary) OVER() AS Max_salary
FROM employees;

SELECT *,
SUM(Salary) OVER() AS total_salary
FROM employees;

SELECT *,
COUNT(emp_id) OVER () AS  total_emp
FROM employees;

SELECT *,
ROW_NUMBER() OVER( PARTITION BY department 
ORDER BY salary DESC)
FROM employees;

SELECT * FROM (
SELECT *,
DENSE_RANK() OVER(PARTITION BY department
ORDER BY salary DESC ) AS rankk
FROM employees )d
WHERE rankk<=2;

SELECT * FROM
(SELECT *,
ROW_NUMBER() OVER (PARTITION BY department
ORDER BY salary DESC) AS position
FROM employees) d
WHERE position=2;

SELECT *
FROM (
SELECT *,
AVG(SALARY) OVER (PARTITION BY department) AS avg_salary
FROM employees) d;


SELECT *,
salary-AVG(Salary) OVER(PARTITION BY department )
 AS difference
FROM employees ;

SELECT *,
ROW_NUMBER() OVER (ORDER BY salary DESC) AS salary_position
FROM employees;

SELECT *,
ROW_NUMBER() OVER (ORDER BY joining_date ASC)
FROM employees;

SELECT *,
RANK() OVER (ORDER BY salary DESC ) AS sal_position
FROM employees;

SELECT *,
DENSE_RANK() OVER ( ORDER BY salary DESC) AS salary_position
FROM employees;

SELECT *,
ROW_NUMBER () OVER (PARTITION BY department
ORDER BY salary DESC) AS dept_rank
FROM employees;

SELECT *,
RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS ranking
FROM EMPLOYEES;


UPDATE employees
SET salary =70000
WHERE salary=72000;

SELECT *,
DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC ) AS dence_rank
FROM employees;

SELECT *
FROM (
SELECT salary,
ROW_NUMBER() OVER(ORDER BY salary DESC) AS rnkk
FROM employees) t
WHERE rnkk=1;

SELECT *
FROM (
SELECT salary,
ROW_NUMBER () OVER (ORDER BY salary ) AS lowest_sal
FROM employees) t
WHERE lowest_sal=1;

SELECT *,
COUNT(emp_id) OVER (PARTITION BY department) AS emp_count
FROM employees;

SELECT *,
SUM(salary) OVER() AS total_salary
FROM employees;

SELECT *,
AVG(salary) OVER () avg_salary
FRom employees;

SELECT *,
MAX(salary) OVER () AS maximum_salary
FROM employees;

SELECT *,
MIN(salary) OVER () AS minimum_salary
FROM employees;

SELECT *,
COUNT(*) OVER(ORDER BY salary) AS emp_count
FROM employees;

SELECT * FROM  (
SELECT *,
ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS highest_salary
FROM employees) t
WHERE highest_salary=1;

SELECT * FROM  (
SELECT *,
ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary ) AS lowest_salary
FROM employees) t
WHERE lowest_salary=1;

SELECT * FROM (
SELECT *,
ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS top_salaries
FROM employees) T
WHERE top_salaries <=2;

SELECT * FROM (
SELECT *,
ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary ) AS bottom_salaries
FROM employees) T
WHERE bottom_salaries <=2;

SELECT *
FROM (
  SELECT *,
  COUNT(salary) OVER (PARTITION BY salary) AS sal_count
  FROM employees
) t
WHERE sal_count > 1;

SELECT *,
salary - LAG(salary) OVER () AS difference
FROM employees;

SELECT *,
LAG(salary) OVER(ORDER BY salary ) AS prev_salary
FROM employees;








SET SQL_SAFE_UPDATES = 0;