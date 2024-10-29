Create Database Aerolinea;

use Aerolinea;

CREATE TABLE Origen (
	idOrigen INT PRIMARY KEY IDENTITY,
    idAeropuerto INT NOT NULL
);

CREATE TABLE Destino (
	idDestino INT PRIMARY KEY IDENTITY,
    idAeropuerto INT NOT NULL
);

CREATE TABLE Escala (
	idEscala INT PRIMARY KEY IDENTITY,
    idAeropuerto INT NOT NULL
);

CREATE TABLE Regreso (
	idRegreso INT PRIMARY KEY,
    idOrigen INT NOT NULL,
    idEscala INT NOT NULL,
    idDestino INT NOT NULL,
    idFecha INT NOT NULL
);

CREATE TABLE Salida (
	idSalida INT PRIMARY KEY IDENTITY,
    idOrigen INT NOT NULL,
    idEscala INT NOT NULL,
    idDestino INT NOT NULL,
    idFecha INT NOT NULL
);

CREATE TABLE Fecha (
	idFecha INT PRIMARY KEY IDENTITY,
    fecha DATE NOT NULL
);

CREATE TABLE Reservacion (
	idReservacion INT PRIMARY KEY IDENTITY,
    estado VARCHAR(25) NOT NULL,
    idPago INT NOT NULL
);

CREATE TABLE Boleto (
	idBoleto INT PRIMARY KEY IDENTITY,
    idPasajero INT NOT NULL,
    idReservacion INT NOT NULL,
    idVuelo INT NOT NULL,
    idAsiento INT NOT NULL,
    idSalida INT NOT NULL,
    idTarifa INT NOT NULL
);

CREATE TABLE Asiento (
	idAsiento INT PRIMARY KEY IDENTITY,
    Columna CHAR(2) NOT NULL,
    Numero CHAR(5) NOT NULL,
    idClases INT NOT NULL
);

CREATE TABLE Pago (
	idPago INT PRIMARY KEY IDENTITY,
    idMetodoPago INT NOT NULL,
    EstadoPago VARCHAR(25),
    TotalPago FLOAT NOT NULL
);

CREATE TABLE Tarifa (
	idTarifa INT PRIMARY KEY IDENTITY,
    tipoTarifa VARCHAR(25),
    idTipoEquipaje INT NOT NULL
);

CREATE TABLE MetodoPago (
	idMetodoPago INT PRIMARY KEY IDENTITY,
    Metodo VARCHAR(25),
    idMillas INT NOT NULL
);

CREATE TABLE Itinerario (
	idItinerario INT PRIMARY KEY IDENTITY,
    idSalida INT NOT NULL,
    idRegreso INT NOT NULL
);

CREATE TABLE Millas (
	idMillas INT PRIMARY KEY IDENTITY,
    Millas INT NOT NULL
);

CREATE TABLE Aeropuerto (
	idAeropuerto INT PRIMARY KEY IDENTITY,
    codigoAeropuerto CHAR(3),
    Nombre VARCHAR(100),
    idDireccion INT NOT NULL
);

-- Tablas de Direcciones
CREATE TABLE Pais (
	idPais CHAR(2) PRIMARY KEY,
    pais VARCHAR(25) NOT NULL
);

CREATE TABLE Estado (
	idEstado CHAR(2) PRIMARY KEY,
    estado VARCHAR(25) NOT NULL,
    idPais CHAR(2) NOT NULL
);

CREATE TABLE Ciudad (
	idCiudad CHAR(3) PRIMARY KEY,
    ciudad VARCHAR(50) NOT NULL,
    idEstado CHAR(2) NOT NULL
);

CREATE TABLE Direcciones (
    idDireccion INT PRIMARY KEY IDENTITY,
    linea1 VARCHAR(100) NOT NULL,
    linea2 VARCHAR(50),
    idCiudad CHAR(3) NOT NULL, -- Ajustado a CHAR(3) para coincidir con Ciudad.idCiudad
    codigoPostal VARCHAR(7)
);


CREATE TABLE Visa (
	idVisa INT PRIMARY KEY IDENTITY,
    numVisa VARCHAR(15) NOT NULL,
    tipo VARCHAR(15) NOT NULL,
    idPais CHAR(2) NOT NULL
);

CREATE TABLE Sobrecargo (
	idSobrecargo INT PRIMARY KEY IDENTITY,
    licencia INT NOT NULL,
    tipo VARCHAR(15) NOT NULL,
    idEmpleado INT NOT NULL
);

CREATE TABLE Piloto (
	idPiloto INT PRIMARY KEY IDENTITY,
    licencia INT NOT NULL,
    tipo VARCHAR(15) NOT NULL,
    idEmpleado INT NOT NULL
);

