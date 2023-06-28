/*Consider you need to create database of an application like CAREEM. In which user will create his account after entering 
his name & mobile number. Driver can also create his account after entering his name, mobile number, car number, NIC. 
User can order for a ride. Ride can be GO_mini, GO or GO+. You also need to maintain user wallet and locations that user 
have saved. All the rides must be stored in database.

Create tables and insert 5 records in each table.
Write queries to get following data.

--> Fetch all users that have travelled from North Nazimabad to Gulshan-e-Iqbal in last 5 days
--> Fetch all users that have travelled from Go+ more than 5 times
--> Fetch all rides with all user data and riders data
--> Fetch top 2 users that have the highest wallet amount
--> Fetch all riders that have completed more than 3 rides in last 7 days*/

CREATE DATABASE CAREEMS
USE CAREEMS
CREATE TABLE USER_WALLET
(
	User_Id int primary key ,
	wallet_amount int not null,
)
CREATE TABLE USER_ACCOUNT
(
	Mobile_Number nvarchar(11) Primary Key,
	User_Name nvarchar(40) not null,	
)
CREATE TABLE DRIVER_ACCOUNT
(
	NIC nvarchar(40) Primary Key,
	Mobile_Number nvarchar(11) not null,
	Driver_Name nvarchar(40) not null
)
CREATE TABLE Go_Type
(
	Car_Plate nvarchar(40),
	Type nvarchar(40),
	primary key(Car_Plate,Type)
)
CREATE TABLE ORDERS
(
	Ride_id int Primary Key,
	Ride_Date date, 
	Ride_Start nvarchar(40),
	Ride_End nvarchar(40),
	Car_Plate nvarchar(40),
	Type nvarchar(40),
	Mobile_Number nvarchar(11) foreign Key references USER_ACCOUNT(Mobile_Number),
	foreign Key(Car_Plate,Type) references Go_Type(Car_Plate,Type),
	NIC nvarchar(40) foreign Key references DRIVER_ACCOUNT(NIC),
	User_Id int foreign key references USER_WALLET(User_Id),
)

--- SHOW
Select * from ORDERS
Select * from USER_ACCOUNT
Select * from DRIVER_ACCOUNT
Select * from USER_WALLET
Select * from Go_Type

-- Create tables and insert 5 records in each table.
---------------------------------------
INSERT INTO USER_WALLET VALUES(1,2000);
INSERT INTO USER_WALLET VALUES(2,1000);
INSERT INTO USER_WALLET VALUES(3,8000);
INSERT INTO USER_WALLET VALUES(4,4000);
INSERT INTO USER_WALLET VALUES(5,5000);
---------------------------------------
INSERT INTO USER_ACCOUNT VALUES('03002132511','Mike');
INSERT INTO USER_ACCOUNT VALUES('03002132541','Wire');
INSERT INTO USER_ACCOUNT VALUES('03002132423','Root');
INSERT INTO USER_ACCOUNT VALUES('03002132523','Root');
INSERT INTO USER_ACCOUNT VALUES('03002132513','Watson');
---------------------------------------
INSERT INTO DRIVER_ACCOUNT VALUES('90008-0100170-4','03002232511','Hen');
INSERT INTO DRIVER_ACCOUNT VALUES('90008-0100170-3','03002332541','Wen');
INSERT INTO DRIVER_ACCOUNT VALUES('90008-0100170-2','03002432423','Kan');
INSERT INTO DRIVER_ACCOUNT VALUES('90008-0100170-1','03002532523','Orton');
INSERT INTO DRIVER_ACCOUNT VALUES('90008-0100170-0','03002632513','Wan');
---------------------------------------------------------------------------
INSERT INTO Go_Type VALUES('NHC-3711','Go+');
INSERT INTO Go_Type VALUES('NHC-3702','Go+');
INSERT INTO Go_Type VALUES('NHC-3713','GO_mini');
INSERT INTO Go_Type VALUES('NHC-3717','GO_mini');
INSERT INTO Go_Type VALUES('NHC-3215','Go');
-----------------------------------------------------------------------------
INSERT INTO ORDERS VALUES(1,'2021-12-25','North Nazimabad',' Gulshan-e-Iqbal','NHC-3702','Go+','03002132511','90008-0100170-4',2);
INSERT INTO ORDERS VALUES(2,'2021-12-24','North Nazimabad',' Gulshan-e-Iqbal','NHC-3711','Go+','03002132511','90008-0100170-1',2);
INSERT INTO ORDERS VALUES(3,'2021-12-21','North Nazimabad',' Gulshan-e-Iqbal','NHC-3717','GO_mini','03002132511','90008-0100170-4',2);
INSERT INTO ORDERS VALUES(4,'2021-12-22','Shanti-e-Nagar',' Gulshan-e-Iqbal','NHC-3717','GO_mini','03002132511','90008-0100170-2',1);
INSERT INTO ORDERS VALUES(5,'2021-12-21','North Nazimabad',' Dalmia','NHC-3717','GO_mini','03002132511','90008-0100170-0',3);
 
 DROP TABLE ORDERS 
--> Fetch all users that have travelled from North Nazimabad to Gulshan-e-Iqbal in last 5 days
SELECT *  FROM ORDERS WHERE Ride_Start='North Nazimabad' AND Ride_End=' Gulshan-e-Iqbal' AND DAY(DATEDIFF(DAY,RIDE_DATE,SYSDATETIME()))<='5'
--> Fetch all users that have travelled from Go+ more than 5 times
SELECT Mobile_Number  ,COUNT(*) as [NO OF RIDES IN GO+]  FROM ORDERS WHERE TYPE='GO+' GROUP BY Mobile_Number having count(*)>1 
--> Fetch all rides with all user data and riders data
SELECT * ,(SELECT User_Name FROM USER_ACCOUNT WHERE Mobile_Number=ORDERS.Mobile_Number) AS USER_NAME,
(SELECT Driver_Name FROM DRIVER_ACCOUNT WHERE NIC=ORDERS.NIC) AS Driver_Name,
(SELECT Mobile_Number  FROM DRIVER_ACCOUNT WHERE NIC=ORDERS.NIC) AS Mobile_Number FROM ORDERS  
--> Fetch top 2 users that have the highest wallet amount
Select top 2 *  from USER_WALLET order by wallet_amount  desc
--> Fetch all riders that have completed more than 3 rides in last 7 days*/
SELECT NIC , COUNT(*)  FROM ORDERS WHERE DAY(DATEDIFF(DAY,RIDE_DATE,SYSDATETIME()))<='7' GROUP BY NIC HAVING COUNT(*)>3