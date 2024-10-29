
-- Modificaciones necesarias
ALTER TABLE Pasajero
ADD FechaUltimaVisita date;
go
ALTER TABLE Reservacion
ADD idPasajero INT;
go
ALTER TABLE Reservacion
ADD FOREIGN KEY (idPasajero) REFERENCES Pasajero(idPasajero);
go

--AFTER - EJ 2 -  MILTON CUADRA 
CREATE TRIGGER trg_RegistrarFecha
ON dbo.Reservacion
AFTER INSERT
AS
BEGIN

    UPDATE Pasajero
    SET FechaUltimaVisita = GETDATE()
    FROM Pasajero p
    INNER JOIN inserted i ON p.idPasajero = i.idPasajero;
END;
