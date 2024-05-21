CREATE DATABASE SEDC 

--DROP DATABASE SEDC

USE SEDC

CREATE TABLE [User](
[Id] int NOT NULL,
[FirstName] nvarchar(50) NOT NULL,
[LastName] nvarchar(50) NOT NULL,
[Age] int NULL
)

SELECT * 
FROM [User]

SELECT FirstName, LastName
FROM [User]

INSERT INTO [User]
VALUES (1, 'Tijana', 'Stojanovska', 24) --we use single quotes ' for strings

SELECT * 
FROM [User]

INSERT INTO [User]
VALUES (2, 'Roze', 'Dobrinova', null)

--if we don't write a condition when we use update, all rows will be updated
UPDATE [User] 
SET Age = 25
WHERE Id = 1 -- WHERE FirstName = 'Tijana' 

SELECT * 
FROM [User]

--if we don't write a condition when we use delete, all rows will be deleted
DELETE 
FROM [User]
WHERE FirstName = 'Tijana'

SELECT * 
FROM [User]

TRUNCATE TABLE [User]