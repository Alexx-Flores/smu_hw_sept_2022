--1)List the following details of each employee: employee number, last name, first name, sex, and salary.
Select
	e.emp_no as employee_number,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary
FROM
	employees e
	join salaries s on e.emp_no = s.emp_no;
	

--2)List first name, last name, and hire date for employees who were hired in 1986.
Select 
	first_name,
	last_name,
	hire_date
From
	employees 
Where
	extract(year from hire_date)=1986;

--3)List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select
	d.dept_name,
	d.dept_no,
	e.first_name,
	e.last_name,
	dm.emp_no
From
	departments d
	join dept_manager dm on d.dept_no = dm.dept_no
	join employees e on dm.emp_no = e.emp_no;

--4)List the department of each employee with the following information: employee number, last name, first name, and department name.
Select
	d.dept_name,
	e.first_name,
	e.last_name,
	de.emp_no
From
	departments d
	join dept_emp de on d.dept_no= de.dept_no
	join employees e on e.emp_no=de.emp_no;
	
--5)List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
Select
	first_name,
	last_name,
	gender
From
	employees
Where
	first_name = 'Hercules' and substring(last_name,1,1)='B';


--6)List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select
	e.first_name,
	e.last_name,
	e.emp_no,
	d.dept_name
From
	dept_emp de
	join employees e on e.emp_no= de.emp_no
	join departments d on d.dept_no=de.dept_no
Where
	dept_name='Sales';
	

--7)List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select
	e.first_name,
	e.last_name,
	e.emp_no,
	d.dept_name
From
	dept_emp de
	join employees e on e.emp_no= de.emp_no
	join departments d on d.dept_no=de.dept_no
Where
	dept_name='Sales' or dept_name='Development';

--8)List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
Select
	last_name, count(last_name)
From
	employees
	group by last_name
	order by count(last_name) desc;
	