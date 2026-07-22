
-- Exercise 1: Creating a Non-Clustered Index
CREATE NONCLUSTERED INDEX IX_Products_ProductName ON Products(ProductName);

-- Exercise 2: Creating a Clustered Index
-- Note: A table can only have one clustered index. Orders already has a PK clustered index.
-- This creates a non-clustered index instead or replaces the clustered index if allowed.
CREATE INDEX IX_Orders_OrderDate ON Orders(OrderDate);

-- Exercise 3: Creating a Composite Index
CREATE INDEX IX_Orders_Customer_Date ON Orders(CustomerID, OrderDate);
