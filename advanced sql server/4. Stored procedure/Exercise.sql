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
    SELECT * FROM Employees WHERE FirstName = @FirstName AND LastName = @LastName;
END;

-- Exercise 3: Delete a Stored Procedure
DROP PROCEDURE sp_InsertEmployee;

-- Exercise 4: Execute a Stored Procedure
-- Assume sp_GetEmployeesByDept exists:
-- EXEC sp_GetEmployeesByDept @DepartmentID = 1;

-- Exercise 5: Return Data from a Stored Procedure
CREATE PROCEDURE sp_CountEmployees  
    @DepartmentID INT
AS 
BEGIN  
    SELECT COUNT(*) AS TotalEmployees FROM Employees WHERE DepartmentID = @DepartmentID;
END;

-- Exercise 6: Use Output Parameters in a Stored Procedure
CREATE PROCEDURE sp_GetTotalSalary  
    @DepartmentID INT,
    @TotalSalary DECIMAL(10,2) OUTPUT
AS 
BEGIN  
    SELECT @TotalSalary = SUM(Salary) FROM Employees WHERE DepartmentID = @DepartmentID;
END;

-- Exercise 7: Create a Stored Procedure with Multiple Parameters
CREATE PROCEDURE sp_UpdateEmployeeSalary
    @EmployeeID INT,
    @NewSalary DECIMAL(10,2)
AS
BEGIN
    UPDATE Employees SET Salary = @NewSalary WHERE EmployeeID = @EmployeeID;
END;
-- EXEC sp_UpdateEmployeeSalary 1, 5500.00;

-- Exercise 8: Create a Stored Procedure with Conditional Logic
CREATE PROCEDURE sp_GiveBonus
    @DepartmentID INT,
    @BonusAmount DECIMAL(10,2)
AS
BEGIN
    IF @DepartmentID = 1
        UPDATE Employees SET Salary = Salary + @BonusAmount WHERE DepartmentID = @DepartmentID;
    ELSE
        PRINT 'Bonus not applicable to this department';
END;
-- EXEC sp_GiveBonus 1, 500.00;

-- Exercise 9: Use Transactions in a Stored Procedure
CREATE PROCEDURE sp_UpdateSalaryWithTxn
    @EmployeeID INT,
    @NewSalary DECIMAL(10,2)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE Employees SET Salary = @NewSalary WHERE EmployeeID = @EmployeeID;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

-- Exercise 10: Use Dynamic SQL in a Stored Procedure
CREATE PROCEDURE sp_GetEmployeesDynamic
    @FilterColumn NVARCHAR(50),
    @FilterValue NVARCHAR(50)
AS
BEGIN
    DECLARE @SQLQuery NVARCHAR(MAX);
    SET @SQLQuery = 'SELECT * FROM Employees WHERE ' + QUOTENAME(@FilterColumn) + ' = @Value';
    EXEC sp_executesql @SQLQuery, N'@Value NVARCHAR(50)', @FilterValue;
END;

-- Exercise 11: Handle Errors in a Stored Procedure
CREATE PROCEDURE sp_UpdateSalarySafe
    @EmployeeID INT,
    @NewSalary DECIMAL(10,2)
AS
BEGIN
    BEGIN TRY
        UPDATE Employees SET Salary = @NewSalary WHERE EmployeeID = @EmployeeID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS CustomErrorMessage;
    END CATCH
END;\n