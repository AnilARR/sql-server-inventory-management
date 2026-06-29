USE InventoryManagementDB;
GO

CREATE PROCEDURE usp_UpdateInventory
(
@ProductID INT,
@WarehouseID INT,
@Quantity INT
)
AS
BEGIN


SET NOCOUNT ON;

UPDATE Inventory
SET
    QuantityInStock = QuantityInStock + @Quantity,
    LastUpdated = GETDATE()
WHERE ProductID = @ProductID
  AND WarehouseID = @WarehouseID;


END;
GO
