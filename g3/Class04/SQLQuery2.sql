SELECT *
FROM Customers

SELECT *
FROM Orders

SELECT *
FROM Customers AS c
CROSS JOIN Orders AS o

Select *
From Customers AS c
INNER JOIN Orders AS o ON o.CustomerId = c.Id
--Where c.[Name] = 'Zito Bitola'

Select * From Customers

Select *
From Orders AS o
Right Join Customers AS c ON o.CustomerId = c.Id


Select * From Customers
Select * From Orders

Select *
From Customers AS c, Orders As o
Where CustomerId = c.Id


