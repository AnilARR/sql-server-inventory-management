# SQL Server Enterprise Inventory Management System

A production-ready SQL Server database solution designed for inventory, procurement, warehouse operations, sales management, and business reporting.

This project demonstrates enterprise-grade database architecture, normalization, indexing strategies, stored procedures, views, triggers, and performance optimization techniques commonly used in real-world business applications.

---

## Features

### Inventory Management

* Product Catalog
* Category Management
* Multi-Warehouse Inventory
* Stock Tracking
* Inventory Adjustments

### Procurement

* Supplier Management
* Purchase Orders
* Purchase Order Tracking

### Sales

* Customer Management
* Sales Orders
* Sales Reporting

### Reporting

* Inventory Valuation
* Product Performance Analysis
* Sales Summary Reports
* Purchase Summary Reports
* Low Stock Monitoring

### Security & Auditing

* User Roles
* Audit Logging
* Inventory Protection Triggers

---

## Database Architecture

### Core Tables

| Module               | Tables                             |
| -------------------- | ---------------------------------- |
| User Management      | Roles, Users                       |
| Product Management   | Categories, Products               |
| Supplier Management  | Suppliers                          |
| Customer Management  | Customers                          |
| Warehouse Management | Warehouses                         |
| Inventory Management | Inventory                          |
| Procurement          | PurchaseOrders, PurchaseOrderItems |
| Sales                | SalesOrders, SalesOrderItems       |
| Tracking             | InventoryTransactions              |
| Auditing             | AuditLogs                          |

---

## Entity Relationship Diagram

```text
Categories
    │
    ▼
Products ───── Suppliers
    │
    ▼
Inventory ───── Warehouses
    │
    ▼
InventoryTransactions

Customers
    │
    ▼
SalesOrders
    │
    ▼
SalesOrderItems

Suppliers
    │
    ▼
PurchaseOrders
    │
    ▼
PurchaseOrderItems
```

---

## Project Structure

```text
sql-server-enterprise-inventory-management/

database/
├── schema.sql
├── indexes.sql

sample-data/
├── seed-data.sql

views/
├── vw_CurrentInventory.sql
├── vw_LowStockProducts.sql
├── vw_SalesSummary.sql
├── vw_PurchaseSummary.sql
├── vw_ProductPerformance.sql
├── vw_InventoryValuation.sql

functions/
├── fn_CalculateStockValue.sql
├── fn_GetProductAvailability.sql
├── fn_GetProductProfitMargin.sql

procedures/
├── usp_CreateSalesOrder.sql
├── usp_CreatePurchaseOrder.sql
├── usp_UpdateInventory.sql
├── usp_TransferInventory.sql
├── usp_GetLowStockProducts.sql
├── usp_GenerateInventoryReport.sql

triggers/
├── trg_InventoryAudit.sql
├── trg_PreventNegativeInventory.sql
├── trg_OrderStatusTracking.sql
├── trg_ProductAudit.sql
├── trg_InventoryTransactionLog.sql

diagrams/
└── ERD.png
```

---

## Technologies Used

* Microsoft SQL Server
* SQL Server Management Studio (SSMS)
* T-SQL
* Draw.io
* Git
* GitHub

---

## SQL Server Concepts Demonstrated

* Database Design
* Normalization (3NF)
* Primary Keys
* Foreign Keys
* Indexing
* Views
* Functions
* Stored Procedures
* Triggers
* Transactions
* Error Handling
* Query Optimization
* Audit Logging

---

## Sample Business Reports

### Current Inventory

```sql
SELECT * FROM vw_CurrentInventory;
```

### Low Stock Products

```sql
EXEC usp_GetLowStockProducts;
```

### Inventory Valuation

```sql
SELECT * FROM vw_InventoryValuation;
```

### Product Performance

```sql
SELECT * FROM vw_ProductPerformance;
```

---

## Future Enhancements

* Power BI Dashboard
* SQL Server Agent Jobs
* ETL Pipelines
* Data Warehouse Integration
* REST API Integration
* Azure SQL Deployment
* Advanced KPI Reporting

---

## Author

## Author

**Anil Rathod**

Designed and developed by Anil Rathod as a portfolio project to demonstrate enterprise-level SQL Server database design, implementation, optimization, performance tuning, and reporting skills.

### Connect with Me

* GitHub: https://github.com/AnilARR/
* LinkedIn: https://www.linkedin.com/in/anil-rathod-981bb612a/
  

---

⭐ If you found this project useful, consider giving it a star.

