--**SQL Queries**:

--1.Query to find all employees who have been hired in the last year:

SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

--2.Write a query to calculate the total salary expenditure for each department.

SELECT d.department_id, d.department_name, SUM(s.salary) AS total_salary_expenditure
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN salaries s ON e.employee_id = s.employee_id
WHERE s.to_date IS NULL OR s.to_date > CURDATE()
GROUP BY d.department_id, d.department_name;

--3.Write a query to find the top 5 highest-paid employees along with their department names.

SELECT e.employee_id, e.first_name, e.last_name, d.department_name, s.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN salaries s ON e.employee_id = s.employee_id
WHERE s.to_date IS NULL OR s.to_date > CURDATE()
ORDER BY s.salary DESC
LIMIT 5;

