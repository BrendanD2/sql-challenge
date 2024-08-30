-- Must import in this order:
--1. departments
--2. dept_manager
--3. titles
--4. employees
--5. salaries
--6. dept_emp (Remove ID from columns since it is a serial parameter)

SELECT * FROM departments;

SELECT * FROM dept_emp;

SELECT * FROM dept_manager;

SELECT * FROM employees;

SELECT * FROM salaries;

SELECT * FROM titles;