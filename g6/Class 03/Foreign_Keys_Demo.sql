USE SEDC

SELECT * 
FROM Orders

SELECT * 
FROM BusinessEntities

ALTER TABLE Orders --we are altering the Orders table
ADD CONSTRAINT FK_Orders_BusinessEntities --we are adding a constraint; the naming convention is FK_theTablesAffectedByTheConstraint
FOREIGN KEY (BusinessEntityId) --we specify the column that represents the foreign key
REFERENCES BusinessEntities (Id)--we specify which table the foreign key references

ALTER TABLE Orders --we are altering the Orders table
ADD CONSTRAINT FK_Orders_Customers --we are adding a constraint; the naming convention is FK_theTablesAffectedByTheConstraint
FOREIGN KEY (CustomerId) --we specify the column that represents the foreign key
REFERENCES Customers (Id)--we specify which table the foreign key references

SELECT * FROM Employees
WHERE Id = 200

SELECT * 
FROM Orders
WHERE EmployeeId = 200 

INSERT INTO Orders --it will allow us to insert a value for an employee that does not exist (200)
VALUES ('2019-04-30 00:00:00.000', 0, 9, 4, 200,11916.00, 'Comment')

--DELETE 
--FROM Orders
--WHERE EmployeeId = 200 

ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Employees
FOREIGN KEY (EmployeeId)
REFERENCES Employees (Id)

INSERT INTO Orders --now it will not allow us to insert a value for an employee that does not exist (200) because we have a foreign key constraint now
VALUES ('2019-04-30 00:00:00.000', 0, 9, 4, 200,11916.00, 'Comment')

SELECT *
FROM OrderDetails

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Orders
FOREIGN KEY (OrderId)
REFERENCES Orders (Id)

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Products
FOREIGN KEY (ProductId)
REFERENCES Products (Id)