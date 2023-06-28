CREATE DATABASE LAB07 

USE LAB07

CREATE TABLE DEPARTMENT(
	ID INT PRIMARY KEY,
	NAME NVARCHAR(50) UNIQUE NOT NULL,
	LOCATION NVARCHAR(50),
)

CREATE TABLE DESIGNATION(
	ID INT PRIMARY KEY,
	TITLE NVARCHAR(50) UNIQUE NOT NULL,
	PAYSCALE NVARCHAR(50) NOT NULL,
	LEAVES INT	
)

CREATE TABLE EMPLOYEE(
	ID INT PRIMARY KEY IDENTITY(1,1),
	NAME NVARCHAR(50) NOT NULL,
	AGE INT NOT NULL,
	SALARY INT,
	DOJ DATE,
	DES_KEY INT FOREIGN KEY REFERENCES DESIGNATION(ID),
	DEPT_KEY INT FOREIGN KEY REFERENCES DEPARTMENT(ID),
	PH_NO NVARCHAR(50),
	EMAIL NVARCHAR(50) 
)


INSERT INTO DESIGNATION VALUES(1, 'Junior Developer','BPS-17', 12)
INSERT INTO DESIGNATION VALUES(2, 'Senior Developer','BPS-18', 16)
INSERT INTO DESIGNATION VALUES(3, 'Team Lead','BPS-19', 20)
INSERT INTO DESIGNATION VALUES(4, 'Manager','BPS-20', 24)
INSERT INTO DESIGNATION VALUES(5, 'Executive Manager','BPS-21', 24)

INSERT INTO DEPARTMENT VALUES(1, 'DevOps','1st Floor')
INSERT INTO DEPARTMENT VALUES(2, 'Research','1st Floor')
INSERT INTO DEPARTMENT VALUES(3, 'Development','2nd Floor')
INSERT INTO DEPARTMENT VALUES(4, 'Support','3rd Floor')
INSERT INTO DEPARTMENT VALUES(5, 'Human Resource','3rd Floor')

INSERT INTO EMPLOYEE VALUES('Ali',23, 30000, '2019-12-01',1,3,'03341234567','ali@gmail.com')
INSERT INTO EMPLOYEE VALUES('Bilal',27, 60000, '2020-03-09',2,3,'03361234567','bilal_122@gmail.com')
INSERT INTO EMPLOYEE VALUES('Zubair',43, 250000, '2010-05-01',5,2,'03001234567','Zubair_gmail@hotmail.com')
INSERT INTO EMPLOYEE VALUES('Daniyal',30, 130000, '2017-04-25',3,1,'03021234567','dani@hotmail.com')
INSERT INTO EMPLOYEE VALUES('Mustafa',37, 220000, '2012-06-06',4,5,'03347654321','mustafa@outlook.com')

SELECT * FROM EMPLOYEE
SELECT * FROM DESIGNATION
SELECT * FROM DEPARTMENT

-- Q) Display Average Salary of each department in descending order.
SELECT department.ID, AVG(EMPLOYEE.SALARY) AS AVGSALARY FROM DEPARTMENT INNER JOIN  EMPLOYEE ON EMPLOYEE.DEPT_KEY=DEPARTMENT.ID
GROUP BY department.ID ORDER BY AVG(EMPLOYEE.SALARY) DESC
--  Display the count of employees in each department having salary above 20000.
SELECT department.NAME, COUNT(EMPLOYEE.ID) AS NO_OF_EMPLOYEE FROM DEPARTMENT INNER JOIN  EMPLOYEE ON EMPLOYEE.DEPT_KEY=DEPARTMENT.ID WHERE SALARY>20000 GROUP BY department.NAME
-- Select Highest and Lowest salary from each department.
SELECT department.NAME, MAX(EMPLOYEE.SALARY) AS MAX_SALARY, MIN(EMPLOYEE.SALARY) AS MIN_SALARY  FROM DEPARTMENT INNER JOIN  EMPLOYEE ON EMPLOYEE.DEPT_KEY=DEPARTMENT.ID GROUP BY department.NAME
-- Q) Select department number and employee count of those departments whose count is greater than or equal 2.
SELECT department.ID, COUNT(EMPLOYEE.ID) AS NO_OF_EMPLOYEE FROM DEPARTMENT INNER JOIN  EMPLOYEE ON EMPLOYEE.DEPT_KEY=DEPARTMENT.ID GROUP BY department.ID HAVING COUNT(EMPLOYEE.ID)>=2
-- Q) Select department NAME , DEPARTMENT NUMBER and employee count of those departments whose count is greater than 2.
SELECT department.NAME,department.ID, COUNT(EMPLOYEE.ID) AS NO_OF_EMPLOYEE FROM DEPARTMENT INNER JOIN  EMPLOYEE ON EMPLOYEE.DEPT_KEY=DEPARTMENT.ID GROUP BY department.NAME,department.ID HAVING COUNT(EMPLOYEE.ID)>2
-- Q) Select all employees with their designations who are developers
SELECT EMPLOYEE.NAME  FROM EMPLOYEE INNER JOIN  designation ON EMPLOYEE.DES_KEY=designation.ID WHERE designation.TITLE LIKE '%Developer' 
-- Q) Create a query that displays the employee name, department name, salary and department location for all employees.
SELECT department.NAME,department.LOCATION,employee.NAME,employee.SALARY FROM DEPARTMENT FULL JOIN  EMPLOYEE ON EMPLOYEE.DEPT_KEY=DEPARTMENT.ID
--  Write a query to display the department name and department location of all departments whos average salary in greater than 100000 & department location is '1st Floor' or '2nd Floor'
SELECT department.NAME,department.LOCATION, AVG(salary) AS AVG_SALARY  FROM DEPARTMENT FULL JOIN  EMPLOYEE ON EMPLOYEE.DEPT_KEY=DEPARTMENT.ID  WHERE  LOCATION='1st Floor'  OR LOCATION='2ND Floor' GROUP BY  department.NAME,department.LOCATION HAVING AVG(SALARY)>100000
-- Q) Create a query to display the name and hire date of any employee hired after employee Daniyal.
SELECT  E1.NAME, E1.DOJ AS [hire date] FROM EMPLOYEE E1, EMPLOYEE E2 WHERE E1.DOJ > E2.DOJ AND E2.NAME = 'Daniyal'
-- Select department name , department number, employee count and average salary of those departments whose count is greater than 2 and average salary is less than 150000.
SELECT department.NAME,department.ID, COUNT(EMPLOYEE.ID) AS NO_OF_EMPLOYEE , AVG(SALARY) AS AVG_SALARY FROM DEPARTMENT INNER JOIN  EMPLOYEE ON EMPLOYEE.DEPT_KEY=DEPARTMENT.ID GROUP BY department.NAME,department.ID HAVING COUNT(EMPLOYEE.ID)>=2 AND  AVG(SALARY)<150000
-- Print department name, sum of salary and number oF employees of those departments which have sum of salary greater than 200000.
SELECT department.NAME, SUM(SALARY) AS SUM_SALARY , COUNT(EMPLOYEE.ID) AS  NO_OF_EMPLOYEE  FROM DEPARTMENT INNER JOIN  EMPLOYEE ON EMPLOYEE.DEPT_KEY=DEPARTMENT.ID GROUP BY department.NAME HAVING   SUM(SALARY)<200000
