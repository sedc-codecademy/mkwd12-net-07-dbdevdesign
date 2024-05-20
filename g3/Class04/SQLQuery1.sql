ALTER TABLE dbo.Orders WITH CHECK
ADD CONSTRAINT FK_Orders_Customers
FOREIGN KEY (CustomerId)
REFERENCES dbo.Customers (Id)