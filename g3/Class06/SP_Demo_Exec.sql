USE [SEDC]
GO

EXEC	[dbo].[sp_CreateCustomer]
		@Name = N'Kit Go Bitola',
		@AccountNumber = N'123213123123',
		@City = N'Bitola',
		@RegionName = N'Bitolski',
		@CustomerSize = N'Medium',
		@PhoneNumbe = N'070123456',
		@IsActive = 1
