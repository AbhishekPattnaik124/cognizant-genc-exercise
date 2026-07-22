
-- Exercise 1: Create a Stored Procedure
CREATE PROCEDURE sp_InsertEmployee  
    @FirstName VARCHAR(50),  
    @LastName VARCHAR(50),  
    @DepartmentID INT,  
    @Salary DECIMAL(10,2),  
    @JoinDate DATE  
AS 
BEGIN  
    INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate)  
    VALUES (@FirstName, @LastName, @DepartmentID, @Salary, @JoinDate);  
END;
GO

-- Exercise 2: Modify a Stored Procedure
ALTER PROCEDURE sp_InsertEmployee  
    @FirstName VARCHAR(50),  
    @LastName VARCHAR(50),  
    @DepartmentID INT,  
    @Salary DECIMAL(10,2),  
    @JoinDate DATE  
AS 
BEGIN  
    INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate)  
    VALUES (@FirstName, @LastName, @DepartmentID, @Salary, @JoinDate);  
    SELECT @FirstName as FirstName, @Salary as Salary;
END;
GO

-- Exercise 3: Delete a Stored Procedure
DROP PROCEDURE sp_InsertEmployee;
GO

-- Exercise 5: Return Data from a Stored Procedure
CREATE PROCEDURE sp_CountEmployeesByDept
    @DepartmentID INT
AS
BEGIN
    SELECT COUNT(*) as TotalEmployees
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
GO

-- Exercise 6: Use Output Parameters in a Stored Procedure
CREATE PROCEDURE sp_GetTotalSalaryByDept
    @DepartmentID INT,
    @TotalSalary DECIMAL(10,2) OUTPUT
AS
BEGIN
    SELECT @TotalSalary = SUM(Salary)
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
GO

-- Exercise 7: Create a Stored Procedure with Multiple Parameters
CREATE PROCEDURE sp_UpdateEmployeeSalary
    @EmployeeID INT,
    @NewSalary DECIMAL(10,2)
AS
BEGIN
    UPDATE Employees
    SET Salary = @NewSalary
    WHERE EmployeeID = @EmployeeID;
END;
GO

-- Exercise 8: Create a Stored Procedure with Conditional Logic
CREATE PROCEDURE sp_GiveBonus
    @DepartmentID INT,
    @BonusAmount DECIMAL(10,2)
AS
BEGIN
    IF @DepartmentID = 1
        UPDATE Employees SET Salary = Salary + @BonusAmount WHERE DepartmentID = @DepartmentID;
    ELSE
        PRINT 'Bonus not applicable for this department';
END;
GO

-- Exercise 9: Use Transactions in a Stored Procedure
CREATE PROCEDURE sp_UpdateSalaryWithTran
    @EmployeeID INT,
    @NewSalary DECIMAL(10,2)
AS
BEGIN
    BEGIN TRAN;
    BEGIN TRY
        UPDATE Employees SET Salary = @NewSalary WHERE EmployeeID = @EmployeeID;
        COMMIT TRAN;
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN;
    END CATCH
END;
GO

-- Exercise 10: Use Dynamic SQL in a Stored Procedure
CREATE PROCEDURE sp_GetEmployeesDynamic
    @FilterColumn VARCHAR(50),
    @FilterValue VARCHAR(100)
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    SET @SQL = 'SELECT * FROM Employees WHERE ' + @FilterColumn + ' = @Value';
    EXEC sp_executesql @SQL, N'@Value VARCHAR(100)', @FilterValue;
END;
GO

-- Exercise 11: Handle Errors in a Stored Procedure
CREATE PROCEDURE sp_UpdateSalaryWithErrorHandling
    @EmployeeID INT,
    @NewSalary DECIMAL(10,2)
AS
BEGIN
    BEGIN TRY
        UPDATE Employees SET Salary = @NewSalary WHERE EmployeeID = @EmployeeID;
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred: ' + ERROR_MESSAGE();
    END CATCH
END;
GO
