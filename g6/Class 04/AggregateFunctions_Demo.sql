USE SEDC

--Total employees
SELECT COUNT(*) AS Total
FROM Employees

SELECT Gender, COUNT(*) AS Total
FROM Employees
GROUP BY Gender

SELECT COUNT(Code) AS Total
FROM Products

SELECT COUNT(Firstname) --this will count all the records including duplicate (100)
FROM Employees

SELECT COUNT(DISTINCT Firstname) --this will count only the distinct records (10)
FROM Employees

SELECT E.Firstname, COUNT(Firstname)
FROM Employees E
GROUP BY E.FirstName

SELECT SUM(Price) AS ProductsSum
FROM Products

SELECT MIN(Price) AS MinimalPrice
FROM Products

SELECT MAX(Price) AS MaxmalPrice
FROM Products

SELECT MAX([Name]) AS LongestName
FROM Customers

SELECT AVG(Price) AS AvgPrice
FROM Products

SELECT STRING_AGG(Firstname, ', ') AS EmployeeName
FROM Employees


SELECT STRING_AGG(Firstname + ' ' + LastName, ', ') AS EmployeeFullName
FROM Employees

SELECT STRING_AGG(Firstname, '@') AS EmployeeName
FROM Employees
