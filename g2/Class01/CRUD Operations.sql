USE [master]
GO
-- query for the execution of the whole file to work as aspected
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'SEDC')
	ALTER DATABASE [SEDC] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [Master]
GO
DROP DATABASE IF EXISTS [SEDC]
GO
CREATE DATABASE [SEDC]
GO
USE [SEDC]
GO


-- ***** CREATE *****
-- create new database object (database, table, view, procedure etc...)

CREATE TABLE [Customer] (
	Id INT NOT NULL,
	FirstName NVARCHAR(20) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	City NVARCHAR(50) NULL
)
GO

SELECT * FROM dbo.Customer


-- ***** INSERT *****
-- insert new records in table
INSERT INTO dbo.Customer (Id, FirstName, LastName, City) -- the columns we are inserting in
--VALUES (1,"Bob",'Bobsky','Skopje')
VALUES (1,'Bob','Bobsky','Skopje')

INSERT INTO [dbo].[Customer] ([Id], [FirstName], [LastName], [City])
VALUES (2, 'John', 'Doe', 'Chicago')
GO


-- ***** DROP *****
-- deletes database objects
DROP TABLE dbo.Customer
GO


-- create the table with Id as Primary Key (autoincrementing)
CREATE TABLE [Customer] (
	Id INT IDENTITY(1,1),
	FirstName NVARCHAR(20) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	City NVARCHAR(50) NULL
	CONSTRAINT PK_Customer PRIMARY KEY CLUSTERED (Id)
)
GO


-- ***** INSERT *****
-- insert new records in table
INSERT INTO dbo.Customer (FirstName, LastName, City) 
VALUES ('Bob','Bobsky','Skopje')

INSERT INTO [dbo].[Customer] ([FirstName], [LastName], [City])
VALUES ('John', 'Doe', 'Chicago')
GO

-- inserting multiple values
INSERT INTO [dbo].[Customer] ([FirstName], [LastName], [City])
VALUES ('Jane', 'Doe', 'Chicago'),
	   ('Petko', 'Petkovski', 'Tel Aviv'),
	   ('Greg', 'Gregski', 'Paris')
GO

 
-- ***** ALTER *****
-- update database object definition
ALTER TABLE Customer
ALTER COLUMN City NVARCHAR(100) NOT NULL
GO

ALTER TABLE Customer
ADD Age int NULL -- add new column
GO


-- ***** SELECT *****
SELECT * FROM dbo.Customer -- select all columns
SELECT FirstName, LastName FROM dbo.Customer -- select specific columns 
SELECT Age AS [Customer Age] FROM dbo.Customer
GO


-- ***** UPDATE *****
-- update values in tables
--UPDATE dbo.Customer SET City = 'Tokyo' -- rarely used
UPDATE dbo.Customer SET Age = 35
WHERE FirstName = 'Greg'
GO

UPDATE Customer SET FirstName = 'Johnny', City = 'Denver', Age = 28
WHERE Id = 2
GO


-- ***** DELETE *****
-- delete records in tables
DELETE FROM Customer
WHERE FirstName = 'Petko'
GO