
CREATE TABLE departments (
	dept_no 		VARCHAR(4) 		NOT NULL,
	dept_name 		VARCHAR(40)		NOT NULL,
	UNIQUE (dept_name),
	PRIMARY KEY (dept_no)
);
CREATE TABLE employees (
	emp_no 			INT 		NOT NULL,
	emp_title 		VARCHAR 	NOT NULL,
	birth_date 		DATE 		NOT NULL,
	first_name 		VARCHAR 	NOT NULL,
	last_name 		VARCHAR 	NOT NULL,
	gender 			VARCHAR 	NOT NULL,
	hire_date 		DATE 		NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title) REFERENCES titles (title_id)
);
CREATE TABLE dept_emp (
	emp_no 			INT 			NOT NULL,
	dept_no 		VARCHAR(4) 		NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);
CREATE TABLE dept_manager (
	dept_no 		VARCHAR(4)	NOT NULL,
	emp_no 			INT			NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);
CREATE TABLE salaries (
	emp_no 			INT		NOT NULL,
	salary 			INT		NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)	
);
CREATE TABLE titles (
	title_id 		VARCHAR		NOT NULL,
	title 			VARCHAR		NOT NULL,
	PRIMARY KEY (title_id)
);
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_empl;


