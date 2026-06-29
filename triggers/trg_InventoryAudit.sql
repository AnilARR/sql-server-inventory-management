USE InventoryManagementDB;
GO

CREATE TRIGGER trg_InventoryAudit
ON Inventory
AFTER INSERT, UPDATE, DELETE
AS
BEGIN


SET NOCOUNT ON;

INSERT INTO AuditLogs
(
    TableName,
    ActionType,
    ChangedBy,
    ChangeDate
)
SELECT
    'Inventory',
    CASE
        WHEN EXISTS (SELECT * FROM inserted)
             AND EXISTS (SELECT * FROM deleted)
            THEN 'UPDATE'

        WHEN EXISTS (SELECT * FROM inserted)
            THEN 'INSERT'

        ELSE 'DELETE'
    END,
    SYSTEM_USER,
    GETDATE();


END;
GO
