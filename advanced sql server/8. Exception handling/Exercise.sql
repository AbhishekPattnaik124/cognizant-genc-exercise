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
        VALUES ('Insert Employee', ERROR_MESSAGE());
    END CATCH
END;

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
        VALUES ('Insert Employee', ERROR_MESSAGE());
        THROW;
    END CATCH
END;

-- Question 3: Custom Error with RAISERROR
ALTER PROCEDURE AddEmployee 
    @EmpID INT, @FName VARCHAR(50), @LName VARCHAR(50), @Email VARCHAR(100), @Salary DECIMAL(10,2), @DeptID INT
AS
BEGIN
    IF @Salary <= 0
    BEGIN
        RAISERROR ('Salary must be greater than zero.', 16, 1);
        RETURN;
    END
    -- TRY CATCH logic here...
END;

-- Question 4: Nested TRY...CATCH with RAISERROR
CREATE PROCEDURE TransferEmployee @EmpID INT, @NewDeptID INT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Departments WHERE DepartmentID = @NewDeptID)
        BEGIN
            RAISERROR('Department does not exist.', 16, 1);
        END
        UPDATE Employees SET DepartmentID = @NewDeptID WHERE EmployeeID = @EmpID;
    END TRY
    BEGIN CATCH
        BEGIN TRY
            INSERT INTO AuditLog (Action, ErrorMessage) VALUES ('Transfer', ERROR_MESSAGE());
        END TRY
        BEGIN CATCH
            -- Handle logging failure
        END CATCH
        THROW;
    END CATCH
END;

-- Question 5: Logging All Errors in a Transaction
CREATE PROCEDURE BatchInsertEmployees
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO Employees (EmployeeID, FirstName, Salary) VALUES (100, 'Test1', 1000);
        INSERT INTO Employees (EmployeeID, FirstName, Salary) VALUES (101, 'Test2', 2000);
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        INSERT INTO AuditLog (Action, ErrorMessage) VALUES ('Batch Insert', ERROR_MESSAGE());
    END CATCH
END;

-- Question 6: Dynamic RAISERROR with Severity and State
ALTER PROCEDURE AddEmployee 
    @EmpID INT, @FName VARCHAR(50), @LName VARCHAR(50), @Email VARCHAR(100), @Salary DECIMAL(10,2), @DeptID INT
AS
BEGIN
    IF @Salary < 0
        RAISERROR ('Salary cannot be negative.', 16, 1);
    ELSE IF @Salary < 1000
        RAISERROR ('Warning: Salary is below 1000.', 10, 1);
        
    -- Insert logic
END;\n