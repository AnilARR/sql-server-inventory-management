USE InventoryManagementDB;
GO

CREATE TRIGGER trg_OrderStatusTracking
ON SalesOrders
AFTER UPDATE
AS
BEGIN


SET NOCOUNT ON;

IF UPDATE(Status)
BEGIN

    INSERT INTO AuditLogs
    (
        TableName,
        ActionType,
        ChangedBy,
        ChangeDate
    )
    SELECT
        'SalesOrders',
        'STATUS_CHANGED',
        SYSTEM_USER,
        GETDATE();

END


END;
GO
