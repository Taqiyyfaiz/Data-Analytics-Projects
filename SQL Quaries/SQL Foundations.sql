SELECT DISTINCT gender
FROM employee_demographics;

SELECT first_name, last_name, salary
FROM parks_and_recreation.employee_salary;

SELECT first_name, last_name, occupation, salary
FROM employee_salary
WHERE salary >= 50000;

SELECT first_name, last_name, occupation, salary
FROM employee_salary
WHERE salary <= 50000;

-- AND / OR Statement
SELECT *
FROM employee_salary
WHERE salary >= 50000 AND  occupation = 'Office Manager';

SELECT *
FROM employee_demographics
WHERE age < 25 AND birth_date >= 1980-01-01;

-- LIKE STATEMENT
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___';

-- Group By & Order By
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender;

SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary;

SELECT * 
FROM employee_demographics
ORDER BY gender, age;

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000;
 -- LIMIT & Alias
SELECT * 
FROM employee_demographics
ORDER BY age DESC
LIMIT 3;

-- ALias
SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;

-- joins is used to align two tables
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT * 
FROM employee_demographics as dem
INNER JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id;
-- INNER Joins
SELECT dem.employee_id, age, occupation
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id;
-- outer joins
-- left joins
select *
FROM employee_demographics as dem
LEFT JOIN employee_salary as sal -- left join takes a entire data from emplyee demo 
	ON dem.employee_id = sal.employee_id;
-- right joins
select *
FROM employee_demographics as dem
RIGHT JOIN employee_salary as sal -- right join takes a entire data from emplyee sal NOTE : if there is no macthes from the left right table from left it show null values 
	ON dem.employee_id = sal.employee_id;    

-- self join - it is a join where you tie the table to itself
select emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp 
from employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;

-- Joining Multiple Tables together
SELECT * 
FROM employee_demographics as dem
INNER JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id;
    
SELECT *
FROM parks_departments;

SELECT *
FROM employee_demographics as dem
INNER JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
	ON sal.dept_id = pd.department_id;