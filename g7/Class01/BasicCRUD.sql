CREATE DATABASE MyAppDatabase;
CREATE DATABASE MyAppDatabase2;
Create Database MyAppDatabase3;

DROP DATABASE MyAppDatabase2;

-- selecting a database 
--USE MyAppDatabase2;
USE MyAppDatabase;

--Creating a table
CREATE TABLE Student (
StudentId int,
FirstName nvarchar(255),
LastName nvarchar(255),
Age tinyint
);

INSERT INTO Student (FirstName, LastName, Age)
VALUES ('Bob', 'Bobsky', 43);

INSERT INTO Student (StudentId, FirstName, LastName, Age)
VALUES (2, 'Todor', 'Pelivanov', 35);

--Select everything (*) from some table 
SELECT * FROM Student;

--Delete records from table
DELETE FROM Student;

-- update or change data in table => adding new column
ALTER TABLE Student
ADD City nvarchar(255);

-- remove column from table
ALTER TABLE Student
DROP COLUMN City 


SELECT TOP (1000) [StudentId]
      ,[FirstName]
      ,[LastName]
      ,[Age]
  FROM [MyAppDatabase].[dbo].[Student]