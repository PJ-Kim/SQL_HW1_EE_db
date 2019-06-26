--Query 6 Tables
SELECT * FROM department;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
--join salary field from salary table

SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no

--2. List employees who were hired in 1986.
SELECT last_name, first_name, hire_date
FROM employees 
WHERE hire_date BETWEEN '1985-12-31' AND '1987-1-1 23:59:59.998'
-- In 1986, 36,323 employees were hired.

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
	--tables on inner join
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name, s.from_date, s.to_date
FROM dept_manager dm
JOIN department d
ON dm.dept_no = d.dept_no
JOIN salaries s
ON dm.emp_no = s.emp_no
JOIN employees e
ON dm.emp_no = e.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT de.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
RIGHT JOIN dept_emp de
ON e.emp_no = de.emp_no
RIGHT JOIN department d
ON de.dept_no = d.dept_no;
--- some employees listed more than once.

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT last_name, first_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- join tables department, dept_employee & employee
SELECT de.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN department d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales';

--7.  List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- join tables department, dept_employee & employee
SELECT de.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN department d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

--8.  In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT (last_name) AS "Employees with Shared Last Names"
FROM employees
GROUP BY last_name
ORDER BY (Count (last_name))Desc;

--Bonus question SQL database
