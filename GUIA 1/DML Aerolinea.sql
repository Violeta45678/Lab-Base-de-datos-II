-- Tablas de millas
SET IDENTITY_INSERT millas ON;
insert into millas(idMillas, Millas) values
-- idMillas, Millas
	('1', '10000'),
	('2', '15000'),
	('3', '45000'),
	('4', '17000'),
	('5', '5000');
SET IDENTITY_INSERT millas OFF;
    
-- Tablas de pais
insert into pais(idPais, Pais)
values
	('1','El Salvador'),
    ('2','Estados Unidos'),
    ('3','Colombia'),
    ('4','Argentina'),
    ('5','Canada');

-- Tablas de estado
insert into estado(idEstado, estado, idPais)
values
	('1','Sonsonate','1'),
    ('2','California','2'),
    ('3','Medellin','3'),
    ('4','La Plata','4'),
    ('5','Toronto','5');
    
 -- Tablas de ciudad
insert into ciudad(idCiudad, ciudad, idEstado)
values
	('1','San Salvador','1'),
    ('2','New York','2'),
    ('3','Bogota','3'),
    ('4','Buenos Aires','4'),
    ('5','Toronto','5');
 
-- Tablas de direcciones
insert into direcciones(linea1, idCiudad, codigoPostal)
values
	('Colonia santa lucia casa 5','1','01116'),
    ('30, 150 East 58th St, Planta 30, New York, NY 10155','2','10155'),
    ('Cl. 59 #56 - 63, Bogotá, Colombia','3','110911'),
    ('Zona Rural, B6439 Laguna Alsina, Provincia de Buenos Aires, Argentina','4','6439'),
    ('8605 Nelson Ave, Burnaby, BC V5J 3G2, Canadá','5','7690');

-- Tablas de aeropuerto
SET IDENTITY_INSERT aeropuerto ON;
insert into aeropuerto(idAeropuerto, codigoAeropuerto, Nombre, idDireccion) values
	('1', 'LAX', 'Los Angeles International Airport', '1'),
	('2', 'ONT', 'Ontario International Airport', '2'),
	('3', 'SAL', 'Aeropuerto internacional de El Salvador', '3'),
	('4', 'TYO', 'Tokio International Airport ', '5'),
	('5', 'SDQ', 'Aeropuerto internacional Las Americas', '4');
SET IDENTITY_INSERT aeropuerto OFF;

-- Tablas de fecha
SET IDENTITY_INSERT fecha ON;
insert into fecha (idFecha, fecha) values
-- En MySQL, las fechas deben estar en el formato 'YYYY-MM-DD'
	('1','2024-02-01'),
	('2','2024-02-15'),
	('3','2024-03-11'),
	('4','2024-03-25'),
	('5','2024-04-01');
SET IDENTITY_INSERT fecha OFF;
    
-- Tablas de tipoEquipaje
SET IDENTITY_INSERT tipoequipaje ON;
insert into tipoequipaje (idTipoEquipaje, TipoEquipaje, pesoMax, precio) values
-- idTipoEquipaje, TipoEquipaje, pesoMax (en lbs), precio (en Dolares $)
	('1', 'ObjetoPersonal', '10', '0' ),
	('2', 'MaletaMano', '40', '40'),
	('3', 'MaletaDocumentada', '55', '70'),
	('4', '1erDocumentadaExtra', '55', '100'),
	('5', '2daDocumentadaExtra', '55', '150');
SET IDENTITY_INSERT tipoequipaje OFF;
    
-- Tablas de asiento
SET IDENTITY_INSERT asiento ON;
insert into asiento(idAsiento, Columna, Numero, idClases) values
	('1', 'A', '1', '1'),
	('2', 'B', '12', '1'),
	('3', 'C', '14', '1'),
	('4', 'D', '20', '2'),
	('5', 'E', '24', '2');
SET IDENTITY_INSERT asiento OFF;
    
