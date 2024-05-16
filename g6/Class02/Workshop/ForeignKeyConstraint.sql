
-- Foreign Key

ALTER TABLE [Orders] WITH CHECK
ADD CONSTRAINT FK_Order_BusinessEntity
FOREIGN KEY (BusinessEntityId)
REFERENCES BusinessEntities (Id)


-- Workshop

-- Add foreign key between BusinessEntity and Order with script

-- Open Ordering system diagram and add foreign keys manually

