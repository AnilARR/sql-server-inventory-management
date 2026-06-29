USE InventoryManagementDB;
GO

CREATE VIEW vw_CurrentInventory
AS
SELECT
p.ProductID,
p.ProductName,
p.SKU,
c.CategoryName,
w.WarehouseName,
i.QuantityInStock,
p.UnitPrice,
(i.QuantityInStock * p.UnitPrice) AS InventoryValue,
i.LastUpdated
FROM Inventory i
INNER JOIN Products p
ON i.ProductID = p.ProductID
INNER JOIN Categories c
ON p.CategoryID = c.CategoryID
INNER JOIN Warehouses w
ON i.WarehouseID = w.WarehouseID;
GO
