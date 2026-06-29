USE InventoryManagementDB;
GO

CREATE FUNCTION fn_GetProductProfitMargin
(
@ProductID INT
)
RETURNS DECIMAL(18,2)
AS
BEGIN


DECLARE @Margin DECIMAL(18,2);

SELECT
    @Margin =
    ((UnitPrice - CostPrice) / CostPrice) * 100
FROM Products
WHERE ProductID = @ProductID;

RETURN ISNULL(@Margin,0);


END;
GO
