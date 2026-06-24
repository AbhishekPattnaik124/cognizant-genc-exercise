-- Exercise 1: Ranking and Window Functions
SELECT 
    ProductID,
    ProductName,
    Category,
    Price,
    ROW_NUMBER() OVER(PARTITION BY Category ORDER BY Price DESC) as RowNum,
    RANK() OVER(PARTITION BY Category ORDER BY Price DESC) as RankVal,
    DENSE_RANK() OVER(PARTITION BY Category ORDER BY Price DESC) as DenseRankVal
FROM Products;

-- Exercise 2: Aggregation with GROUPING SETS, CUBE, and ROLLUP
SELECT 
    c.Region,
    p.Category,
    SUM(od.Quantity) as TotalQuantity
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY GROUPING SETS (
    (c.Region, p.Category),
    (c.Region),
    (p.Category),
    ()
);

-- ROLLUP
SELECT 
    c.Region,
    p.Category,
    SUM(od.Quantity) as TotalQuantity
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY ROLLUP (c.Region, p.Category);

-- CUBE
SELECT 
    c.Region,
    p.Category,
    SUM(od.Quantity) as TotalQuantity
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY CUBE (c.Region, p.Category);

-- Exercise 3: CTEs and MERGE
WITH RecursiveCalendar AS (
    SELECT CAST('2025-01-01' AS DATE) as CalDate
    UNION ALL
    SELECT DATEADD(day, 1, CalDate)
    FROM RecursiveCalendar
    WHERE CalDate < '2025-01-31'
)
SELECT * FROM RecursiveCalendar;

-- MERGE example
CREATE TABLE StagingProducts (ProductID INT, Price DECIMAL(10,2));
INSERT INTO StagingProducts VALUES (1, 1300.00), (5, 200.00);

MERGE Products AS Target
USING StagingProducts AS Source
ON Target.ProductID = Source.ProductID
WHEN MATCHED THEN
    UPDATE SET Target.Price = Source.Price
WHEN NOT MATCHED BY Target THEN
    INSERT (ProductID, Price) VALUES (Source.ProductID, Source.Price);

-- Exercise 4: PIVOT and UNPIVOT
-- Pivot Example
SELECT * FROM (
    SELECT p.ProductName, DATENAME(month, o.OrderDate) as OrderMonth, od.Quantity
    FROM Orders o
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
) AS SourceTable
PIVOT (
    SUM(Quantity)
    FOR OrderMonth IN ([January], [February], [March], [April])
) AS PivotTable;

-- Exercise 5: Using CTE to Simplify a Query
WITH CustomerOrderCounts AS (
    SELECT CustomerID, COUNT(OrderID) AS OrderCount
    FROM Orders
    GROUP BY CustomerID
)
SELECT c.CustomerID, c.Name, coc.OrderCount
FROM CustomerOrderCounts coc
JOIN Customers c ON c.CustomerID = coc.CustomerID
WHERE coc.OrderCount > 3;\n