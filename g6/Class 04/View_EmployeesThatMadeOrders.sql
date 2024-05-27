CREATE VIEW EmployeesThatMadeOrders AS

SELECT E.FirstName, E.LastName, E.HireDate, O.TotalPrice, O.OrderDate, C.[Name]
FROM Orders O
	INNER JOIN Employees E
		ON O.EmployeeId = E.Id
	INNER JOIN Customers C
		ON O.CustomerId = C.Id