CREATE TABLE Pasajero (
	idPasajero INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(45) NOT NULL,
    apellidos VARCHAR(45) NOT NULL,
    DUI CHAR(10) NOT NULL,
    pasaporte VARCHAR(45) NOT NULL,
    genero CHAR(2) NOT NULL,
    celular INT NOT NULL,
    idDireccion INT NOT NULL,
    numPasajeroFrecuente INT
);

CREATE TABLE Cargo (
	idCargo INT PRIMARY KEY IDENTITY,
    cargo VARCHAR(45) NOT NULL
);

CREATE TABLE Empleado (
	idEmpleado INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(45) NOT NULL,
    apellidos VARCHAR(45) NOT NULL,
    DUI CHAR(10) NOT NULL,
    idDireccion INT NOT NULL,
    pasaporte VARCHAR(45) NOT NULL,
    idVisa INT NOT NULL,
    genero CHAR(2) NOT NULL,
    celular INT NOT NULL,
    idCargo INT NOT NULL,
    fechaNacimiento DATE NOT NULL
);
CREATE TABLE Clases (
	idClases INT PRIMARY KEY IDENTITY,
    clase VARCHAR(45) NOT NULL
);

CREATE TABLE Aeronave (
	idAeronave INT PRIMARY KEY IDENTITY,
    Modelo VARCHAR(25) NOT NULL,
    envergadura FLOAT,
    capacidad INT NOT NULL,
    marca VARCHAR(25) NOT NULL,
    idClases INT NOT NULL
);

CREATE TABLE TipoEquipaje (
	idTipoEquipaje INT PRIMARY KEY IDENTITY,
    TipoEquipaje VARCHAR(25) NOT NULL,
    pesoMax FLOAT NOT NULL,
    precio FLOAT NOT NULL
);

CREATE TABLE Equipaje (
	idEquipaje INT PRIMARY KEY IDENTITY,
    idTipoEquipaje INT NOT NULL,
    idPasajero INT NOT NULL,
    peso FLOAT NOT NULL
);

CREATE TABLE Vuelo (
	idVuelo INT PRIMARY KEY IDENTITY,
    idOrigen INT NOT NULL,
    idDestino INT NOT NULL,
    localizador CHAR(5) NOT NULL,
	numeroVuelo CHAR(6) NOT NULL,
	idAeronave INT NOT NULL
);

-- Tablas de Roles
CREATE TABLE Roles (
	idRol INT PRIMARY KEY IDENTITY,
	rol VARCHAR(50) NOT NULL
);

CREATE TABLE Opciones (
	idOpcion INT PRIMARY KEY IDENTITY,
	opcion VARCHAR(50) NOT NULL
);

CREATE TABLE AsignacionRolesOpciones (
	idAsignacion INT PRIMARY KEY IDENTITY,
	idRol INT NOT NULL,
	idOpcion INT NOT NULL
);

CREATE TABLE Usuarios (
	idUsuarios INT PRIMARY KEY IDENTITY,
	usuario VARCHAR(50) NOT NULL,
	contrasenia VARCHAR(50) NOT NULL,
	idRol INT NOT NULL,
	idEmpleado INT NOT NULL
);

CREATE TABLE UsuariosPasajero (
	idUsuariosPasajero INT PRIMARY KEY IDENTITY,
	usuario VARCHAR(50) NOT NULL,
	contrasenia VARCHAR(50) NOT NULL,
	idRol INT NOT NULL,
	idPasajero INT NOT NULL
);

-- Llaves foráneas de Direcciones
ALTER TABLE Estado ADD FOREIGN KEY (idPais) REFERENCES Pais(idPais);
ALTER TABLE Ciudad ADD FOREIGN KEY (idEstado) REFERENCES Estado(idEstado);
ALTER TABLE Direcciones ADD FOREIGN KEY (idCiudad) REFERENCES Ciudad(idCiudad);
ALTER TABLE Visa ADD FOREIGN KEY (idPais) REFERENCES Pais(idPais);
ALTER TABLE Aeropuerto ADD FOREIGN KEY (idDireccion) REFERENCES Direcciones(idDireccion);

-- Llaves foráneas de Empleados
ALTER TABLE Empleado ADD FOREIGN KEY (idCargo) REFERENCES Cargo(idCargo);
ALTER TABLE Empleado ADD FOREIGN KEY (idDireccion) REFERENCES Direcciones(idDireccion);
ALTER TABLE Empleado ADD FOREIGN KEY (idVisa) REFERENCES Visa(idVisa);
ALTER TABLE Piloto ADD FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado);
ALTER TABLE Sobrecargo ADD FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado);

