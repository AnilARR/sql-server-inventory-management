USE InventoryManagementDB;
GO

CREATE PROCEDURE usp_GenerateInventoryReport
AS
BEGIN


SET NOCOUNT ON;

SELECT
    p.ProductID,
    p.ProductName,
    p.SKU,
    c.CategoryName,
    SUM(i.QuantityInStock) AS TotalStock,
    p.CostPrice,
    p.UnitPrice,
    SUM(i.QuantityInStock) * p.CostPrice AS InventoryCostValue,
    SUM(i.QuantityInStock) * p.UnitPrice AS InventorySellingValue
FROM Products p
INNER JOIN Categories c
    ON p.CategoryID = c.CategoryID
INNER JOIN Inventory i
    ON p.ProductID = i.ProductID
GROUP BY
    p.ProductID,
    p.ProductName,
    p.SKU,
    c.CategoryName,
    p.CostPrice,
    p.UnitPrice
ORDER BY p.ProductName;


END;
GO
