-- ==========================================
-- SQL Server Enterprise Inventory Management
-- seed-data.sql
-- ==========================================

USE InventoryManagementDB;
GO

-- ==========================================
-- Roles
-- ==========================================

INSERT INTO Roles(RoleName)
VALUES
('Admin'),
('Warehouse Manager'),
('Sales Manager'),
('Procurement Manager');

-- ==========================================
-- Users
-- ==========================================

INSERT INTO Users
(
Username,
Email,
PasswordHash,
RoleID
)
VALUES
('admin','[admin@inventory.com](mailto:admin@inventory.com)','HASH123',1),
('warehouse1','[warehouse@inventory.com](mailto:warehouse@inventory.com)','HASH123',2),
('sales1','[sales@inventory.com](mailto:sales@inventory.com)','HASH123',3),
('procurement1','[procurement@inventory.com](mailto:procurement@inventory.com)','HASH123',4);

-- ==========================================
-- Categories
-- ==========================================

INSERT INTO Categories
(
CategoryName,
Description
)
VALUES
('Electronics','Electronic Devices'),
('Accessories','Computer Accessories'),
('Furniture','Office Furniture'),
('Networking','Network Equipment');

-- ==========================================
-- Suppliers
-- ==========================================

INSERT INTO Suppliers
(
CompanyName,
ContactPerson,
Email,
Phone,
City,
Country
)
VALUES
('TechSource Ltd','Raj Sharma','[contact@techsource.com](mailto:contact@techsource.com)','9876543210','Mumbai','India'),
('Global Electronics','Priya Patel','[sales@globalelectronics.com](mailto:sales@globalelectronics.com)','9876543211','Delhi','India'),
('OfficeMart','Anil Gupta','[orders@officemart.com](mailto:orders@officemart.com)','9876543212','Bangalore','India');

-- ==========================================
-- Warehouses
-- ==========================================

INSERT INTO Warehouses
(
WarehouseName,
Location,
ManagerName
)
VALUES
('Mumbai Warehouse','Mumbai','Rahul Verma'),
('Delhi Warehouse','Delhi','Amit Singh'),
('Bangalore Warehouse','Bangalore','Karan Mehta');

-- ==========================================
-- Customers
-- ==========================================

INSERT INTO Customers
(
FirstName,
LastName,
Email,
Phone,
City,
Country
)
VALUES
('John','Doe','[john@example.com](mailto:john@example.com)','9991111111','Mumbai','India'),
('Sarah','Smith','[sarah@example.com](mailto:sarah@example.com)','9992222222','Delhi','India'),
('Michael','Brown','[michael@example.com](mailto:michael@example.com)','9993333333','Pune','India');

-- ==========================================
-- Products
-- ==========================================

INSERT INTO Products
(
ProductName,
SKU,
CategoryID,
SupplierID,
UnitPrice,
CostPrice,
ReorderLevel
)
VALUES
('Dell Laptop','SKU-1001',1,1,75000,65000,10),
('HP Laptop','SKU-1002',1,1,70000,60000,10),
('Gaming Mouse','SKU-1003',2,2,1500,900,20),
('Mechanical Keyboard','SKU-1004',2,2,3500,2500,15),
('Office Chair','SKU-1005',3,3,8000,5500,5),
('WiFi Router','SKU-1006',4,2,4500,3200,10);

-- ==========================================
-- Inventory
-- ==========================================

INSERT INTO Inventory
(
ProductID,
WarehouseID,
QuantityInStock
)
VALUES
(1,1,100),
(2,1,80),
(3,1,250),
(4,1,120),
(5,1,50),
(6,1,90),

(1,2,60),
(2,2,45),
(3,2,150),
(4,2,70),
(5,2,25),
(6,2,40),

(1,3,40),
(2,3,30),
(3,3,100),
(4,3,50),
(5,3,20),
(6,3,35);

-- ==========================================
-- Purchase Orders
-- ==========================================

INSERT INTO PurchaseOrders
(
SupplierID,
Status,
TotalAmount
)
VALUES
(1,'Completed',250000),
(2,'Completed',120000),
(3,'Pending',50000);

-- ==========================================
-- Purchase Order Items
-- ==========================================

INSERT INTO PurchaseOrderItems
(
PurchaseOrderID,
ProductID,
Quantity,
UnitCost
)
VALUES
(1,1,10,65000),
(1,2,10,60000),
(2,3,100,900),
(2,4,50,2500),
(3,5,20,5500);

-- ==========================================
-- Sales Orders
-- ==========================================

INSERT INTO SalesOrders
(
CustomerID,
Status,
TotalAmount
)
VALUES
(1,'Completed',76500),
(2,'Completed',3500),
(3,'Processing',8000);

-- ==========================================
-- Sales Order Items
-- ==========================================

INSERT INTO SalesOrderItems
(
SalesOrderID,
ProductID,
Quantity,
UnitPrice
)
VALUES
(1,1,1,75000),
(1,3,1,1500),
(2,4,1,3500),
(3,5,1,8000);

-- ==========================================
-- Inventory Transactions
-- ==========================================

INSERT INTO InventoryTransactions
(
ProductID,
WarehouseID,
TransactionType,
Quantity
)
VALUES
(1,1,'Purchase',10),
(1,1,'Sale',1),
(3,1,'Purchase',100),
(3,1,'Sale',5),
(5,1,'Purchase',20),
(5,1,'Sale',2);

GO
