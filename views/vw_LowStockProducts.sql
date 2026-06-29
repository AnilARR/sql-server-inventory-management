USE InventoryManagementDB;
GO

CREATE VIEW vw_LowStockProducts
AS
SELECT
p.ProductID,
p.ProductName,
p.SKU,
p.ReorderLevel,
SUM(i.QuantityInStock) AS CurrentStock
FROM Products p
INNER JOIN Inventory i
ON p.ProductID = i.ProductID
GROUP BY
p.ProductID,
p.ProductName,
p.SKU,
p.ReorderLevel
HAVING SUM(i.QuantityInStock) <= p.ReorderLevel;
GO
