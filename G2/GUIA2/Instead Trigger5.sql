

CREATE TRIGGER trg_PreventOldPriceUpdate
ON Tarifa
INSTEAD OF UPDATE
AS
BEGIN
    -- Verificar si alguna tarifa que se intenta actualizar tiene m�s de 30 d�as
    IF EXISTS (
        SELECT 1
        FROM Tarifa AS t
        JOIN inserted AS i ON t.idTarifa = i.idTarifa
        WHERE DATEDIFF(DAY, t.fechaCreacion, GETDATE()) > 30
    )
    BEGIN
        -- Si se encuentra una tarifa con m�s de 30 d�as, impedir la actualizaci�n
        RAISERROR ('No se permite actualizar tarifas con m�s de 30 d�as de antig�edad.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        -- Si todas las tarifas tienen menos de 30 d�as, permitir la actualizaci�n
        UPDATE Tarifa
        SET tipoTarifa = i.tipoTarifa,
            idTipoEquipaje = i.idTipoEquipaje
        FROM Tarifa AS t
        JOIN inserted AS i ON t.idTarifa = i.idTarifa;
    END
END;

UPDATE Tarifa
SET tipoTarifa = 'Econ�mica Premium'
WHERE idTarifa = 1;


select * from Tarifa;
