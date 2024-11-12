-- Informaci�n de pagos y m�todo de pago
CREATE VIEW PagosConMetodo AS
SELECT P.idPago, P.TotalPago, P.EstadoPago, MP.Metodo
FROM Pago P
LEFT JOIN MetodoPago MP ON P.idMetodoPago = MP.idMetodoPago;