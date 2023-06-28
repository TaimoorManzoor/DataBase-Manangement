create database LabTrigger
use LabTrigger

create table users
(
	id int,
	name nvarchar(50),
	dept nvarchar(50)
)

create table dept
(
	id int,
	name nvarchar(50),
	total_count int
)
create table logs
(
	id int identity(1,1),
	command nvarchar(50),
	doc date
)
--------------------
-- Task 1:Create triggers that executes whenever insert, update and delete query runs on USER table. The trigger will insert appropriate record in LOGS table.
CREATE TRIGGER TASK1 ON USERS
AFTER INSERT ,UPDATE, DELETE
AS
BEGIN
		IF EXISTS(SELECT * FROM INSERTED) AND EXISTS(SELECT * FROM DELETED)
			BEGIN
				INSERT INTO LOGS SELECT 'UPDATE',GETDATE()
			END
		ELSE IF EXISTS(SELECT * FROM INSERTED)
			BEGIN
					INSERT INTO LOGS SELECT 'INSERT',GETDATE()
			END
		ELSE 
			BEGIN
				INSERT INTO LOGS SELECT 'DELETE',GETDATE()
			END
END
-- Task 2: Create triggers that executes whenever insert, update and delete query runs on USER table. The trigger will update total count value in department table
CREATE TRIGGER TASK2 on users
after Insert ,Update,Delete
AS
BEGIN
	IF EXISTS(SELECT * FROM INSERTED) AND EXISTS(SELECT * FROM DELETED)
	BEGIN
		  DECLARE @TEMP INT =(SELECT ID FROM INSERTED) 
		  UPDATE dept set total_count=total_count+1 where ID=@TEMP
	END
	ELSE IF EXISTS(SELECT * FROM INSERTED)
	BEGIN
		  SET @TEMP =(SELECT ID FROM INSERTED) 
		  UPDATE dept set total_count=total_count+1 where ID=@TEMP
	END
	ELSE
	BEGIN
		  SET @TEMP =(SELECT ID FROM deleted) 
		  UPDATE dept set total_count=total_count-1 where ID=@TEMP    
	END
END