
CREATE VIEW MaleEmployees
AS
SELECT Id, FirstName, LastName, HireDate
FROM Employees
WHERE Gender = 'M'