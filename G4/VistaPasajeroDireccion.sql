-- Información de pasajeros y su dirección
CREATE VIEW PasajerosConDireccion AS
SELECT P.idPasajero, P.nombre, P.apellidos, D.linea1, D.linea2, C.ciudad, E.estado, Pa.pais
FROM Pasajero P
INNER JOIN Direcciones D ON P.idDireccion = D.idDireccion
INNER JOIN Ciudad C ON D.idCiudad = C.idCiudad
INNER JOIN Estado E ON C.idEstado = E.idEstado
INNER JOIN Pais Pa ON E.idPais = Pa.idPais;
