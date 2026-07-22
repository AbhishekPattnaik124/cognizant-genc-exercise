
-- Exercise 1: Create a Scalar Function
CREATE FUNCTION fn_CalculateAnnualSalary(@Salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Salary * 12;
END;
GO
SELECT EmployeeID, FirstName, dbo.fn_CalculateAnnualSalary(Salary) as AnnualSalary FROM Employees;

-- Exercise 2: Create a Table-Valued Function
CREATE FUNCTION fn_GetEmployeesByDepartment(@DeptID INT)
RETURNS TABLE
AS
RETURN (SELECT * FROM Employees WHERE DepartmentID = @DeptID);
GO
SELECT * FROM fn_GetEmployeesByDepartment(2);

-- Exercise 3: Create a User-Defined Function
CREATE FUNCTION fn_CalculateBonus(@Salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Salary * 0.10;
END;
GO
SELECT EmployeeID, dbo.fn_CalculateBonus(Salary) as Bonus FROM Employees;

-- Exercise 4: Modify a User-Defined Function
ALTER FUNCTION fn_CalculateBonus(@Salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Salary * 0.15;
END;
GO

-- Exercise 5: Delete a User-Defined Function
DROP FUNCTION fn_CalculateBonus;
GO

-- Exercise 9: Create a Nested User-Defined Function
CREATE FUNCTION fn_CalculateBonus(@Salary DECIMAL(10,2)) RETURNS DECIMAL(10,2) AS BEGIN RETURN @Salary * 0.10; END;
GO

CREATE FUNCTION fn_CalculateTotalCompensation(@Salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN dbo.fn_CalculateAnnualSalary(@Salary) + dbo.fn_CalculateBonus(@Salary);
END;
GO
