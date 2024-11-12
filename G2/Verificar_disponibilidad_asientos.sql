--Modificaciones necesarias
ALTER TABLE Asiento ADD idVuelo INT NULL;
ALTER TABLE Asiento ADD FOREIGN KEY (idVuelo) REFERENCES Vuelo(idVuelo);

--Instead - Ej 1
CREATE TRIGGER trgVerificar_disponibilidad_asientos
ON Boleto
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @asientos_disponibles INT;
    DECLARE @idVuelo INT;
    DECLARE @idAsiento INT;

    SELECT @idVuelo = idVuelo, @idAsiento = idAsiento FROM inserted;

    SELECT @asientos_disponibles = COUNT(*) 
    FROM Asiento
    WHERE idVuelo = @idVuelo AND idAsiento NOT IN (
        SELECT idAsiento FROM Boleto WHERE idVuelo = @idVuelo
    );

    IF @asientos_disponibles > 0
    BEGIN
        INSERT INTO Boleto (idPasajero, idReservacion, idVuelo, idAsiento, idSalida, idTarifa)
        SELECT idPasajero, idReservacion, @idVuelo, @idAsiento, idSalida, idTarifa FROM inserted;
    END
    ELSE
    BEGIN
        RAISERROR('No hay asientos disponibles para este vuelo', 16, 1);
    END
END;