-- Tablas de metodopago
SET IDENTITY_INSERT metodopago ON;
insert into metodopago(idMetodoPago, Metodo, idMillas) values
	('1', 'Cash', '1'),
	('2', 'DebitCard', '4'),
	('3', 'CreditCard', '5'),
	('4', 'Transfer', '2'),
	('5', 'Millas', '3');
SET IDENTITY_INSERT metodopago OFF;
  
-- Tablas de pago
SET IDENTITY_INSERT pago ON;
insert into pago(idPago, idMetodoPago, EstadoPago, TotalPago) values
	('1', '1', 'Completado', '200.01'),
	('2', '1', 'Completado', '350.46'),
	('3', '3', 'Pendiente', '475.85'),
	('4', '3', 'Completado', '280.20'),
	('5', '2', 'Pendiente', '769.25');
SET IDENTITY_INSERT pago OFF;

-- Tablas de escala
SET IDENTITY_INSERT escala ON;
insert into escala(idEscala, idAeropuerto) values
	('1', '1'),
	('2', '4'),
	('3', '5'),
	('4', '2'),
	('5', '3');
SET IDENTITY_INSERT escala OFF;
    
-- Tablas de origen
SET IDENTITY_INSERT origen ON;
insert into origen(idOrigen, idAeropuerto) values
	('1', '1'),
	('2', '4'),
	('3', '5'),
	('4', '2'),
	('5', '3');
SET IDENTITY_INSERT origen OFF;
    
-- Tablas de clases
insert into clases (clase)
values
	('Primera Clase'),
    ('Ejecutiva'),
    ('Premiun'),
    ('Turista'),
    ('Preferente');
    
-- Tablas de aeronave
SET IDENTITY_INSERT aeronave ON;
insert into aeronave(idAeronave, Modelo, envergadura, capacidad, marca, idClases) values
	('1', 'A320neo', '358', '186', 'Airbus', '1'),
	('2', '737 MAX', '378', '204', 'Boeing', '2'),
	('3', 'C919', '601', ' 168', 'Comac', '2'),
	('4', 'E195-E2', '351', '132', 'Embraer', '2'),
	('5', 'A350 XWB', '648', '440', 'Airbus', '4');
SET IDENTITY_INSERT aeronave OFF;

select * from Aeronave;

-- Tablas de destino
SET IDENTITY_INSERT destino ON;
insert into destino (idDestino,idAeropuerto)
values 
	('1', '4'),
	('2', '3'),
	('3', '2'),
	('4', '5'),
	('5', '1');
SET IDENTITY_INSERT destino OFF;
    
-- Tablas de reservacion
insert into reservacion (estado, idPago)
values
	('Pendiente','1'),
    ('Completado','2'),
    ('Cancelado','3'),
    ('Pendiente','4'),
    ('Cancelado','5');
    
-- Tablas de salida
SET IDENTITY_INSERT salida ON;
insert into salida (idSalida, idOrigen, idEscala, idDestino, idFecha)
values
	('1','1','3','5','1'),
    ('2','2','4','4','2'),
    ('3','3','1','2','3'),
    ('4','4','5','3','4'),
    ('5','5','2','4','5');
SET IDENTITY_INSERT salida OFF;

-- Tablas de regreso
insert into regreso (idRegreso, idOrigen, idEscala, idDestino, idFecha)
values
	('1','1','1','1','1'),
    ('2','2','2','2','2'),
    ('3','3','3','3','3'),
    ('4','4','4','4','4'),
    ('5','5','5','5','5');

-- Tablas de itinerario
SET IDENTITY_INSERT itinerario ON;
insert into itinerario (idItinerario, idSalida, idRegreso)
values
	('1','1','4'),
    ('2','2','5'),
    ('3','4','2'),
    ('4','4','1'),
    ('5','5','3');
SET IDENTITY_INSERT itinerario OFF;
    
-- Tablas de vuelo
SET IDENTITY_INSERT vuelo ON;
insert into vuelo (idVuelo,idOrigen, idDestino, localizador, numeroVuelo, idAeronave)
values
	('1','4','1','IB665','23','1'),
    ('2','1','2','IB123','24','2'),
    ('3','1','3','IB345','22','3'),
    ('4','1','4','IB567','2','4'),
    ('5','1','5','IB890','3','5');
