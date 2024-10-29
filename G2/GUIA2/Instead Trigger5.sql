

CREATE TRIGGER trg_PreventOldPriceUpdate
ON Tarifa
INSTEAD OF UPDATE
AS
BEGIN
    -- Verificar si alguna tarifa que se intenta actualizar tiene más de 30 días
    IF EXISTS (
        SELECT 1
        FROM Tarifa AS t
        JOIN inserted AS i ON t.idTarifa = i.idTarifa
        WHERE DATEDIFF(DAY, t.fechaCreacion, GETDATE()) > 30
    )
    BEGIN
        -- Si se encuentra una tarifa con más de 30 días, impedir la actualización
        RAISERROR ('No se permite actualizar tarifas con más de 30 días de antigüedad.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        -- Si todas las tarifas tienen menos de 30 días, permitir la actualización
        UPDATE Tarifa
        SET tipoTarifa = i.tipoTarifa,
            idTipoEquipaje = i.idTipoEquipaje
        FROM Tarifa AS t
        JOIN inserted AS i ON t.idTarifa = i.idTarifa;
    END
END;

UPDATE Tarifa
SET tipoTarifa = 'Económica Premium'
WHERE idTarifa = 1;


select * from Tarifa;
