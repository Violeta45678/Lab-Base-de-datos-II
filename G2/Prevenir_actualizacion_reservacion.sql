
--Instead - Ej 2
CREATE TRIGGER trgPrevenir_actualizacion_reservacion
ON Reservacion
INSTEAD OF UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Reservacion R
        JOIN inserted I ON R.idReservacion = I.idReservacion
        WHERE R.estado IN ('completado', 'cerrado')
    )
    BEGIN
        RAISERROR('No se puede actualizar una reservación que ya ha sido completada o cerrada', 16, 1);
    END
    ELSE
    BEGIN
        UPDATE R
        SET R.estado = I.estado
        FROM Reservacion R
        JOIN inserted I ON R.idReservacion = I.idReservacion;
    END
END;
