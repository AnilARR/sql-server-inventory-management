USE InventoryManagementDB;
GO

CREATE PROCEDURE usp_CreatePurchaseOrder
(
@SupplierID INT,
@TotalAmount DECIMAL(18,2)
)
AS
BEGIN


SET NOCOUNT ON;

INSERT INTO PurchaseOrders
(
    SupplierID,
    OrderDate,
    Status,
    TotalAmount
)
VALUES
(
    @SupplierID,
    GETDATE(),
    'Pending',
    @TotalAmount
);


END;
GO
