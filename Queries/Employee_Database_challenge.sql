-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

CREATE TABLE employees (
	 emp_no VARCHAR(8) NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no VARCHAR(8) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
  	emp_no VARCHAR(8) NOT NULL,
  	salary INT NOT NULL,
  	from_date DATE NOT NULL,
  	to_date DATE NOT NULL,
  	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  	PRIMARY KEY (emp_no)
);

CREATE TABLE Dept_emp (
	emp_no VARCHAR(8) NOT NULL,
	dept_no VARCHAR(8) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE Titles (
  	emp_no VARCHAR(8) NOT NULL,
  	titles VARCHAR(50) NOT NULL,
  	from_date DATE NOT NULL,
  	to_date DATE NOT NULL,
  	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  	PRIMARY KEY (emp_no, titles, from_date)
);

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM Dept_emp;
SELECT * FROM Titles;

DROP TABLE departments CASCADE
DROP TABLE employees CASCADE
DROP TABLE dept_manager CASCADE
DROP TABLE salaries CASCADE
DROP TABLE Dept_emp CASCADE
DROP TABLE Titles CASCADE

SELECT * FROM Dept_emp a LEFT JOIN EMPLOYEES b ON a.emp_no = b.emp_no

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
	de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;

-- Joining departments and dept_manager tables
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Use Left Join for retirement_info and dept_emp tables
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- DELIVERABLE 1  
SELECT employees.emp_no, 
	employees.first_name,
 	employees.last_name,   
    titles.titles,
    titles.from_date,
    titles.to_date
INTO retirement_titles
FROM employees
LEFT JOIN Titles
ON employees.emp_no = Titles.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY employees.emp_no;

SELECT * FROM retirement_titles;
DROP TABLE retirement_titles CASCADE

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) retirement_titles.emp_no, 
	retirement_titles.first_name,
 	retirement_titles.last_name,   
    retirement_titles.titles	
INTO unique_titles
FROM retirement_titles	
WHERE retirement_titles.to_date = ('9999-01-01')
ORDER BY retirement_titles.emp_no DESC;

SELECT * FROM unique_titles;
DROP TABLE unique_titles CASCADE

-- Employee count by department number
SELECT COUNT(unique_titles.titles), unique_titles.titles
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.titles
ORDER BY COUNT (unique_titles.titles) DESC


SELECT * FROM retiring_titles;
DROP TABLE retiring_titles CASCADE

--DELIVERABLE 2
SELECT DISTINCT ON (employees.emp_no) employees.emp_no, 
	employees.first_name,
 	employees.last_name,
	employees.birth_date,
    dept_emp.from_date,
    dept_emp.to_date,
	Titles.titles
	
INTO mentorship_eligibilty
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN Titles
ON employees.emp_no = Titles.emp_no

WHERE dept_emp.to_date = ('9999-01-01') AND employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY employees.emp_no DESC;

SELECT * FROM mentorship_eligibilty;
DROP TABLE mentorship_eligibilty CASCADE



