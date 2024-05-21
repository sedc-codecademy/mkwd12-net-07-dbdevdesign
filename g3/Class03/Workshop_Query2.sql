--Change Products table always to insert value 1 in Price column if no price is provided on insert
ALTER TABLE Products
ADD CONSTRAINT DF_Products_Price
DEFAULT 1 FOR Price
--Change Products table to prevent inserting Price that will more than 2x bigger then the cost price
ALTER TABLE Products WITH CHECK
ADD CONSTRAINT CHK_Products_Price 
CHECK (Price <= 2*Cost)
--Change Products table to guarantee unique names across the products
ALTER TABLE Products
ADD CONSTRAINT UC_Products_Name
UNIQUE ([Name])
