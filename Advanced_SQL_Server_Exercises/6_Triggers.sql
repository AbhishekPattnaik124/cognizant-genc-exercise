
-- Exercise 1: Create an After Trigger
CREATE TABLE EmployeeChanges (
    LogID INT IDENTITY(1,1),
    EmployeeID INT,
    OldSalary DECIMAL(10,2),
    NewSalary DECIMAL(10,2),
    ChangeDate DATETIME DEFAULT GETDATE()
);
GO

CREATE TRIGGER trg_AfterSalaryUpdate
ON Employees
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Salary)
    BEGIN
        INSERT INTO EmployeeChanges (EmployeeID, OldSalary, NewSalary)
        SELECT i.EmployeeID, d.Salary, i.Salary
        FROM inserted i
        JOIN deleted d ON i.EmployeeID = d.EmployeeID;
    END
END;
GO

-- Exercise 2: Create an Instead of Trigger
CREATE TRIGGER trg_InsteadOfDelete
ON Employees
INSTEAD OF DELETE
AS
BEGIN
    RAISERROR('Deletions are not allowed on the Employees table.', 16, 1);
END;
GO

-- Exercise 3: Create a Logon Trigger
CREATE TRIGGER trg_LogonMaintenance
ON ALL SERVER
FOR LOGON
AS
BEGIN
    IF (DATEPART(HOUR, GETDATE()) BETWEEN 2 AND 3)
    BEGIN
        ROLLBACK;
    END
END;
GO

-- Exercise 6: Create a Trigger to Update a Computed Column
ALTER TABLE Employees ADD AnnualSalary DECIMAL(10,2);
GO
CREATE TRIGGER trg_UpdateAnnualSalary
ON Employees
AFTER INSERT, UPDATE
AS
BEGIN
    IF UPDATE(Salary)
    BEGIN
        UPDATE Employees
        SET AnnualSalary = Salary * 12
        WHERE EmployeeID IN (SELECT EmployeeID FROM inserted);
    END
END;
GO
