CREATE TRIGGER trg_ValidarAsiento
ON Boleto
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted i 
               WHERE NOT EXISTS (SELECT 1 FROM Asiento a WHERE a.idAsiento = i.idAsiento))
    BEGIN
        ROLLBACK;
        PRINT 'El asiento especificado no existe.';
    END
END;


INSERT INTO Boleto (idPasajero, idReservacion, idVuelo, idAsiento, idSalida, idTarifa)
VALUES (1, 2, 3, 999, 1, 4); -- Falla .


INSERT INTO Boleto (idPasajero, idReservacion, idVuelo, idAsiento, idSalida, idTarifa)
VALUES (1, 3, 5, 1, 2, 4); --  válido.
