CREATE TRIGGER PreventAssignedTicketDeletion
ON Boleto
INSTEAD OF DELETE
AS
BEGIN
    -- Verifica si el boleto est� asociado a una reservaci�n
    IF EXISTS (SELECT 1 FROM deleted d JOIN Reservacion r ON d.idReservacion = r.idReservacion)
    BEGIN
        PRINT 'No se puede eliminar el boleto porque ya est� asignado a una reservaci�n activa.'
    END
    ELSE
    BEGIN
        -- Permite la eliminaci�n si el boleto no est� asignado
        DELETE FROM Boleto WHERE idBoleto IN (SELECT idBoleto FROM deleted)
    END
END;

select * from Boleto;
DELETE FROM Boleto WHERE idBoleto = 1;
