-- Modificaciones necesarias

CREATE TABLE Inventario (
    IdInventario INT PRIMARY KEY IDENTITY(1,1),
    TipoAsiento VARCHAR(100) NOT NULL,
    Stock INT NOT NULL,
    FechaUltimaActualizacion DATETIME NOT NULL
);
go
ALTER TABLE Reservacion
ADD IdProducto INT; 
go
ALTER TABLE Reservacion
ADD FOREIGN KEY (IdProducto) REFERENCES Inventario (IdInventario);
go

-- AFTER - EJ 3 -  MILTON CUADRA 

CREATE TRIGGER trg_ActualizarStock
ON Reservacion
AFTER INSERT
AS
BEGIN
    UPDATE Inventario
    SET Stock = Stock - i.IdProducto,
        FechaUltimaActualizacion = GETDATE()
    FROM inserted i
    WHERE Inventario.IdInventario = i.IdProducto;
END;