SET IDENTITY_INSERT vuelo OFF;
   
-- Tablas de pasajero
SET IDENTITY_INSERT pasajero ON;
insert into pasajero(idPasajero,nombre, apellidos, DUI, pasaporte, genero, celular, idDireccion, numPasajeroFrecuente)
values
	('1','Roberto', 'Lopez Orellana','00456789-9','B123456789','M','72103456','1','1'),
    ('2','Tatiana', 'Torres Flores','0036589-8','B234556789','F','71459087','2','25'),
    ('3','Isaias', 'Garzona Perez','03057689-8','B567891223','M','71435678','3','35'),
    ('4','Milton', 'Mezquita Barahona','00365678-0','B784556789','M','74459087','4','33'),
    ('5','Samuel', 'Florez Guevara','56776589-8','B098765432','M','74534456','5','6' );
SET IDENTITY_INSERT pasajero OFF;

-- Tablas de tarifa
insert into tarifa(tipoTarifa, idTipoEquipaje)
values
	('XS','1'),
    ('S','2'),
    ('M','3'),
    ('L','4'),
    ('XXL','5');
    
-- Tablas de cargo
SET IDENTITY_INSERT cargo ON;
insert into cargo(idcargo,cargo)
values
	('1','SysAdmin'),
    ('2','Soporte'),
    ('3','Contabilidad'),
    ('4','Inventario'),
    ('5','RRHH'),
    ('6','Ingeniero'),
    ('7','Planificador'),
    ('8','Piloto'),
    ('9','Sobrecargo');
SET IDENTITY_INSERT cargo OFF;

-- Tablas de visa
insert into visa(numVisa, tipo, idPais)
values
	('123456789011111','Trabajo','1'),
    ('123455432122222','Estudiante','2'),
    ('098765432133333','Turismo','3'),
    ('234567890133333','Negocios','4'),
    ('456789012344444','Transito','5');
    
-- Tablas de empleado   
SET IDENTITY_INSERT empleado ON;
insert into empleado(idEmpleado, nombre, apellidos, DUI, idDireccion, pasaporte, idVisa, genero, celular, idCargo, fechaNacimiento)
values
	('1','Gilberto', 'Menendez','06056367-9','1','B123456787','1','M','72290987','1', '1998-06-03'),
	('2','Augusto', 'Ramirez','06056333-9','2','B121156787','1','M','79871234','2', '1994-07-05'),
	('3','Fermin', 'Tarso','06053434-3','4','B121152287','1','M','71231234','3', '1996-08-10'),
	('4','Enzo', 'Martinez','06056367-4','2','B156756787','1','M','76771234','4', '1995-05-19'),
    ('5','Mario', 'Menendez','06786367-9','1','B123456457','1','M','72290987','5', '1993-11-22'),
	('6','jorge', 'Ramirez','06476333-9','2','B121156477','1','M','79871124','6', '1999-02-19'),
    ('7','tono', 'Pereira','02156367-1','3','B123423365','1','M','72292347','7', '1989-07-11'),
	('8','Tana', 'Tarso','06055234-3','4','B121152587','1','M','71231474','8', '1996-01-13'),
	('9','Juan', 'Martinez','06073367-4','2','B156746787','1','M','76743234','9', '1994-09-28'),
    ('10','Dani', 'Huo','06073467-4','2','B146746787','1','M','76583234','6', '1990-12-25'),
    ('11','David', 'Menjivar','0645234-3','4','B12115587','1','M','7676774','8', '1993-04-14'),
    ('12','Frank', 'Cuellar','06052343-3','3','B12115587','1','M','7631474','8', '1997-06-15'),
    ('13','Krav', 'Klokovish','06435234-3','5','B12152587','1','M','7831474','8', '1995-08-20'),
    ('14','Joe','White','0635234-3','3','B121157587','1','M','7867474','8', '1992-07-04');
SET IDENTITY_INSERT empleado OFF;
    
