USE InventoryManagementDB;
GO

CREATE VIEW vw_SalesSummary
AS
SELECT
so.SalesOrderID,
so.OrderDate,
so.Status,
c.FirstName + ' ' + c.LastName AS CustomerName,
p.ProductName,
soi.Quantity,
soi.UnitPrice,
(soi.Quantity * soi.UnitPrice) AS LineTotal
FROM SalesOrders so
INNER JOIN Customers c
ON so.CustomerID = c.CustomerID
INNER JOIN SalesOrderItems soi
ON so.SalesOrderID = soi.SalesOrderID
INNER JOIN Products p
ON soi.ProductID = p.ProductID;
GO
