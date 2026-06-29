USE InventoryManagementDB;
GO

CREATE VIEW vw_InventoryValuation
AS
SELECT
p.ProductID,
p.ProductName,
SUM(i.QuantityInStock) AS TotalStock,
p.CostPrice,
p.UnitPrice,
SUM(i.QuantityInStock) * p.CostPrice AS TotalCostValue,
SUM(i.QuantityInStock) * p.UnitPrice AS TotalSellingValue
FROM Products p
INNER JOIN Inventory i
ON p.ProductID = i.ProductID
GROUP BY
p.ProductID,
p.ProductName,
p.CostPrice,
p.UnitPrice;
GO
