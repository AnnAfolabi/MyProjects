	--CREATING A NEW DATABASE, TABLE, AND ADDING VALUES

USE ProjectPortfolio
CREATE TABLE EmployeeDatabase
(
	EmployeeId int,
	LastName varchar (50),
	FirstName varchar (50),
	JobTitle varchar (50),
	Gender varchar (50),
	Location varchar (50)
)
INSERT INTO EmployeeDatabase VALUES
	(1001, 'Ojedokun', 'Olumuyiwa', 'Accountant', 'Male', 'Ketu'),
	(1002, 'Gepele', 'Joy', 'Manager', 'Female', 'Alasia'),
	(1003, 'Abdul', 'Bashir', 'Head Decorator', 'Male', 'Ajah'),
	(1004, 'Aniepah', 'Sunny', 'Decorator', 'Male', 'Badore'),
	(1005, 'Jackson', 'Godwin', 'Store Attendant', 'Male', 'Ilaje'),
	(1006, 'Ashiedu', 'Stephen', 'Driver', 'Male', 'Outside Lagos')

USE DATABASE ProjectPortfolio
CREATE TABLE EmployeeSalary
(
	EmployeeId int,
	JobTitle varchar (50),
	Salary int
)
INSERT INTO EmployeeSalary VALUES
	(1001, 'Accountant', 300000),
	(1002, 'Manager', 200000),
	(1003, 'Head Deorator', 350000),
	(1004, 'Decorator', 250000),
	(1005, 'Store Attendant', 70000),
	(1006, 'Driver', 80000)

USE ProjectPortfolio
INSERT INTO EmployeeDatabase VALUES
	(1007, 'Owolabi', 'Samuel', 'Security', 'Male', 'Sangotedo'),
	(1008, 'Ashi', 'Kenneth', 'Messenger', 'Male', 'Ilaje'),
	(1009, 'Abdul', 'Yusuf', 'Decorator', 'Male', 'Ikorodu'),
	(1010, 'Abdul', 'Wasiu', 'Trainee', 'Male', 'Agungi'),
	(1011, 'Odumosu', 'Ruth', 'Head Decorator', 'Female', 'Obalende'),
	(1012, 'Melody', 'Ugochukwu', 'Decorator', 'Male', 'Outside Lagos'),
	(1013, 'Aunty', 'Peace', 'Trainee', 'Female', 'Jakande'),
	(1014, 'Mr', 'Joseph', 'Head Baker', 'Male', 'Sangotedo'),
	(1015, 'Odumosu', 'Oloruntoba', 'Baker', 'Male', 'Ikota'),
	(1016, 'Asuquo', 'Mary', 'Baker', 'Female', 'Jakande'),
	(1017, 'Mr', 'Jacob', 'Chief Security Officer', 'Male', 'Jakande'),
	(1018, 'Mr', 'Sunny', 'Pastry Chef', 'Male', 'Ajah'),
	(1019, 'Mr', 'Ilemona', 'Kitchen Assistant', 'Male', 'Ikota')

INSERT INTO EmployeeSalary VALUES
	(1007, 'Security', 60000),
	(1008, 'Messenger', 40000),
	(1009, 'Deorator', 100000),
	(1010, 'Trainee', 0),
	(1011, 'Head Decorator', 300000),
	(1012, 'Decorator', 100000),
	(1013, 'Trainee', 0),
	(1014, 'Head Baker', 200000),
	(1015, 'Baker', 150000),
	(1016, 'Baker', 150000),
	(1017, 'Chief Security Officer', 80000),
	(1018, 'Pastry Chef', 80000),
	(1019, 'Kitchen Assistant', 40000)


	--ADDING A NEW COLUMN AND THEN VALUES TO THE EMPLOYEE DATABASE TABLE
ALTER TABLE EmployeeDatabase
ADD Age int
UPDATE EmployeeDatabase
	SET Age = 45 WHERE EmployeeId = 1001
UPDATE EmployeeDatabase
	SET Age = 29 WHERE EmployeeId = 1002
UPDATE EmployeeDatabase
SET Age = 35 WHERE EmployeeId = 1003
	UPDATE EmployeeDatabase
SET Age = 33 WHERE EmployeeId = 1004
	UPDATE EmployeeDatabase
SET Age = 33 WHERE EmployeeId = 1005
	UPDATE EmployeeDatabase
SET Age = 35 WHERE EmployeeId = 1006
	UPDATE EmployeeDatabase
SET Age = 26 WHERE EmployeeId = 1007
	UPDATE EmployeeDatabase
