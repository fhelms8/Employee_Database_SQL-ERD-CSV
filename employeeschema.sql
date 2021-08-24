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
);

--Create table for Dept Emp
CREATE TABLE dept_emp (
    emp_no integer NOT NULL,
    dept_no character varying(10) NOT NULL
);

--Create table for Dept Manager
CREATE TABLE dept_manager (
    dept_no character varying(10) NOT NULL,
    emp_no integer NOT NULL
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
);

--Create table for salaries
CREATE TABLE salaries (
    emp_no integer NOT NULL,
    salary integer NOT NULL
-- 	salary boolean NOT NULL
);

--Create table for titles
CREATE TABLE titles (
    title_id character varying(10) NOT NULL,
    title character varying(50) NOT NULL
);

select *
from departments