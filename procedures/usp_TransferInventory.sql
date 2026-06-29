USE InventoryManagementDB;
GO

CREATE PROCEDURE usp_TransferInventory
(
@ProductID INT,
@FromWarehouseID INT,
@ToWarehouseID INT,
@Quantity INT
)
AS
BEGIN


SET NOCOUNT ON;

BEGIN TRANSACTION;

BEGIN TRY

    UPDATE Inventory
    SET QuantityInStock = QuantityInStock - @Quantity
    WHERE ProductID = @ProductID
      AND WarehouseID = @FromWarehouseID;

    UPDATE Inventory
    SET QuantityInStock = QuantityInStock + @Quantity
    WHERE ProductID = @ProductID
      AND WarehouseID = @ToWarehouseID;

    INSERT INTO InventoryTransactions
    (
        ProductID,
        WarehouseID,
        TransactionType,
        Quantity
    )
    VALUES
    (
        @ProductID,
        @ToWarehouseID,
        'Transfer',
        @Quantity
    );

    COMMIT TRANSACTION;

END TRY

BEGIN CATCH

    ROLLBACK TRANSACTION;

    THROW;

END CATCH


END;
GO
