use PRAC
--task 1 Create a procedure to select all employees.
CREATE PROCEDURE P2
AS
	begin
		SELECT * FROM EMPLOYEE
	end
execute p2
--task 2--------------------------- Create a stored procedure Display_Emp with parameters. It must take Des_Key as an 
--input and must print all the employees of the entered designation key
CREATE PROCEDURE DISPLAY_DEPT @EMPID INT 
AS
BEGIN
	SELECT NAME FROM DEPARTMENT WHERE ID=(SELECT DEPT_KEY FROM EMPLOYEE WHERE ID=@EMPID)    
END
EXECUTE DISPLAY_DEPT 4
-- Q3 -- Create a stored Procedure Display_Designation with parameters. It must take Emp_ID as an input and Display its Designation name.
CREATE PROCEDURE Display_Designation @EMPID INT 
AS
BEGIN
	SELECT TITLE FROM DESIGNATION WHERE ID=(SELECT DES_KEY FROM EMPLOYEE WHERE ID=@EMPID)    
END
EXECUTE Display_Designation 4
----------------------------------
-- Q4 -- Create a stored Procedure CLASSIFIED with one parameter. It will take a 4 digit pin as input and will
-- check the pin. If the pin is 4231 than show the complete table of employee otherwise print "INCORRECT PIN 
-- ENTERED"

CREATE PROCEDURE CLASSIFIED @PIN INT
AS
BEGIN
	IF @PIN =4321
		BEGIN
			SELECT * FROM EMPLOYEE
		END
	ELSE
		BEGIN
			PRINT'INCORRECT PIN'
		END
END
EXECUTE CLASSIFIED 4321
------------------------------------
-- task5  Create a Stored Procedure to validate the data before insertion. The name must have minimum length
-- of 3 characters and age must be greater than 16. If the above requirements are fulfilled only than insert
-- record otherwise print the reason for not inserting the data
CREATE TABLE VALIDATES
(
	NAME NVARCHAR(50),
	AGE INT
)
CREATE PROCEDURE  VALIDATE @NAME NVARCHAR(50), @AGE INT
AS
BEGIN
	DECLARE @NAMELENGTH INT = LEN(@NAME)
	BEGIN
			 if  @NAMELENGTH > 2 AND @AGE > 16 begin  INSERT INTO VALIDATES VALUES(@NAME, @AGE) END
			 ELSE IF @NAMELENGTH > 2 AND @AGE < 16 begin  PRINT'INVALID AGE'END
			 ELSE IF @NAMELENGTH <= 2 AND @AGE > 16 begin  PRINT'INVALID NAME LENGTH'END
			 ELSE IF  @NAMELENGTH <= 2 AND @AGE < 16 begin   PRINT'BOTH AGE AND NAME LENGTH INVALIDE'END
	END
END
EXECUTE VALIDATE 'MAN',17
---------------------------------------------------------------
CREATE TABLE USERS
(
	ID INT,
	NAME NVARCHAR(50),
	AGE INT
)
--task 6
-- Create a procedure that take three inputs ID, NAME, AGE. If the given ID is already present in the
-- table than print "ID already exist" otherwise insert the data into the table.
CREATE PROCEDURE USERS_INSERT
(
	@ID INT,
	@NAME NVARCHAR(50),
	@AGE INT
)
AS 
BEGIN
DECLARE @IDSTORE INT = (SELECT ID FROM USERS WHERE ID=@ID)
IF	@IDSTORE=@ID
	BEGIN
			PRINT 'ALREADY PRESENT '
	END
ELSE
	BEGIN
			INSERT INTO USERS VALUES(@ID ,@NAME ,@AGE )
	END

END
EXECUTE USERS_INSERT 1,'HASAN',12
EXECUTE USERS_INSERT 2,'Taimoor',12
--task 7
--  Create a stored procedure to calculate and print employee bonus. 
--If the dept_key is 1 then the bonus is 5% of  the salary. If the employee is dept_key is 2 then the bonus
-- is 10% of the salary. Other wise the bonus is 15% of the salary.
CREATE PROCEDURE BONUS
AS
BEGIN

IF (SELECT DEPT_KEY FROM EMPLOYEE WHERE DEPT_KEY = 1) = 1 
	SELECT *, SALARY * 0.05 AS BONUS FROM EMPLOYEE

ELSE IF (SELECT DEPT_KEY FROM EMPLOYEE WHERE DEPT_KEY = 2) = 2 
	SELECT *, SALARY * 0.1 AS BONUS FROM EMPLOYEE
ELSE
	SELECT *, SALARY * 0.15 AS BONUS FROM EMPLOYEE

END

exec bonus