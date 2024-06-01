/* ======== ERROR HANDLING =========*/

-- ERROR_NUMBER

begin try
	-- generate a divide-by-zero error.
	select 1/0;
end try
begin catch
	select ERROR_NUMBER() as ErrorNumber
end catch

-- ERROR_SEVERITY

begin try
	-- generate a divide-by-zero error.
	select 1/0;
end try
begin catch
	select ERROR_SEVERITY() as ErrorSeverity
end catch

-- ERROR_STATE

begin try
	-- generate a divide-by-zero error.
	select 1/0;
end try
begin catch
	select ERROR_STATE() as ErrorState
end catch

create procedure ExampleProc
as
	select 1/0;
go

begin try
	exec ExampleProc
end try
begin catch
	select ERROR_PROCEDURE() as ErrorProcedure
end catch

create procedure GetErrorInfo
as
select
	ERROR_NUMBER() as ErrorNumber,
	ERROR_SEVERITY() as ErrorSeverity,
	ERROR_STATE() as ErrorState,
	ERROR_PROCEDURE() as ErrorProcedure,
	ERROR_LINE() as ErrorLine,
	ERROR_MESSAGE() as ErrorMessage
go

begin try 
	select 1/0
end try
begin catch
	exec GetErrorInfo
end catch


begin try 
	exec ExampleProc
end try
begin catch
	exec GetErrorInfo
end catch