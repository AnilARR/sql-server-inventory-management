USE InventoryManagementDB;
GO

CREATE FUNCTION fn_CalculateStockValue
(
@ProductID INT
)
RETURNS DECIMAL(18,2)
AS
BEGIN


DECLARE @StockValue DECIMAL(18,2);

SELECT
    @StockValue =
        SUM(i.QuantityInStock) * p.CostPrice
FROM Products p
INNER JOIN Inventory i
    ON p.ProductID = i.ProductID
WHERE p.ProductID = @ProductID
GROUP BY p.CostPrice;

RETURN ISNULL(@StockValue,0);


END;
GO
