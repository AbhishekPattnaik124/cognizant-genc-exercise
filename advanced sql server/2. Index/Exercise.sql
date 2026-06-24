-- Exercise 1: Creating a Non-Clustered Index
SELECT * FROM Products WHERE ProductName = 'Laptop';

CREATE NONCLUSTERED INDEX IX_Products_ProductName 
ON Products(ProductName);

SELECT * FROM Products WHERE ProductName = 'Laptop';

-- Exercise 2: Creating a Clustered Index
-- Note: Often created by default on Primary Key. Creating on OrderDate:
SELECT * FROM Orders WHERE OrderDate = '2023-01-15';

-- Assume we drop the PK constraint if we really wanted to make this clustered,
-- but typically we'd just create an index. We'll use NONCLUSTERED to avoid PK conflict here.
CREATE NONCLUSTERED INDEX IX_Orders_OrderDate 
ON Orders(OrderDate);

SELECT * FROM Orders WHERE OrderDate = '2023-01-15';

-- Exercise 3: Creating a Composite Index
SELECT * FROM Orders WHERE CustomerID = 1 AND OrderDate = '2023-01-15';

CREATE NONCLUSTERED INDEX IX_Orders_Customer_Date 
ON Orders(CustomerID, OrderDate);

SELECT * FROM Orders WHERE CustomerID = 1 AND OrderDate = '2023-01-15';\n