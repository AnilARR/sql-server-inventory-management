-- ==========================================
-- SQL Server Enterprise Inventory Management
-- schema.sql
-- ==========================================

CREATE DATABASE InventoryManagementDB;
GO

USE InventoryManagementDB;
GO

-- ==========================================
-- Roles
-- ==========================================

CREATE TABLE Roles (
RoleID INT IDENTITY(1,1) PRIMARY KEY,
RoleName VARCHAR(50) NOT NULL UNIQUE,
CreatedDate DATETIME DEFAULT GETDATE()
);

-- ==========================================
-- Users
-- ==========================================

CREATE TABLE Users (
UserID INT IDENTITY(1,1) PRIMARY KEY,
Username VARCHAR(50) NOT NULL UNIQUE,
Email VARCHAR(100) NOT NULL UNIQUE,
PasswordHash VARCHAR(255) NOT NULL,
RoleID INT NOT NULL,
IsActive BIT DEFAULT 1,
CreatedDate DATETIME DEFAULT GETDATE(),

```
CONSTRAINT FK_Users_Roles
    FOREIGN KEY(RoleID)
    REFERENCES Roles(RoleID)
```

);

-- ==========================================
-- Categories
-- ==========================================

CREATE TABLE Categories (
CategoryID INT IDENTITY(1,1) PRIMARY KEY,
CategoryName VARCHAR(100) NOT NULL,
Description VARCHAR(255),
CreatedDate DATETIME DEFAULT GETDATE()
);

-- ==========================================
-- Suppliers
-- ==========================================

CREATE TABLE Suppliers (
SupplierID INT IDENTITY(1,1) PRIMARY KEY,
CompanyName VARCHAR(150) NOT NULL,
ContactPerson VARCHAR(100),
Email VARCHAR(100),
Phone VARCHAR(20),
AddressLine VARCHAR(255),
City VARCHAR(100),
Country VARCHAR(100),
CreatedDate DATETIME DEFAULT GETDATE()
);

-- ==========================================
-- Customers
-- ==========================================

CREATE TABLE Customers (
CustomerID INT IDENTITY(1,1) PRIMARY KEY,
FirstName VARCHAR(100),
LastName VARCHAR(100),
Email VARCHAR(100),
Phone VARCHAR(20),
AddressLine VARCHAR(255),
City VARCHAR(100),
Country VARCHAR(100),
CreatedDate DATETIME DEFAULT GETDATE()
);

-- ==========================================
-- Warehouses
-- ==========================================

CREATE TABLE Warehouses (
WarehouseID INT IDENTITY(1,1) PRIMARY KEY,
WarehouseName VARCHAR(100) NOT NULL,
Location VARCHAR(255),
ManagerName VARCHAR(100),
CreatedDate DATETIME DEFAULT GETDATE()
);

-- ==========================================
-- Products
-- ==========================================

CREATE TABLE Products (
ProductID INT IDENTITY(1,1) PRIMARY KEY,
ProductName VARCHAR(150) NOT NULL,
SKU VARCHAR(50) NOT NULL UNIQUE,
CategoryID INT NOT NULL,
SupplierID INT NOT NULL,
UnitPrice DECIMAL(18,2) NOT NULL,
CostPrice DECIMAL(18,2) NOT NULL,
ReorderLevel INT DEFAULT 10,
IsActive BIT DEFAULT 1,
CreatedDate DATETIME DEFAULT GETDATE(),

```
CONSTRAINT FK_Products_Categories
    FOREIGN KEY(CategoryID)
    REFERENCES Categories(CategoryID),

CONSTRAINT FK_Products_Suppliers
    FOREIGN KEY(SupplierID)
    REFERENCES Suppliers(SupplierID)
```

);

-- ==========================================
-- Inventory
-- ==========================================

