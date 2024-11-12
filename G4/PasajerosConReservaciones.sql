CREATE VIEW PasajerosConReservaciones AS
SELECT 
    Pasajero.idPasajero,
    Pasajero.nombre,
    Pasajero.apellidos,
    Reservacion.idReservacion,
    Reservacion.estado
FROM 
    Pasajero
RIGHT JOIN 
    Boleto ON Pasajero.idPasajero = Boleto.idPasajero
INNER JOIN 
    Reservacion ON Boleto.idReservacion = Reservacion.idReservacion;

	select* from PasajerosConReservaciones;