CREATE DATABASE LAB1
USE LAB1
CREATE TABLE UNIVERSITY
(
	ID INT PRIMARY KEY,
	NAME NVARCHAR(50),
	LOCATION NVARCHAR(50) 
)

CREATE TABLE DEPARTMENT
(
	Id int PRIMARY KEY,
	NAME nvarchar(50),
	HOD NVARCHAR(50),
    UNI_KEY INT FOREIGN KEY REFERENCES UNIVERSITY(ID) 
)
CREATE TABLE FACULTY
(
	Id int PRIMARY KEY,
	NAME nvarchar(50),
	SPE_COURSE NVARCHAR(50),
    DEPT_KEY INT FOREIGN KEY REFERENCES DEPARTMENT(ID) 
)
CREATE TABLE COURSE
(
	Id int PRIMARY KEY,
	NAME nvarchar(50),
	FACULTY NVARCHAR(50),
    STU_COUNT INT 
)
CREATE TABLE STUDENT
(
	ID int PRIMARY KEY,
	AGE int,
	NAME nvarchar(50),
	COURSE_KEY INT FOREIGN KEY REFERENCES COURSE(ID), 
	FACULTY_KEY INT FOREIGN KEY REFERENCES FACULTY(ID) 
)

