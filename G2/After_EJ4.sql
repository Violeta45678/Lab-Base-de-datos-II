
-- Creacion  dde tabla Auditoria
CREATE TABLE AuditoriaPasajero (
    IdAuditoria INT PRIMARY KEY IDENTITY(1,1),
    IdPasajero INT NOT NULL,
    nombre VARCHAR(45) NULL,
    apellidos VARCHAR(45) NULL,
    DUI CHAR(10) NULL,
    pasaporte VARCHAR(45) NULL,
    genero CHAR(2) NULL,
    celular INT NULL,
    idDireccion INT NULL,
    numPasajeroFrecuente INT NULL,
    FechaUltimaVisita DATE NULL,
    FechaModificacion DATETIME NOT NULL
);


go
--AFTER - EJ 4 -  MILTON CUADRA 
CREATE TRIGGER trg_AuditoriaPasajero
ON dbo.Pasajero
AFTER UPDATE
AS
BEGIN
    INSERT INTO AuditoriaPasajero (
        IdPasajero,
        nombre,
        apellidos,
        DUI,
        pasaporte,
        genero,
        celular,
        idDireccion,
        numPasajeroFrecuente,
        FechaUltimaVisita,
        FechaModificacion
    )
    SELECT 
        i.IdPasajero,
        CASE WHEN d.nombre <> i.nombre THEN i.nombre ELSE NULL END,
        CASE WHEN d.apellidos <> i.apellidos THEN i.apellidos ELSE NULL END,
        CASE WHEN d.DUI <> i.DUI THEN i.DUI ELSE NULL END,
        CASE WHEN d.pasaporte <> i.pasaporte THEN i.pasaporte ELSE NULL END,
        CASE WHEN d.genero <> i.genero THEN i.genero ELSE NULL END,
        CASE WHEN d.celular <> i.celular THEN i.celular ELSE NULL END,
        CASE WHEN d.idDireccion <> i.idDireccion THEN i.idDireccion ELSE NULL END,
        CASE WHEN d.numPasajeroFrecuente <> i.numPasajeroFrecuente THEN i.numPasajeroFrecuente ELSE NULL END,
        CASE WHEN d.FechaUltimaVisita <> i.FechaUltimaVisita THEN i.FechaUltimaVisita ELSE NULL END,
        GETDATE()
    FROM 
        inserted i
    INNER JOIN 
        deleted d ON i.IdPasajero = d.IdPasajero
    WHERE 
        d.nombre <> i.nombre OR
        d.apellidos <> i.apellidos OR
        d.DUI <> i.DUI OR
        d.pasaporte <> i.pasaporte OR
        d.genero <> i.genero OR
        d.celular <> i.celular OR
        d.idDireccion <> i.idDireccion OR
        d.numPasajeroFrecuente <> i.numPasajeroFrecuente OR
        d.FechaUltimaVisita <> i.FechaUltimaVisita;
END;
