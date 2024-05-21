SELECT *
FROM [dbo].[OrderDetails]

SELECT *
FROM [dbo].[Order]
SELECT *
FROM [dbo].[BusinessEntity]


ALTER TABLE [dbo].[Order]
ADD CONSTRAINT FK_Order_BusinessEntity
FOREIGN KEY ([BusinessEntityId])
REFERENCES [dbo].[BusinessEntity] (Id)

ALTER TABLE [dbo].[Order]
ADD CONSTRAINT FK_Order_Customer
FOREIGN KEY ([CustomerId])
REFERENCES [dbo].[Customer] (Id)

ALTER TABLE [dbo].[Order]
ADD CONSTRAINT FK_Order_Employee
FOREIGN KEY ([EmployeeId])
REFERENCES [dbo].[Employee] (Id)

ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT FK_OrderDetails_Order
FOREIGN KEY ([OrderId])
REFERENCES [dbo].[Order] (Id)

ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT FK_OrderDetails_Product
FOREIGN KEY ([ProductId])
REFERENCES [dbo].[Product] (Id)