CREATE TABLE Inventory (
InventoryID INT IDENTITY(1,1) PRIMARY KEY,
ProductID INT NOT NULL,
WarehouseID INT NOT NULL,
QuantityInStock INT DEFAULT 0,
LastUpdated DATETIME DEFAULT GETDATE(),

```
CONSTRAINT FK_Inventory_Product
    FOREIGN KEY(ProductID)
    REFERENCES Products(ProductID),

CONSTRAINT FK_Inventory_Warehouse
    FOREIGN KEY(WarehouseID)
    REFERENCES Warehouses(WarehouseID)
```

);

-- ==========================================
-- Purchase Orders
-- ==========================================

CREATE TABLE PurchaseOrders (
PurchaseOrderID INT IDENTITY(1,1) PRIMARY KEY,
SupplierID INT NOT NULL,
OrderDate DATETIME DEFAULT GETDATE(),
Status VARCHAR(30) DEFAULT 'Pending',
TotalAmount DECIMAL(18,2) DEFAULT 0,

```
CONSTRAINT FK_PO_Supplier
    FOREIGN KEY(SupplierID)
    REFERENCES Suppliers(SupplierID)
```

);

-- ==========================================
-- Purchase Order Items
-- ==========================================

CREATE TABLE PurchaseOrderItems (
PurchaseOrderItemID INT IDENTITY(1,1) PRIMARY KEY,
PurchaseOrderID INT NOT NULL,
ProductID INT NOT NULL,
Quantity INT NOT NULL,
UnitCost DECIMAL(18,2) NOT NULL,

```
CONSTRAINT FK_POI_PO
    FOREIGN KEY(PurchaseOrderID)
    REFERENCES PurchaseOrders(PurchaseOrderID),

CONSTRAINT FK_POI_Product
    FOREIGN KEY(ProductID)
    REFERENCES Products(ProductID)
```

);

-- ==========================================
-- Sales Orders
-- ==========================================

CREATE TABLE SalesOrders (
SalesOrderID INT IDENTITY(1,1) PRIMARY KEY,
CustomerID INT NOT NULL,
OrderDate DATETIME DEFAULT GETDATE(),
Status VARCHAR(30) DEFAULT 'Pending',
TotalAmount DECIMAL(18,2) DEFAULT 0,

```
CONSTRAINT FK_SO_Customer
    FOREIGN KEY(CustomerID)
    REFERENCES Customers(CustomerID)
```

);

-- ==========================================
-- Sales Order Items
-- ==========================================

CREATE TABLE SalesOrderItems (
SalesOrderItemID INT IDENTITY(1,1) PRIMARY KEY,
SalesOrderID INT NOT NULL,
ProductID INT NOT NULL,
Quantity INT NOT NULL,
UnitPrice DECIMAL(18,2) NOT NULL,

```
CONSTRAINT FK_SOI_SO
    FOREIGN KEY(SalesOrderID)
    REFERENCES SalesOrders(SalesOrderID),

CONSTRAINT FK_SOI_Product
    FOREIGN KEY(ProductID)
    REFERENCES Products(ProductID)
```

);

-- ==========================================
-- Inventory Transactions
-- ==========================================

CREATE TABLE InventoryTransactions (
TransactionID INT IDENTITY(1,1) PRIMARY KEY,
ProductID INT NOT NULL,
WarehouseID INT NOT NULL,
TransactionType VARCHAR(50) NOT NULL,
Quantity INT NOT NULL,
TransactionDate DATETIME DEFAULT GETDATE(),

```
CONSTRAINT FK_IT_Product
    FOREIGN KEY(ProductID)
    REFERENCES Products(ProductID),

CONSTRAINT FK_IT_Warehouse
    FOREIGN KEY(WarehouseID)
    REFERENCES Warehouses(WarehouseID)
```

);

-- ==========================================
-- Audit Logs
-- ==========================================

CREATE TABLE AuditLogs (
AuditID INT IDENTITY(1,1) PRIMARY KEY,
TableName VARCHAR(100),
ActionType VARCHAR(50),
ChangedBy VARCHAR(100),
ChangeDate DATETIME DEFAULT GETDATE()
);
GO
