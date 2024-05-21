-- Constraints

-- Default

ALTER TABLE Products
ADD CONSTRAINT DF_Products_Weight
DEFAULT 100 FOR [Weight]

SELECT * FROM Products WHERE [Name] = 'Soy Milk 2'

--INSERT INTO Products (Code, [Name], [Description], Price, Cost)
--VALUES('Soy45', 'Soy Milk 2', 'Soy milk description', 250, 200)

-- Check

ALTER TABLE Products WITH CHECK
ADD CONSTRAINT CHK_Products_Price
CHECK (Price >= 0)


--INSERT INTO Products (Code, [Name], [Description], Price, Cost)
--VALUES('Soy46', 'Soy Milk 3', 'Soy milk description', 20, 200)

--UPDATE Products
--SET Price = -1
--WHERE Code = 'Soy46'

-- Unique

ALTER TABLE Products WITH CHECK
ADD CONSTRAINT UC_Products_Code
UNIQUE(Code)

SELECT * FROM Products


--INSERT INTO Products (Code, [Name], [Description], Price, Cost)
--VALUES('Soy46', 'Soy Milk 4', 'Soy milk description', 20, 200)

--UPDATE Products
--SET Code = 'Soy46'
--WHERE Code = 'Soy45'



-- Workshop

-- Change Products table always to insert value 1 in Price column if no price is provided on insert

ALTER TABLE Products
ADD CONSTRAINT DF_Products_Price
DEFAULT 1 FOR Price

-- Change Products table to prevent inserting Price that will more than 2x bigger then the cost price
SELECT * FROM Products

ALTER TABLE Products WITH NOCHECK
ADD CONSTRAINT CHK_Products_Price_Cost
CHECK(Price < (Cost * 2))

--ALTER TABLE Products
--DROP CONSTRAINT CHK_Products_Price_Cost

--INSERT INTO Products (Code, [Name], [Description], Price, Cost)
--VALUES('Soy49', 'Soy Milk 4', 'Soy milk description', 50, 40)


-- Change Products table to guarantee unique names across the products

ALTER TABLE Products WITH CHECK
ADD CONSTRAINT UC_Products_Name
UNIQUE([Name])

