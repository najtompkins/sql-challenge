-- Task #1
-- List the 1)employee number, 2)last name, 3)first name, 4)sex, and 5)salary of each employee.
SELECT e.emp_no AS "Employee Number",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		e.sex AS "Employee Number",
		s.salary AS "Salary"
FROM employees AS e
LEFT JOIN salaries AS s
	ON e.emp_no = s.emp_no


-- Task #2
-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 	e.last_name AS "Last Name",
		e.first_name AS "First Name",
		e.hire_date AS "Hire Date"
FROM employees as e
WHERE hire_date >= '1986-01-01'
		AND hire_date <= '1986-12-31'
		
		
-- Task #3
-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT d.dep_name AS "Department Name", 
		d.dept_no AS "Department Number", 
		e.emp_no AS "Employee Number", 
		e.last_name AS "Last Name", 
		e.first_name AS "First Name"
FROM departments as d
INNER JOIN dept_manager AS dm
	ON d.dept_no = dm.dept_no
INNER JOIN employees AS e
	ON dm.emp_no = e.emp_no


-- Task #4
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT  d.dept_no AS "Department Number", 
		e.emp_no AS "Employee Number", 
		e.last_name AS "Last Name", 
		e.first_name AS "First Name",
		d.dep_name AS "Department Name" 
FROM departments AS d
INNER JOIN dept_emp AS de
	ON d.dept_no = de.dept_no
INNER JOIN employees AS e
	ON de.emp_no = e.emp_no


-- Task #5
-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name AS "First Name", 
		last_name AS "Last Name", 
		sex AS "Sex/Gender"
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'


-- Task #6
-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 	emp_no AS "Employee Number",
		last_name AS "Last Name",
		first_name AS "First Name"
FROM employees
where emp_no IN 
	(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
	
		(
		SELECT dept_no
		FROM departments
			where dept_name = 'Sales'
		)
	)


-- Task #7
-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 	e.emp_no AS "Employee Number",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
FROM departments AS d
Inner JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
	
SELECT d.dept_no AS "Department Number", 
        e.emp_no AS "Employee Number",
        e.first_name AS "First Name",
        e.last_name AS "Last Name", 
        d.dept_name AS "Department Name"
FROM departments AS d
INNER JOIN dept_emp AS de
ON d.dept_no = de.dept_no
INNER JOIN employees AS e
ON de.emp_no = e.emp_no
WHERE de.emp_no IN 
	(
	SELECT de.emp_no
	FROM dept_emp AS de
	WHERE de.dept_no IN
	
		(
		SELECT d.dept_no
		FROM departments AS d
			WHERE d.dept_name = 'Sales'
			OR d.dept_name = 'Development'
		)
	)
	
-- Task #8
-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "Frequency of Occurance"
FROM employees
GROUP BY last_name
Order By "Frequency of Occurance" DESC