-- Llaves foráneas de Pasajeros
ALTER TABLE Pasajero ADD FOREIGN KEY (idDireccion) REFERENCES Direcciones(idDireccion);

-- Llaves foráneas de Aeronave
ALTER TABLE Aeronave ADD FOREIGN KEY (idClases) REFERENCES Clases(idClases);

-- Llaves foráneas de Equipaje
ALTER TABLE Equipaje ADD FOREIGN KEY (idTipoEquipaje) REFERENCES TipoEquipaje(idTipoEquipaje);
ALTER TABLE Equipaje ADD FOREIGN KEY (idPasajero) REFERENCES Pasajero(idPasajero);

-- Llaves foráneas de Vuelo
ALTER TABLE Vuelo ADD FOREIGN KEY (idOrigen) REFERENCES Origen(idOrigen);
ALTER TABLE Vuelo ADD FOREIGN KEY (idDestino) REFERENCES Destino(idDestino);
ALTER TABLE Vuelo ADD FOREIGN KEY (idAeronave) REFERENCES Aeronave(idAeronave);

ALTER TABLE MetodoPago ADD FOREIGN KEY (idMillas) REFERENCES Millas(idMillas);

ALTER TABLE Itinerario ADD FOREIGN KEY (idSalida) REFERENCES Salida(idSalida);
ALTER TABLE Itinerario ADD FOREIGN KEY (idRegreso) REFERENCES Regreso(idRegreso);

ALTER TABLE Tarifa ADD FOREIGN KEY (idTipoEquipaje) REFERENCES TipoEquipaje(idTipoEquipaje);

ALTER TABLE Pago ADD FOREIGN KEY (idMetodoPago) REFERENCES MetodoPago(idMetodoPago);

ALTER TABLE Reservacion ADD FOREIGN KEY (idPago) REFERENCES Pago(idPago);

ALTER TABLE Boleto ADD FOREIGN KEY (idPasajero) REFERENCES Pasajero(idPasajero);
ALTER TABLE Boleto ADD FOREIGN KEY (idReservacion) REFERENCES Reservacion(idReservacion);
ALTER TABLE Boleto ADD FOREIGN KEY (idVuelo) REFERENCES Vuelo(idVuelo);
ALTER TABLE Boleto ADD FOREIGN KEY (idAsiento) REFERENCES Asiento(idAsiento);
ALTER TABLE Boleto ADD FOREIGN KEY (idSalida) REFERENCES Salida(idSalida);
ALTER TABLE Boleto ADD FOREIGN KEY (idTarifa) REFERENCES Tarifa(idTarifa);

ALTER TABLE Salida ADD FOREIGN KEY (idOrigen) REFERENCES Origen(idOrigen);
ALTER TABLE Salida ADD FOREIGN KEY (idEscala) REFERENCES Escala(idEscala);
ALTER TABLE Salida ADD FOREIGN KEY (idDestino) REFERENCES Destino(idDestino);
ALTER TABLE Salida ADD FOREIGN KEY (idFecha) REFERENCES Fecha(idFecha);

ALTER TABLE Regreso ADD FOREIGN KEY (idOrigen) REFERENCES Origen(idOrigen);
ALTER TABLE Regreso ADD FOREIGN KEY (idEscala) REFERENCES Escala(idEscala);
ALTER TABLE Regreso ADD FOREIGN KEY (idDestino) REFERENCES Destino(idDestino);
ALTER TABLE Regreso ADD FOREIGN KEY (idFecha) REFERENCES Fecha(idFecha);

ALTER TABLE Escala ADD FOREIGN KEY (idAeropuerto) REFERENCES Aeropuerto(idAeropuerto);

ALTER TABLE Destino ADD FOREIGN KEY (idAeropuerto) REFERENCES Aeropuerto(idAeropuerto);

ALTER TABLE Origen ADD FOREIGN KEY (idAeropuerto) REFERENCES Aeropuerto(idAeropuerto);

-- Llaves de Roles y Usuarios
ALTER TABLE AsignacionRolesOpciones ADD FOREIGN KEY (idRol) REFERENCES Roles(idRol);
ALTER TABLE AsignacionRolesOpciones ADD FOREIGN KEY (idOpcion) REFERENCES Opciones(idOpcion);
ALTER TABLE Usuarios ADD FOREIGN KEY (idRol) REFERENCES Roles(idRol);
ALTER TABLE Usuarios ADD FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado);
ALTER TABLE UsuariosPasajero ADD FOREIGN KEY (idRol) REFERENCES Roles(idRol);
ALTER TABLE UsuariosPasajero ADD FOREIGN KEY (idPasajero) REFERENCES Pasajero(idPasajero);
