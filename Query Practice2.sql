CREATE DATABASE PRAC

USE PRAC

SELECT * FROM EMPLOYEE
SELECT * FROM DESIGNATION
SELECT * FROM DEPARTMENT

select * from employee where DES_KEY IN(select id from DESIGNATION where TITLE LIKE '%DEVELOPER');

SELECT DOJ , NAME FROM EMPLOYEE WHERE DOJ>(SELECT DOJ FROM EMPLOYEE WHERE NAME='DANIYAL');

SELECT * FROM  EMPLOYEE WHERE SALARY=(select max(salary) from EMPLOYEE where DEPT_KEY=(select id from DESIGNATION where title='developer'))

select name,age,doj,salary,(select title from DESIGNATION where id=EMPLOYEE.DEPT_KEY),(select name from department where id =EMPLOYEE.DEPT_KEY) from EMPLOYEE 

Select name, age, salary from EMPLOYEE where DES_KEY=(select id from department where name ='DevOps')  and dept_key=(select id from DESIGNATION where title ='team lead')

select id ,name,(select max(salary) from EMPLOYEE where EMPLOYEE.DEPT_KEY=department.id) from DEPARTMENT 
