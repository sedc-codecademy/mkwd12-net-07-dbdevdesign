-- Sorting

SELECT * FROM Employees
ORDER BY FirstName ASC -- if we dont set ascendig or decending default is ascending

SELECT * FROM Employees
ORDER BY FirstName DESC


-- Find all Employees with FirstName = Aleksandar ordered by Last Name

SELECT * FROM Employees
WHERE FirstName = 'Aleksandar'
ORDER BY LastName

-- List all Employees ordered by FirstName

SELECT * FROM Employees
ORDER BY FirstName

-- Find all Male employees ordered by HireDate, starting from the last hired

SELECT * FROM Employees
WHERE Gender = 'M'
ORDER BY HireDate DESC