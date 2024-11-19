CREATE TRIGGER trg_ValidateEquipajePeso
ON Equipaje
FOR INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM INSERTED i
        JOIN TipoEquipaje te ON i.idTipoEquipaje = te.idTipoEquipaje
        WHERE i.peso > te.pesoMax
    )
    BEGIN
        RAISERROR('El peso del equipaje excede el máximo permitido.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
