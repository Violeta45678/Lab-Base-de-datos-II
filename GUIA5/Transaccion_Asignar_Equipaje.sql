BEGIN TRANSACTION;
DECLARE @idEquipaje INT;

-- Registrar equipaje
INSERT INTO Equipaje (idTipoEquipaje, idPasajero, peso)
VALUES (1, 2, 23.5);
SET @idEquipaje = SCOPE_IDENTITY();

-- Actualizar peso del tipo de equipaje
UPDATE TipoEquipaje
SET pesoMax = pesoMax - 23.5
WHERE idTipoEquipaje = 1;

COMMIT TRANSACTION;
