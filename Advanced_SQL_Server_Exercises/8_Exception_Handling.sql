
-- Question 1: Basic TRY...CATCH for Error Logging
CREATE PROCEDURE AddEmployee 
    @EmpID INT, @FName VARCHAR(50), @LName VARCHAR(50), @Email VARCHAR(100), @Salary DECIMAL(10,2), @DeptID INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Salary, DepartmentID)
        VALUES (@EmpID, @FName, @LName, @Email, @Salary, @DeptID);
    END TRY
    BEGIN CATCH
        INSERT INTO AuditLog (Action, ErrorMessage)
        VALUES ('AddEmployee', ERROR_MESSAGE());
    END CATCH
END;
GO

-- Question 2: Using THROW to Re-raise Errors
ALTER PROCEDURE AddEmployee 
    @EmpID INT, @FName VARCHAR(50), @LName VARCHAR(50), @Email VARCHAR(100), @Salary DECIMAL(10,2), @DeptID INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Salary, DepartmentID)
        VALUES (@EmpID, @FName, @LName, @Email, @Salary, @DeptID);
    END TRY
    BEGIN CATCH
        INSERT INTO AuditLog (Action, ErrorMessage)
        VALUES ('AddEmployee', ERROR_MESSAGE());
        THROW;
    END CATCH
END;
GO

-- Question 3: Custom Error with RAISERROR
ALTER PROCEDURE AddEmployee 
    @EmpID INT, @FName VARCHAR(50), @LName VARCHAR(50), @Email VARCHAR(100), @Salary DECIMAL(10,2), @DeptID INT
AS
BEGIN
    IF @Salary <= 0
    BEGIN
        RAISERROR('Salary must be greater than zero.', 16, 1);
        RETURN;
    END
    BEGIN TRY
        INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Salary, DepartmentID)
        VALUES (@EmpID, @FName, @LName, @Email, @Salary, @DeptID);
    END TRY
    BEGIN CATCH
        INSERT INTO AuditLog (Action, ErrorMessage)
        VALUES ('AddEmployee', ERROR_MESSAGE());
        THROW;
    END CATCH
END;
GO

-- Question 4: Nested TRY...CATCH with RAISERROR
CREATE PROCEDURE TransferEmployee
    @EmpID INT, @NewDeptID INT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS(SELECT 1 FROM Departments WHERE DepartmentID = @NewDeptID)
        BEGIN
            RAISERROR('Department does not exist.', 16, 1);
        END
        
        BEGIN TRY
            UPDATE Employees SET DepartmentID = @NewDeptID WHERE EmployeeID = @EmpID;
        END TRY
        BEGIN CATCH
            INSERT INTO AuditLog (Action, ErrorMessage) VALUES ('TransferEmployee Update', ERROR_MESSAGE());
            THROW;
        END CATCH
    END TRY
    BEGIN CATCH
        INSERT INTO AuditLog (Action, ErrorMessage) VALUES ('TransferEmployee Validation', ERROR_MESSAGE());
        THROW;
    END CATCH
END;
GO

-- Question 5: Logging All Errors in a Transaction
CREATE PROCEDURE BatchInsertEmployees
AS
BEGIN
    BEGIN TRAN;
    BEGIN TRY
        INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Salary, DepartmentID) VALUES (101, 'A', 'B', 'a@b.com', 5000, 1);
        INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Salary, DepartmentID) VALUES (101, 'C', 'D', 'c@d.com', 6000, 1); -- Duplicate PK
        COMMIT TRAN;
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN;
        INSERT INTO AuditLog (Action, ErrorMessage) VALUES ('BatchInsertEmployees', ERROR_MESSAGE());
    END CATCH
END;
GO

-- Question 6: Dynamic RAISERROR with Severity and State
ALTER PROCEDURE AddEmployee 
    @EmpID INT, @FName VARCHAR(50), @LName VARCHAR(50), @Email VARCHAR(100), @Salary DECIMAL(10,2), @DeptID INT
AS
BEGIN
    IF @Salary < 0
    BEGIN
        RAISERROR('Salary cannot be negative.', 16, 1);
        RETURN;
    END
    IF @Salary < 1000
    BEGIN
        RAISERROR('Warning: Salary is below minimum threshold.', 10, 1) WITH NOWAIT;
    END
    
    INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Salary, DepartmentID)
    VALUES (@EmpID, @FName, @LName, @Email, @Salary, @DeptID);
END;
GO
