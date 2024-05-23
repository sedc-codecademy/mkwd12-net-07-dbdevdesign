USE SEDC
GO

-- ===================== VIEWS =====================
-- => view is a virtual table whose contents are defined by a query
-- => stored queries that display data from the base tables
-- => views can be queried, updated and joined, just like regular tables

-- Usecases :
-- 1) Simplify Complex Queries (queries with multiple joins etc..)
-- 2) Restrict access only to needed data, rather than the whole data
-- 3) Performance and Readability improvements
-- 4) Mostly used for retriving data rather than manipulating


-- ===> Example: Product Detail View 
-- we need only Name, Description, Weight from the Product table
SELECT * FROM dbo.Product p

SELECT p.Name, p.Description, p.Weight FROM dbo.Product p
GO

CREATE VIEW vw_ProductDetail AS
SELECT 
	p.Name, 
	p.Description, 
	p.Weight 
FROM dbo.Product p
GO

-- NOTE: Prefixes like vw, vv are added before the name of the new View for better recognition

SELECT * FROM dbo.vw_ProductDetail
GO

-- Updating the base table Product (will affect vw_ProductDetail as well)
UPDATE dbo.Product
SET [Description] = 'Yummy'
WHERE Name = 'Cookies'

-- Inserting new records in the view will also afect the base table
INSERT INTO dbo.vw_ProductDetail (Name, Description, Weight)
VALUES ('New Product', 'New Description', 100)
GO

--DELETE FROM dbo.vw_ProductDetail
--WHERE Name = 'New Product'
--GO


-- ===> Example: Create Order Summary View
-- Needed data:
-- Order table: Id, OrderDate, Status, TotalPrice
-- BusinessEntity table: Name
-- Employee table: Full Name (FirstName + LastName)
-- Customer table: Name

CREATE VIEW vw_OrderSummary AS
SELECT
	o.Id AS OrderId,
	o.OrderDate,
	o.Status AS OrderStatus,
	be.Name AS BusinessEntityName,
	o.TotalPrice,
	c.Name AS CustomerName,
	e.FirstName + ' ' + e.LastName AS EmployeeFullName
FROM dbo.[Order] o
JOIN dbo.BusinessEntity be on be.Id = o.BusinessEntityId
JOIN dbo.Customer c on c.Id = o.CustomerId
JOIN dbo.Employee e on o.EmployeeId = e.Id
GO

-- NOTE: The columns in the view are created with the names of the aliases
SELECT os.CustomerName, os.EmployeeFullName, od.* FROM dbo.vw_OrderSummary os
JOIN dbo.OrderDetails od on od.OrderId = os.OrderId
GO

INSERT INTO dbo.vw_OrderSummary (BusinessEntityName,CustomerName)
VALUES('Test Entity','Test Customer')
-- ERROR! View or function 'dbo.vw_OrderSummary' is not updatable because the modification affects multiple base tables.