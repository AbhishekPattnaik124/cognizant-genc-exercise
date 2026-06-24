-- Exercise 1: Create a Scalar Function
CREATE FUNCTION fn_CalculateAnnualSalary (@Salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Salary * 12;
END;
-- SELECT dbo.fn_CalculateAnnualSalary(Salary) FROM Employees;

-- Exercise 2: Create a Table-Valued Function
CREATE FUNCTION fn_GetEmployeesByDepartment (@DepartmentID INT)
RETURNS TABLE
AS
RETURN (
    SELECT * FROM Employees WHERE DepartmentID = @DepartmentID
);
-- SELECT * FROM dbo.fn_GetEmployeesByDepartment(2);

-- Exercise 3: Create a User-Defined Function
CREATE FUNCTION fn_CalculateBonus (@Salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Salary * 0.10;
END;
-- SELECT dbo.fn_CalculateBonus(Salary) FROM Employees;

-- Exercise 4: Modify a User-Defined Function
ALTER FUNCTION fn_CalculateBonus (@Salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Salary * 0.15;
END;

-- Exercise 5: Delete a User-Defined Function
-- DROP FUNCTION fn_CalculateBonus;

-- Exercise 6: Execute a User-Defined Function
-- SELECT dbo.fn_CalculateAnnualSalary(Salary) FROM Employees;

-- Exercise 7: Return Data from a Scalar Function
-- SELECT dbo.fn_CalculateAnnualSalary(Salary) FROM Employees WHERE EmployeeID = 1;

-- Exercise 8: Return Data from a Table-Valued Function
-- SELECT * FROM dbo.fn_GetEmployeesByDepartment(3);

-- Exercise 9: Create a Nested User-Defined Function
CREATE FUNCTION fn_CalculateTotalCompensation (@Salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN dbo.fn_CalculateAnnualSalary(@Salary) + dbo.fn_CalculateBonus(@Salary);
END;

-- Exercise 10: Modify a Nested User-Defined Function
-- If we modified fn_CalculateBonus above, fn_CalculateTotalCompensation automatically uses the new logic.\n