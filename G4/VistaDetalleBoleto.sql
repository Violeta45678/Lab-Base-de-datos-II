
-- Detalles de boletos con información del vuelo y asiento
CREATE VIEW DetallesBoletos AS
SELECT B.idBoleto, B.idVuelo, B.idAsiento, V.localizador, A.Columna, A.Numero
FROM Boleto B
INNER JOIN Vuelo V ON B.idVuelo = V.idVuelo
INNER JOIN Asiento A ON B.idAsiento = A.idAsiento;