-- Tablas de boleto
SET IDENTITY_INSERT boleto ON;
insert into boleto (idBoleto, idPasajero, idReservacion, idVuelo, idAsiento, idSalida, idTarifa)
values
	('1','2','3','3','1','3','3'),
    ('2','3','4','3','1','1','3'),
    ('3','4','5','2','2','4','3'),
    ('4','5','3','1','5','1','3'),
    ('5','1','4','2','3','2','3');
SET IDENTITY_INSERT boleto OFF;
    
-- Tablas de sobrecargo
SET IDENTITY_INSERT sobrecargo ON;
insert into sobrecargo(idSobrecargo, licencia, tipo, idEmpleado) values
	('1', '0044078', 'A', '9');
SET IDENTITY_INSERT sobrecargo OFF;

-- Tablas de piloto
SET IDENTITY_INSERT piloto ON;
insert into piloto(idPiloto, licencia, tipo, idEmpleado) values
	('2', '7040345', 'A', '11'),
    ('3', '7034534', 'B', '12'),
    ('4', '7043458', 'C', '13'),
    ('5', '7045668', 'A', '14');
SET IDENTITY_INSERT piloto OFF;
	
-- Tablas de equipaje
SET IDENTITY_INSERT equipaje ON;
insert into equipaje(idEquipaje, idTipoEquipaje, idPasajero, Peso) values
	('1', '1', '1', '8.01'),
	('2', '1', '4', '45.64'),
	('3', '3', '3', '50.85'),
	('4', '3', '5', '55.00'),
	('5', '2', '2', '28.50');
SET IDENTITY_INSERT equipaje OFF;
 
insert into roles(rol) values
	('SysAdmin'), -- 1
    ('Soporte'), -- 2
    ('Contabilidad'), -- 3
    ('Inventario'), -- 4
    ('RRHH'), -- 5
    ('Ingeniero'), -- 6
    ('Planificador'), -- 7
    ('Cliente'); -- 8

insert into opciones(opcion) values
('Gestionar Asiento'), -- 1
('Gestionar Boleto'), -- 2
('Gestionar Cargo'), -- 3
('Gestionar Ciudad'), -- 4
('Gestionar Clases'), -- 5
('Gestionar Destino'), -- 6
('Gestionar Direcciones'), -- 7
('Gestionar Empleado'), -- 8
('Gestionar Equipaje'), -- 9
('Gestionar Escala'), -- 10
('Gestionar Estado'), -- 11
('Gestionar Fecha'), -- 12
('Gestionar Itinerario'), -- 13
('Gestionar MetodoPago'), -- 14
('Gestionar Millas'), -- 15
('Gestionar Origen'), -- 16
('Gestionar Pago'), -- 17
('Gestionar Pais'), -- 18
('Gestionar Pasajero'), -- 19
('Gestionar Piloto'), -- 20
('Gestionar Regreso'), -- 21
('Gestionar Reservacion'), -- 22
('Gestionar Salida'), -- 23
('Gestionar Sobrecargo'), -- 24
('Gestionar Tarifa'), -- 25
('Gestionar TipoEquipaje'), -- 26
('Gestionar Visa'), -- 27
('Gestionar Vuelo'), -- 28
('Gestionar asignacionderolesopciones'),-- 29
('Gestionar usuarios'), -- 30
('Gestionar usuariospasajero'), -- 31
('Gestionar roles'), -- 32
('Gestionar opciones'),-- 33
('Gestionar Aeronave'), -- 34
('Gestionar Aeropuerto'); -- 35

