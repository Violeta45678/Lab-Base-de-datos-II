CREATE TRIGGER PreventAssignedTicketDeletion
ON Boleto
INSTEAD OF DELETE
AS
BEGIN
    -- Verifica si el boleto está asociado a una reservación
    IF EXISTS (SELECT 1 FROM deleted d JOIN Reservacion r ON d.idReservacion = r.idReservacion)
    BEGIN
        PRINT 'No se puede eliminar el boleto porque ya está asignado a una reservación activa.'
    END
    ELSE
    BEGIN
        -- Permite la eliminación si el boleto no está asignado
        DELETE FROM Boleto WHERE idBoleto IN (SELECT idBoleto FROM deleted)
    END
END;

select * from Boleto;
DELETE FROM Boleto WHERE idBoleto = 1;
