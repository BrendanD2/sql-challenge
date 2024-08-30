-- Data Analysis

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM Employees e, Salaries s
WHERE e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = '1986';

--List the manager of each department along with their department number, department name, employee number,
--last name, and first name.
SELECT d.dept_no, d.dept_name, ma.emp_no, e.last_name, e.first_name
FROM departments d
INNER JOIN dept_manager ma on
d.dept_no = ma.dept_no
INNER JOIN employees e on
e.emp_no = ma.emp_no

--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
SELECT d.dept_no, d.dept_name, de.emp_no, e.last_name, e.first_name
FROM departments d
INNER JOIN dept_emp de on
d.dept_no = de.dept_no
INNER JOIN employees e on
e.emp_no = de.emp_no

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins
--with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no, last_name, first_name
FROM employees 
WHERE emp_no in
(
	SELECT emp_no
	FROM dept_emp 
	WHERE dept_no in 
	(
	SELECT dept_no
	FROM departments
	WHERE dept_name = 'Sales'
	)
);

--List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de on
de.emp_no = e.emp_no
INNER JOIN departments d on
de.dept_no = d.dept_no
WHERE d.dept_name in ('Sales', 'Development');


--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY COUNT(*) DESC;
