-- Must import in this order:
--1. departments
--2. dept_manager
--3. titles
--4. employees
--5. salaries
--6. dept_emp (Remove ID from columns since it is a serial parameter)

DROP TABLE IF EXISTS Departments CASCADE;
DROP TABLE IF EXISTS Dept_manager CASCADE;
DROP TABLE IF EXISTS Salaries CASCADE;
DROP TABLE IF EXISTS Dept_emp CASCADE;
DROP TABLE IF EXISTS Titles CASCADE;
DROP TABLE IF EXISTS Employees CASCADE;

CREATE TABLE Departments (
    dept_no varchar(50)   NOT NULL,
    dept_name varchar(50)   NOT NULL,
	UNIQUE (dept_no),
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE Dept_emp (
	-- Need to create id parameter so that dept_emp can have a UNIQUE reference constraint
    id SERIAL,
    emp_no int NOT NULL,
    dept_no varchar(50)   NOT NULL,
	UNIQUE (id),
	CONSTRAINT pk_Dept_emp PRIMARY KEY (
    	emp_no, dept_no			
	)
);

CREATE TABLE Dept_manager (
    dept_no varchar(50)   NOT NULL,
    emp_no int   NOT NULL,
	UNIQUE (emp_no),
    CONSTRAINT pk_Dept_manager PRIMARY KEY (
        dept_no, emp_no
     )
);

CREATE TABLE Employees (
    emp_no int   NOT NULL,
    emp_title varchar(50)   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(50)   NOT NULL,
    last_name varchar(50)   NOT NULL,
    sex varchar(1)   NOT NULL,
    hire_date date   NOT NULL,
	UNIQUE (emp_no),
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no, emp_title
     )
);

CREATE TABLE Salaries (
    emp_no int   NOT NULL,
    salary money   NOT NULL,
	UNIQUE (emp_no),
	CONSTRAINT pk_Salaries PRIMARY KEY (
		emp_no
	)
);

CREATE TABLE Titles (
    title_id varchar(50)   NOT NULL,
    title varchar(50) UNIQUE NOT NULL,
	UNIQUE (title_id),
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_emp ADD CONSTRAINT fk_Dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_emp ADD CONSTRAINT fk_Dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title FOREIGN KEY(emp_title)
REFERENCES Titles (title_id);