SET Age = 30 WHERE EmployeeId = 1008
	UPDATE EmployeeDatabase
SET Age = 43 WHERE EmployeeId = 1009
	UPDATE EmployeeDatabase
SET Age = 20 WHERE EmployeeId = 1010
	UPDATE EmployeeDatabase
SET Age = 26 WHERE EmployeeId = 1011
	UPDATE EmployeeDatabase
SET Age = 30 WHERE EmployeeId = 1012
	UPDATE EmployeeDatabase
SET Age = 22 WHERE EmployeeId = 1013
	UPDATE EmployeeDatabase
SET Age = 35 WHERE EmployeeId = 1014
	UPDATE EmployeeDatabase
SET Age = 28 WHERE EmployeeId = 1015
	UPDATE EmployeeDatabase
SET Age = 26 WHERE EmployeeId = 1016
	UPDATE EmployeeDatabase
SET Age = 26 WHERE EmployeeId = 1017
	UPDATE EmployeeDatabase
SET Age = 30 WHERE EmployeeId = 1018
	UPDATE EmployeeDatabase
SET Age = 30 WHERE EmployeeId = 1019


	--DATA OF ALL EMPLOYEES IN THE EMPLOYEEDATABASE TABLE
SELECT *
FROM ProjectPortfolio.dbo.EmployeeDatabase


	--CREATING A NEW COLUMN BY USING AN ALIAS
SELECT EmployeeId, LastName, FirstName,
	LastName + ' ' + FirstName AS FullName,
	JobTitle, Gender, Location, Age
FROM EmployeeDatabase


	--Total Number of Employees in the EmployeeDatabase by Their Gender
SELECT Gender, COUNT(Gender) AS GenderCount
FROM ProjectPortfolio.dbo.EmployeeDatabase
GROUP BY Gender

	--AGE COUNT
SELECT Age, COUNT (Age) AS AgeCount
FROM EmployeeDatabase
GROUP BY Age
ORDER BY AgeCount DESC

	--AVERAGE OVERALL AGE
SELECT AVG(Age) AS AverageAge
FROM EmployeeDatabase

	--Job Title Count Across The Employee Database Table
SELECT JobTitle, COUNT (JobTitle) AS JobTitleCount
FROM ProjectPortfolio.dbo.EmployeeDatabase
GROUP BY JobTitle
ORDER BY 2 DESC


--Merging EmployeeDatabase Table and EmployeeSalary Table Together Using Join
SELECT *
FROM ProjectPortfolio.dbo.EmployeeDatabase
INNER JOIN ProjectPortfolio.dbo.EmployeeSalary
ON EmployeeDatabase.EmployeeId = EmployeeSalary.EmployeeId
ORDER BY 2,3


	--Average Salary of Staff Based on Their Job Title & Job Title Count
SELECT EmployeeDatabase.JobTitle, AVG(Salary) AS AverageSalary, COUNT(EmployeeDatabase.JobTitle) AS JobTitleCount
FROM ProjectPortfolio.dbo.EmployeeDatabase
INNER JOIN ProjectPortfolio.dbo.EmployeeSalary
ON EmployeeDatabase.EmployeeId = EmployeeSalary.EmployeeId
GROUP BY EmployeeDatabase.JobTitle
ORDER BY 2 DESC


	--Merging EmployeeDatabase Table and EmployeeSalary Table Together Using UNION
SELECT EmployeeId, LastName
FROM ProjectPortfolio.dbo.EmployeeDatabase
UNION
SELECT EmployeeId, JobTitle
FROM ProjectPortfolio.dbo.EmployeeSalary


	--Salary Increment For Staff Using CASE Statement
SELECT EmployeeDatabase.EmployeeId, FirstName, LastName, EmployeeDatabase.JobTitle, Salary,
	CASE
		WHEN EmployeeDatabase.JobTitle = 'Accountant' THEN Salary + (Salary * .15)
		WHEN EmployeeDatabase.JobTitle = 'Head Decorator' THEN Salary + (Salary * .15)
		WHEN EmployeeDatabase.JobTitle = 'Head Baker' THEN Salary + (Salary * .15)
		WHEN EmployeeDatabase.JobTitle = 'Decorator' AND EmployeeDatabase.JobTitle = 'Manager' THEN Salary + (Salary * .10)
		ELSE Salary + (Salary * .05)
	END AS SalaryIncrement
FROM ProjectPortfolio.dbo.EmployeeDatabase
INNER JOIN ProjectPortfolio.dbo.EmployeeSalary 
ON EmployeeDatabase.EmployeeId = EmployeeSalary.EmployeeId
ORDER BY 6 DESC

