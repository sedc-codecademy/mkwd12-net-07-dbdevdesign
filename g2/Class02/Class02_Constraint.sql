DROP TABLE IF EXISTS [dbo].[Product_test]
GO

CREATE TABLE [dbo].[Product_test](
	[Id] int IDENTITY(1,1) NOT NULL,
	[Code] nvarchar(50) NULL,
	[Name] nvarchar(100) NULL,
	[Description] nvarchar(max) NULL,
	[Weight] decimal(18, 2) NULL,
	[Price] decimal(18,2) NULL CONSTRAINT DFT_Product_test_Price DEFAULT(1),
	[Cost] decimal(18,2) NULL
)
GO

ALTER TABLE Product_test
ADD CONSTRAINT DFT_Product_test_Weight
DEFAULT 100 FOR [Weight]
GO

ALTER TABLE Product_test
ADD CONSTRAINT CHK_Product_test_Price
CHECK (Price >= 1)

ALTER TABLE Product_test
ADD CONSTRAINT UQ_Product_test_Cost UNIQUE (Code)

DELETE FROM Product_test


INSERT INTO Product_test([Name],[Code]) values ('Musli 2','1223123')
GO 

INSERT INTO Product_test([Name], [Price]) values ('Musli 2', 0)
GO --INVALID CHECK
INSERT INTO Product_test([Name], [Price]) values ('Musli 2', 12)
GO

SELECT *
FROM Product_test


