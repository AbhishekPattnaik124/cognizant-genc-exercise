
-- Exercise 1: Ranking and Window Functions
SELECT 
    ProductID, Category, Price,
    ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Price DESC) as RowNum,
    RANK() OVER (PARTITION BY Category ORDER BY Price DESC) as Rnk,
    DENSE_RANK() OVER (PARTITION BY Category ORDER BY Price DESC) as DenseRnk
FROM Products;

-- Exercise 2: Aggregation with GROUPING SETS, CUBE, and ROLLUP
SELECT 
    c.Region, p.Category, SUM(od.Quantity) as TotalQuantity
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

SELECT 
    c.Region, p.Category, SUM(od.Quantity) as TotalQuantity
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY ROLLUP (c.Region, p.Category);

SELECT 
    c.Region, p.Category, SUM(od.Quantity) as TotalQuantity
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY CUBE (c.Region, p.Category);

-- Exercise 3: CTEs and MERGE
WITH RecursiveDateCTE AS (
    SELECT CAST('2025-01-01' AS DATE) as DateValue
    UNION ALL
    SELECT DATEADD(day, 1, DateValue)
    FROM RecursiveDateCTE
    WHERE DateValue < '2025-01-31'
)
SELECT * FROM RecursiveDateCTE;

MERGE Products AS Target
USING StagingProducts AS Source
ON Target.ProductID = Source.ProductID
WHEN MATCHED THEN
    UPDATE SET Target.Price = Source.Price
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ProductID, ProductName, Category, Price)
    VALUES (Source.ProductID, Source.ProductName, Source.Category, Source.Price);

-- Exercise 4: PIVOT and UNPIVOT
-- Pivot
SELECT ProductID, [1] AS Jan, [2] AS Feb, [3] AS Mar
FROM (
    SELECT ProductID, MONTH(OrderDate) as OrderMonth, Quantity
    FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
) AS SourceTable
PIVOT (
    SUM(Quantity) FOR OrderMonth IN ([1], [2], [3])
) AS PivotTable;

-- Unpivot
SELECT ProductID, OrderMonth, Quantity
FROM PivotTable
UNPIVOT (
    Quantity FOR OrderMonth IN (Jan, Feb, Mar)
) AS UnpivotTable;

-- Exercise 5: Using CTE to Simplify a Query
WITH CustomerOrderCounts AS (
    SELECT 
        o.CustomerID,
        COUNT(o.OrderID) AS OrderCount
    FROM Orders o
    GROUP BY o.CustomerID
)
SELECT 
    c.CustomerID,
    c.Name,
    coc.OrderCount
FROM CustomerOrderCounts coc
JOIN Customers c ON c.CustomerID = coc.CustomerID
WHERE coc.OrderCount > 3;
