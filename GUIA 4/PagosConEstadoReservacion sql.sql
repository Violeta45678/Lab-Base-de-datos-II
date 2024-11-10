CREATE VIEW PagosConEstadoReservacion AS
SELECT 
    Pago.idPago,
    Pago.totalPago,
    Reservacion.idReservacion,
    Reservacion.estado
FROM 
    Pago
RIGHT JOIN 
    Reservacion ON Pago.idPago = Reservacion.idPago;

	select *from PagosConEstadoReservacion;