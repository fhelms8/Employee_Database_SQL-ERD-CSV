DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;


--create a table for departments (works)
CREATE TABLE departments (
    dept_no character varying(20) NOT NULL,
    dept_name character varying(50) NOT NULL
	Primary Key (dept_no)
);

--Create table for Dept Emp
CREATE TABLE dept_emp (
    emp_no integer NOT NULL,
    dept_no character varying(10) NOT NULL
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

--Create table for Dept Manager
CREATE TABLE dept_manager (
    dept_no character varying(10) NOT NULL,
    emp_no integer NOT NULL
	PRIMARY KEY (dept_no,emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

--Create table for Employees
CREATE TABLE employees (
  emp_no integer NOT NULL,
  emp_title_id character varying(15) NOT NULL,
  birth_date date DEFAULT ('now'::text)::date NOT NULL,
  first_name character varying(45) NOT NULL,
  last_name character varying(45) NOT NULL,
  sex character varying(1),
  hire_date date DEFAULT ('now'::text)::date NOT NULL
  PRIMARY KEY (emp_no)
);

--Create table for salaries
CREATE TABLE salaries (
    emp_no integer NOT NULL,
    salary integer NOT NULL
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Create table for titles
CREATE TABLE titles (
    title_id character varying(10) NOT NULL,
    title character varying(50) NOT NULL
	PRIMARY KEY (title_id)
);

select *
from departments