insert into asignacionrolesopciones (idRol, idOpcion) values
	-- SysAdmin: Todos los permisos
    ('1','1'), ('1','2'), ('1','3'), ('1','4'), ('1','5'), ('1','6'), 
    ('1','7'), ('1','8'), ('1','9'), ('1','10'), ('1','11'), ('1','12'), 
    ('1','13'), ('1','14'), ('1','15'), ('1','16'), ('1','17'), ('1','18'), 
    ('1','19'), ('1','20'), ('1','21'), ('1','22'), ('1','23'), ('1','24'), 
    ('1','25'), ('1','26'), ('1','27'), ('1','28'), ('1','29'), ('1','30'), 
    ('1','31'), ('1','32'), ('1','33'),('1','34'),('1','35'),

	-- Soporte: 
    ('2','6'), -- Destino
    ('2','1'), -- Asiento
    ('2','11'), -- Estado
    ('2','25'), -- tarifa
    ('2','14'), -- MetodoPago
    ('2','7'), -- Direcciones
    ('2','17'), -- pagos
    ('2','13'), -- itinerario
    ('2','12'), -- fecha
    ('2','23'), -- salida
    ('2','15'), -- millas
    ('2','16'), -- origen
    ('2','28'), -- vuelo
    ('2','26'), -- tipoEquipaje
    ('2','4'), -- ciudad
    ('2','2'), -- boleto
    ('2','22'), -- reservacion
    ('2','19'), -- pasajero
    ('2','27'), -- visa
    ('2','5'), -- clases
    ('2','18'), -- pais
    ('2','31'), -- usuariospasajero
    ('2','30'), -- usuarios
    
    -- Contabilidad: 
    ('3','17'), -- pago
    ('3','25'), -- tarifa
    ('3','15'), -- millas
    ('3','14'), -- metodoPago
    
    -- Inventario: 
    ('4','34'), -- Aeronave
    ('4','9'), -- Equipaje
    
    -- RRHH: 
    ('5','8'), -- Empleado
    ('5','3'), -- Cargo
    ('5','24'), -- Sobrecargo
    ('5','20'), -- Piloto
    ('5','27'), -- Visa
    ('5','7'), -- Direccion
    ('5','11'), -- Estado
    ('5','4'), -- Ciudad
    ('5','18'), -- Pais
    
	-- Ingeniero: 
    ('6','34'), -- Aeronave
    ('6','5'), -- Clases
    
    -- Planificador: 
    ('7','7'), -- Direccion
    ('7','11'), -- Estado
    ('7','4'), -- ciudad
    ('7','23'), -- salida
    ('7','21'), -- regreso
    ('7','28'), -- vuelo
    ('7','16'), -- origen
    ('7','6'), -- destino
    ('7','10'), -- escala
    ('7','18'), -- pais

    
    -- Cliente: 
    ('8','6'), -- Destino
    ('8','1'), -- Asiento
    ('8','11'), -- Estado
    ('8','25'), -- tarifa
    ('8','14'), -- MetodoPago
    ('8','7'), -- Direcciones
    ('8','17'), -- pagos
    ('8','13'), -- itinerario
    ('8','12'), -- fecha
    ('8','23'), -- salida
    ('8','15'), -- millas
    ('8','16'), -- origen
    ('8','28'), -- vuelo
    ('8','26'), -- tipoEquipaje
    ('8','4'), -- ciudad
    ('8','2'), -- boleto
    ('8','22'), -- reservacion
    ('8','19'), -- pasajero
    ('8','27'), -- visa
    ('8','5'), -- clases
    ('8','18'), -- pais
    ('8','31'); -- usuariospasajero
    
insert into usuarios(usuario, contrasenia, idRol, idEmpleado) values
	('Admin_Gil','1234','1','1'), -- 1
	('Sop_gil','1234','2','2'), -- 2
	('Cont_Fermin','1234','3','3'), -- 3
	('Inven_Enzo','1234','4','4'), -- 4
	('RRHH_Mario','1234','5','5'), -- 5
	('ING_Jorge','1234','6','6'), -- 6
	('PLAN_Tono','1234','7','7'); -- 7

insert into usuariosPasajero(usuario, contrasenia, idRol, idPasajero) values
	('roberto_Ore','1234','8','1'), -- 1
	('Tatiana_Flor','1234','8','2'), -- 2
	('Isaias_Garz','1234','8','3'), -- 3
	('Milton_Mezqui','1234','8','4'), -- 4
	('Samuel_Flor','1234','8','5'); -- 5