USE InventoryManagementDB;
GO

CREATE FUNCTION fn_GetProductAvailability
(
@ProductID INT
)
RETURNS INT
AS
BEGIN


DECLARE @AvailableStock INT;

SELECT
    @AvailableStock =
        SUM(QuantityInStock)
FROM Inventory
WHERE ProductID = @ProductID;

RETURN ISNULL(@AvailableStock,0);


END;
GO
