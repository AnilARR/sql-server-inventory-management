-- ==========================================
-- SQL Server Enterprise Inventory Management
-- indexes.sql
-- ==========================================

USE InventoryManagementDB;
GO

-- ==========================================
-- Products
-- ==========================================

CREATE NONCLUSTERED INDEX IX_Products_SKU
ON Products(SKU);

CREATE NONCLUSTERED INDEX IX_Products_CategoryID
ON Products(CategoryID);

CREATE NONCLUSTERED INDEX IX_Products_SupplierID
ON Products(SupplierID);

-- ==========================================
-- Inventory
-- ==========================================

CREATE NONCLUSTERED INDEX IX_Inventory_ProductID
ON Inventory(ProductID);

CREATE NONCLUSTERED INDEX IX_Inventory_WarehouseID
ON Inventory(WarehouseID);

CREATE NONCLUSTERED INDEX IX_Inventory_ProductWarehouse
ON Inventory(ProductID, WarehouseID);

-- ==========================================
-- Customers
-- ==========================================

CREATE NONCLUSTERED INDEX IX_Customers_Email
ON Customers(Email);

-- ==========================================
-- Suppliers
-- ==========================================

CREATE NONCLUSTERED INDEX IX_Suppliers_Email
ON Suppliers(Email);

CREATE NONCLUSTERED INDEX IX_Suppliers_CompanyName
ON Suppliers(CompanyName);

-- ==========================================
-- Purchase Orders
-- ==========================================

CREATE NONCLUSTERED INDEX IX_PurchaseOrders_SupplierID
ON PurchaseOrders(SupplierID);

CREATE NONCLUSTERED INDEX IX_PurchaseOrders_OrderDate
ON PurchaseOrders(OrderDate);

CREATE NONCLUSTERED INDEX IX_PurchaseOrders_Status
ON PurchaseOrders(Status);

-- ==========================================
-- Purchase Order Items
-- ==========================================

CREATE NONCLUSTERED INDEX IX_POItems_POID
ON PurchaseOrderItems(PurchaseOrderID);

CREATE NONCLUSTERED INDEX IX_POItems_ProductID
ON PurchaseOrderItems(ProductID);

-- ==========================================
-- Sales Orders
-- ==========================================

CREATE NONCLUSTERED INDEX IX_SalesOrders_CustomerID
ON SalesOrders(CustomerID);

CREATE NONCLUSTERED INDEX IX_SalesOrders_OrderDate
ON SalesOrders(OrderDate);

CREATE NONCLUSTERED INDEX IX_SalesOrders_Status
ON SalesOrders(Status);

-- ==========================================
-- Sales Order Items
-- ==========================================

CREATE NONCLUSTERED INDEX IX_SOItems_OrderID
ON SalesOrderItems(SalesOrderID);

CREATE NONCLUSTERED INDEX IX_SOItems_ProductID
ON SalesOrderItems(ProductID);

-- ==========================================
-- Inventory Transactions
-- ==========================================

CREATE NONCLUSTERED INDEX IX_InventoryTransactions_ProductID
ON InventoryTransactions(ProductID);

CREATE NONCLUSTERED INDEX IX_InventoryTransactions_WarehouseID
ON InventoryTransactions(WarehouseID);

CREATE NONCLUSTERED INDEX IX_InventoryTransactions_Date
ON InventoryTransactions(TransactionDate);

CREATE NONCLUSTERED INDEX IX_InventoryTransactions_Type
ON InventoryTransactions(TransactionType);

-- ==========================================
-- Audit Logs
-- ==========================================

CREATE NONCLUSTERED INDEX IX_AuditLogs_TableName
ON AuditLogs(TableName);

CREATE NONCLUSTERED INDEX IX_AuditLogs_ActionType
ON AuditLogs(ActionType);

CREATE NONCLUSTERED INDEX IX_AuditLogs_ChangeDate
ON AuditLogs(ChangeDate);

GO
