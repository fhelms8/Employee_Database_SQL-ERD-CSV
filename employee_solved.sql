-- 1) List the following details of each employee: employee number, last name, first name, sex, and salary (in salaries > empy_no > salary.

select e.emp_no, e.last_name, e.first_name, e.sex, salary
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no;


--2) List first name, last name, and hire date for employees who were hired in 1986. (first_name, last_name, hire_date = 1986)

select first_name, last_name, hire_date
from employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
;

-- 3) List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name. 
--departments(dept_no, dept_name ) 
--dept_manager(dept_no, emp_no), 
--employees(first_name, last_name, emp_no)

select departments.dept_no, dept_name, dept_manager.emp_no, employees.first_name, employees.last_name
from departments
inner join dept_manager on dept_manager.dept_no = departments.dept_no
inner join employees on dept_manager.emp_no = employees.emp_no;


-- 4) List the department of each employee with the following information: employee number, last name, first name, and department name.
--departments(dept_no, dept_name ) 
--employees(first_name, last_name, emp_no)
--dept_emp (emp_no, dept_no)

select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name 
from departments
inner join dept_emp on dept_emp.dept_no = departments.dept_no
inner join employees on dept_emp.emp_no = employees.emp_no;

-- 5) List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
--(first_name, last_name, sex)

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
;

-- 6) List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- departments(dept_name = sales, dept_no = d007)
-- dept_emp (dept_no = d007, emp_no)
-- employees (last_name, first_name, emp_no)

select emp_no, last_name, first_name, dept_name
from employees, departments
where dept_name = 'Sales';

-- 7)List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- departments(dept_name = sales/d007, dept_name = Development/d005)
-- dept_emp (dept_no = d007, emp_no)
-- employees (last_name, first_name, emp_no)

select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from departments
join dept_emp on departments.dept_no = departments.dept_no
join employees on dept_emp.emp_no = employees.emp_no
Where departments.dept_name in ('Sales', 'Development');

-- 8) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "name count"
FROM employees
GROUP BY last_name
ORDER BY "name count" DESC;