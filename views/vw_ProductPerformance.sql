USE InventoryManagementDB;
GO

CREATE VIEW vw_ProductPerformance
AS
SELECT
p.ProductID,
p.ProductName,
p.SKU,
SUM(ISNULL(soi.Quantity,0)) AS TotalUnitsSold,
SUM(ISNULL(soi.Quantity * soi.UnitPrice,0)) AS TotalRevenue
FROM Products p
LEFT JOIN SalesOrderItems soi
ON p.ProductID = soi.ProductID
GROUP BY
p.ProductID,
p.ProductName,
p.SKU;
GO
