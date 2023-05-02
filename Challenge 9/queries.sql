SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT "employees".emp_no, "employees".last_name, "employees".first_name, "employees".sex, "salaries".salary
FROM "employees"
INNER JOIN "salaries"
ON "employees".emp_no = "salaries".emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.**
SELECT first_name, last_name, hire_date
FROM "employees"
WHERE hire_date >= TO_DATE('1986-01-01' ,'YYYY mm dd') AND hire_date < TO_DATE('1987-01-01' ,'YYYY mm dd');


--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT "dept_manager".dept_no, "departments".dept_name, "employees".emp_no, "employees".last_name, "employees".first_name
FROM "employees"
INNER JOIN "dept_manager"
ON "employees".emp_no = "dept_manager".emp_no
INNER JOIN "departments"
ON "dept_manager".dept_no = "departments".dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT "departments".dept_name, "employees".emp_no, "employees".last_name, "employees".first_name
FROM "employees"
INNER JOIN "dept_emp"
ON "employees".emp_no = "dept_emp".emp_no
INNER JOIN "departments"
ON "dept_emp".dept_no = "departments".dept_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM "employees"
WHERE first_name = 'Hercules'
AND SUBSTRING(last_name,1,1)='B';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT "employees".emp_no, "employees".last_name, "employees".first_name, "departments".dept_name
FROM "employees"
INNER JOIN "dept_emp"
ON "employees".emp_no = "dept_emp".emp_no
INNER JOIN "departments"
ON "dept_emp".dept_no = "departments".dept_no
WHERE "departments".dept_no = 'd007';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT "employees".emp_no, "employees".last_name, "employees".first_name, "departments".dept_name
FROM "employees"
INNER JOIN "dept_emp"
ON "employees".emp_no = "dept_emp".emp_no
INNER JOIN "departments"
ON "dept_emp".dept_no = "departments".dept_no
WHERE "departments".dept_no = 'd007' or "departments".dept_no = 'd005';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Count"
FROM "employees"
GROUP BY last_name
ORDER BY "Count" DESC;



