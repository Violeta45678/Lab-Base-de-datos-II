BEGIN TRANSACTION;
INSERT INTO Vuelo (idOrigen, idDestino, localizador, numeroVuelo, idAeronave)
VALUES (1, 2, 'ABC12', 'AA101', 3);
COMMIT TRANSACTION;


SELECT * FROM Vuelo;