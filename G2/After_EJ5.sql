
-- modificaciones necesarias

CREATE TABLE Factura (
    IdFactura INT PRIMARY KEY IDENTITY(1,1),
    Total DECIMAL(10, 2) NOT NULL
);
go 

ALTER TABLE Pago
ADD idFactura INT;
go

ALTER TABLE Pago
ADD FOREIGN KEY (idFactura) REFERENCES Factura(idFactura);
go

--AFTER - EJ 5 -  MILTON CUADRA 
CREATE TRIGGER trg_ActualizarFactura
ON Pago
AFTER INSERT
AS
BEGIN
    UPDATE Factura
    SET Total = Total + i.TotalPago
    FROM inserted i
    INNER JOIN Factura f ON i.IdFactura = f.IdFactura
END;
