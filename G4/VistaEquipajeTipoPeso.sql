-- Equipajes con tipo y peso m�ximo permitido
CREATE VIEW EquipajeConTipo AS
SELECT E.idEquipaje, TE.TipoEquipaje, TE.pesoMax, E.peso
FROM Equipaje E
INNER JOIN TipoEquipaje TE ON E.idTipoEquipaje = TE.idTipoEquipaje;
