-- Exercise 1: Create an After Trigger
CREATE TABLE EmployeeChanges (
    LogID INT IDENTITY(1,1),
    EmployeeID INT,
    OldSalary DECIMAL(10,2),
    NewSalary DECIMAL(10,2),
    ChangeDate DATETIME DEFAULT GETDATE()
);

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

-- Exercise 2: Create an Instead of Trigger
CREATE TRIGGER trg_PreventDelete
ON Employees
INSTEAD OF DELETE
AS
BEGIN
    RAISERROR('Deletion of employee records is not allowed.', 16, 1);
END;

-- Exercise 3: Create a Logon Trigger
-- CREATE TRIGGER trg_RestrictLogon
-- ON ALL SERVER FOR LOGON
-- AS
-- BEGIN
--     IF DATEPART(HOUR, GETDATE()) BETWEEN 2 AND 3
--     BEGIN
--         ROLLBACK;
--     END
-- END;

-- Exercise 4 & 5: Modify / Delete Triggers
-- Modifying via SSMS UI or ALTER TRIGGER ...
-- DROP TRIGGER trg_PreventDelete ON Employees;

-- Exercise 6: Create a Trigger to Update a Computed Column
-- ALTER TABLE Employees ADD AnnualSalary DECIMAL(10,2);

CREATE TRIGGER trg_UpdateAnnualSalary
ON Employees
AFTER INSERT, UPDATE
AS
BEGIN
    IF UPDATE(Salary)
    BEGIN
        UPDATE e
        SET e.AnnualSalary = e.Salary * 12
        FROM Employees e
        JOIN inserted i ON e.EmployeeID = i.EmployeeID;
    END
END;\n