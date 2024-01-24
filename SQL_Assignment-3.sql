/*    Assignment 3    */
USE vishvarami_db

CREATE TABLE Department (
	dept_id INTEGER  PRIMARY KEY,
	dept_name VARCHAR(20) 
	);

INSERT INTO Department VALUES(101,'HR');

INSERT INTO Department VALUES(102,'IT');

INSERT INTO Department VALUES(103,'Marketing');

SELECT * FROM Department;


CREATE TABLE Employee(
	emp_id INTEGER PRIMARY KEY,
	dept_id INTEGER,
	mngr_id INTEGER,
	emp_name VARCHAR(20),
	salary INTEGER,
	FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

INSERT INTO Employee VALUES(1,101,11,'Mitesh',25000);

INSERT INTO Employee VALUES(2,101,11,'Ram',30000);

INSERT INTO Employee VALUES(3,101,12,'Suresh',25000);

INSERT INTO Employee VALUES(4,102,21,'Radha',50000);

INSERT INTO Employee VALUES(5,102,21,'Nisha',55000);

INSERT INTO Employee VALUES(6,102,21,'Smita',75000);

INSERT INTO Employee VALUES(7,102,22,'Vinisha',60000);

INSERT INTO Employee VALUES(8,102,22,'Jimish',85000);

INSERT INTO Employee VALUES(9,103,31,'Mitraj',45000);

INSERT INTO Employee VALUES(10,103,31,'Shvet',47000);

SELECT * FROM Employee;

/* 1 */
SELECT * FROM Employee ORDER BY salary DESC;

/* 2 */
SELECT d.dept_name FROM Employee e LEFT JOIN  Department d ON  e.dept_id = d.dept_id GROUP BY d.dept_name HAVING COUNT(d.dept_name)<3;

/* 3 */
SELECT d.dept_name , COUNT(d.dept_name) AS no_of_emp FROM Employee e LEFT JOIN Department d ON e.dept_id = d.dept_id GROUP BY d.dept_name;

/* 4 */
SELECT d.dept_name , SUM(e.salary) AS total_salary FROM Employee e  LEFT JOIN Department d ON e.dept_id = d.dept_id GROUP BY d.dept_name;