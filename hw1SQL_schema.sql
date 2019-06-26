DROP TABLE department CASCADE;
DROP TABLE dept_emp CASCADE;
DROP TABLE dept_manager CASCADE;
DROP TABLE employees CASCADE;
DROP TABLE salaries CASCADE;
DROP TABLE titles CASCADE; 

CREATE TABLE department (
  dept_no VARCHAR PRIMARY KEY,
  dept_name varchar(30) not null
);

CREATE TABLE dept_emp (
  emp_no INT,
  dept_no VARCHAR,
  from_date timestamp ,
  to_date timestamp,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  FOREIGN KEY (dept_no) REFERENCES department (dept_no)
);
    
CREATE TABLE dept_manager (
  dept_no VARCHAR,
  emp_no INT,
  from_date timestamp,
  to_date timestamp,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  FOREIGN KEY (dept_no) REFERENCES department (dept_no),
  PRIMARY KEY (dept_no, emp_no)
);
    
CREATE TABLE employees (  
   emp_no INT PRIMARY KEY,
   birth_date timestamp without time zone NOT NULL,
   first_name varchar (30) NOT NULL,
   last_name varchar (30) NOT NULL,
   gender varchar (1),
   hire_date timestamp
);
    
CREATE TABLE salaries (
    emp_no INT,
    salary INTEGER,
    from_date timestamp,
    to_date timestamp,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);
    
CREATE TABLE titles (
    emp_no INT,
    title varchar (30) NOT NULL,
    from_date timestamp,
    to_date timestamp,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

select * From employees;