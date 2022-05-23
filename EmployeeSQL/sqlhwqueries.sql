-- Homework Queries
--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, 
  employees.last_name, 
  employees.first_name, 
  employees.sex,
  salaries.salary
  
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no

--2. List first name, last name, and hire date for employees who were hired in 1986.

select first_name, last_name, hire_date from employees
where hire_date between '1986-01-01' and '1986-12-31'

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT 
	dept_manager.dept_no,
	departments.dept_name,
	employees.emp_no, 
	employees.last_name,  
	employees.first_name
FROM dept_manager
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no
WHERE emp_title_id = 'm0001';

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select
	employees.emp_no, 
	employees.last_name,  
	employees.first_name,
	departments.dept_name
FROM dept_emp
INNER JOIN employees ON
dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select last_name, first_name, sex  
from employees
where first_name = 'Hercules' and last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select
	employees.emp_no, 
	employees.last_name,  
	employees.first_name,
	departments.dept_name
FROM dept_emp
INNER JOIN employees ON
dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
where dept_name = ('Sales');

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select
	employees.emp_no, 
	employees.last_name,  
	employees.first_name,
	departments.dept_name
FROM dept_emp
INNER JOIN employees ON
dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
where dept_name = ('Sales') or dept_name = ('Development');

--8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

SELECT last_name, COUNT(last_name) AS "Share last name"
FROM employees
GROUP BY last_name
ORDER BY "Share last name" DESC;