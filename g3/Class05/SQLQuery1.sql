--Select * From Orders
--SELECT *
--FROM Employees
--WHERE Id NOT IN (
--		SELECT EmployeeId
--		FROM Orders
--		)

--SELECT *
--FROM Orders o
--INNER JOIN Employees e ON o.EmployeeId = e.Id

--SELECT *
--FROM Orders o
--RIGHT OUTER JOIN Employees e ON o.EmployeeId = e.Id
--WHERE o.Id IS NULL

--SELECT *
--FROM Employees e
--LEFT OUTER JOIN Orders o ON o.EmployeeId = e.Id

SELECT e.Id, e.FirstName, e.LastName, AVG(o.TotalPrice) as Average, Count(o.Id) as [Count]
FROM Orders o
INNER JOIN Employees e ON o.EmployeeId = e.Id
GROUP BY e.Id, e.FirstName, e.LastName
HAVING AVG(o.TotalPrice) >= 2000 AND Count(o.Id) > 50

SELECT e.Id, e.FirstName, e.LastName, AVG(o.TotalPrice) as Average, Count(o.Id) as [Count]
FROM Orders o
INNER JOIN Employees e ON o.EmployeeId = e.Id
WHERE o.OrderDate < '2019-01-05'
GROUP BY e.Id, e.FirstName, e.LastName
HAVING AVG(o.TotalPrice) >= 0 AND Count(o.Id) > 1

