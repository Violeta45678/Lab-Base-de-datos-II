CREATE VIEW VuelosOrigenDestino AS
SELECT Vuelo.numeroVuelo, Ao.Nombre AS AeropuertoOrigen, Ad.Nombre AS AeropuertoDestino
FROM Vuelo
INNER JOIN Origen ON Vuelo.idOrigen = Origen.idOrigen
INNER JOIN Aeropuerto Ao ON Origen.idAeropuerto = Ao.idAeropuerto
INNER JOIN Destino ON Vuelo.idDestino = Destino.idDestino
INNER JOIN Aeropuerto Ad ON Destino.idAeropuerto = Ad.idAeropuerto;

select * from VuelosOrigenDestino;

