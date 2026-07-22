
-- Exercise 1: Create a Cursor
DECLARE @EmpID INT, @FName VARCHAR(50), @LName VARCHAR(50);
DECLARE empCursor CURSOR FOR 
SELECT EmployeeID, FirstName, LastName FROM Employees;

OPEN empCursor;
FETCH NEXT FROM empCursor INTO @EmpID, @FName, @LName;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Employee: ' + CAST(@EmpID AS VARCHAR) + ' - ' + @FName + ' ' + @LName;
    FETCH NEXT FROM empCursor INTO @EmpID, @FName, @LName;
END;

CLOSE empCursor;
DEALLOCATE empCursor;
