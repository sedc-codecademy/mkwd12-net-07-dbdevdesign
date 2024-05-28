USE SEDC

SELECT Firstname, LEN(Firstname) AS FirstnameLen
FROM Employees

SELECT [Description], SUBSTRING([Description], 1, 5) AS ShortDesc
FROM Products

SELECT Code, REPLACE(Code, '1', '3')
FROM Products

SELECT FirstName, LastName, REPLACE(Lastname, 'Stojanovski', 'Stojanovska') AS NewLastName
FROM Employees
WHERE Gender = 'F' AND LastName = 'Stojanovski'

SELECT Code, LEFT(Code, 3) AS LEFTFunc, SUBSTRING(Code, 1,3) AS SubstringFunc 
FROM Products