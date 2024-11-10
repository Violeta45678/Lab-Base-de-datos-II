CREATE VIEW Vista_EquipajePorPasajero AS
SELECT Pasajero.nombre, Pasajero.apellidos, Equipaje.peso, TipoEquipaje.TipoEquipaje
FROM Equipaje
INNER JOIN Pasajero ON Equipaje.idPasajero = Pasajero.idPasajero
INNER JOIN TipoEquipaje ON Equipaje.idTipoEquipaje = TipoEquipaje.idTipoEquipaje;


select * from Vista_EquipajePorPasajero;

