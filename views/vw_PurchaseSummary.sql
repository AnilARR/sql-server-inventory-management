USE InventoryManagementDB;
GO

CREATE VIEW vw_PurchaseSummary
AS
SELECT
po.PurchaseOrderID,
po.OrderDate,
po.Status,
s.CompanyName,
p.ProductName,
poi.Quantity,
poi.UnitCost,
(poi.Quantity * poi.UnitCost) AS TotalCost
FROM PurchaseOrders po
INNER JOIN Suppliers s
ON po.SupplierID = s.SupplierID
INNER JOIN PurchaseOrderItems poi
ON po.PurchaseOrderID = poi.PurchaseOrderID
INNER JOIN Products p
ON poi.ProductID = p.ProductID;
GO
