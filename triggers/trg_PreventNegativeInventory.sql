USE InventoryManagementDB;
GO

CREATE TRIGGER trg_PreventNegativeInventory
ON Inventory
AFTER UPDATE
AS
BEGIN


SET NOCOUNT ON;

IF EXISTS
(
    SELECT 1
    FROM inserted
    WHERE QuantityInStock < 0
)
BEGIN

    RAISERROR
    (
        'Inventory cannot be negative.',
        16,
        1
    );

    ROLLBACK TRANSACTION;

    RETURN;

END


END;
GO
