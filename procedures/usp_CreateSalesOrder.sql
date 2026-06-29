USE InventoryManagementDB;
GO

CREATE PROCEDURE usp_CreateSalesOrder
(
@CustomerID INT,
@TotalAmount DECIMAL(18,2)
)
AS
BEGIN


SET NOCOUNT ON;

INSERT INTO SalesOrders
(
    CustomerID,
    OrderDate,
    Status,
    TotalAmount
)
VALUES
(
    @CustomerID,
    GETDATE(),
    'Pending',
    @TotalAmount
);


END;
GO
