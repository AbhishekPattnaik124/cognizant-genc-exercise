-- Exercise 1: Create a Cursor
DECLARE @EmpID INT;
DECLARE @FirstName VARCHAR(50);

DECLARE empCursor CURSOR FOR
SELECT EmployeeID, FirstName FROM Employees;

OPEN empCursor;

FETCH NEXT FROM empCursor INTO @EmpID, @FirstName;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Employee: ' + CAST(@EmpID AS VARCHAR) + ' - ' + @FirstName;
    FETCH NEXT FROM empCursor INTO @EmpID, @FirstName;
END;

CLOSE empCursor;
DEALLOCATE empCursor;

-- Exercise 2: Types of Cursors
-- Static Cursor
DECLARE staticCursor CURSOR STATIC FOR SELECT EmployeeID FROM Employees;
-- Dynamic Cursor
DECLARE dynamicCursor CURSOR DYNAMIC FOR SELECT EmployeeID FROM Employees;
-- Forward-Only Cursor
DECLARE forwardCursor CURSOR FORWARD_ONLY FOR SELECT EmployeeID FROM Employees;
-- Keyset-Driven Cursor
DECLARE keysetCursor CURSOR KEYSET FOR SELECT EmployeeID FROM Employees;

-- (Closing and Deallocating normally follows)\n