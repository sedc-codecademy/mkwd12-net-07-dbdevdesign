--ALTER TABLE dbo.Customers
--ADD [Email] nvarchar(20) NULL

--ALTER TABLE Customers
--ALTER COLUMN Email nvarchar(100)

--ALTER TABLE Customers
--RENAME COLUMN Email to EmailAddress

--EXEC sp_rename 'Customers.Email', 'EmailAddress', 'COLUMN'

ALTER TABLE Customers
DROP COLUMN EmailAddress