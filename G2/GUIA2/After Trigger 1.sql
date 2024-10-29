CREATE TABLE HistorialPrecios (
    idHistorial INT PRIMARY KEY IDENTITY,
    idTarifa INT NOT NULL,
    precioAnterior FLOAT NOT NULL,
    precioNuevo FLOAT NOT NULL,
    fechaCambio DATETIME NOT NULL DEFAULT GETDATE(),
    usuario VARCHAR(50) 
);
select * from tarifa;

ALTER TABLE Tarifa
ADD precio FLOAT;
UPDATE Tarifa
SET precio = 1500;  


CREATE TRIGGER trg_RegiistrarCambioPrecio
ON Tarifa
AFTER UPDATE
AS
BEGIN
    INSERT INTO HistorialPrecios (idTarifa, precioAnterior, precioNuevo, fechaCambio, usuario)
    SELECT 
        i.idTarifa,
        d.precios,              
        i.precios,             
        GETDATE(),
        SYSTEM_USER           
    FROM inserted AS i
    JOIN deleted AS d ON i.idTarifa = d.idTarifa
    WHERE i.precios <> d.precios;
END;

UPDATE Tarifa
SET precios = 200
WHERE idTarifa = 1;