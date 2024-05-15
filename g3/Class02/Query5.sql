--INSERT INTO Customers --(CustomerId, [Name], City)
--Values
--(2, 'Slave', 'Skopje')

--SELECT * FROM Products

--Update Products
--SET Price = 80, Quantity = 7
--WHERE [Name] = 'Coca Cola'

--SELECT [Name] as CustomerName, City
--FROM Customers
--WHERE City = 'Skopje'

DELETE 
FROM Products
WHERE Quantity IS NULL

Select * From Products