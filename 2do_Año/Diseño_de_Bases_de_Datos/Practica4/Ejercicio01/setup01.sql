-- Creo Base de datos
CREATE DATABASE Ejercicio01;

USE Ejercicio01;

-- Crear tablas
CREATE TABLE `Cliente` (
	`idCliente` INT unsigned NOT NULL,
	`nombre` VARCHAR(45) NOT NULL,
	`apellido` VARCHAR(45) NOT NULL,
	`DNI` INT unsigned NOT NULL,
	`telefono` BIGINT NOT NULL,
	`direccion` VARCHAR(45) NOT NULL,
	PRIMARY KEY (`idCliente`)
);

CREATE TABLE `Factura` (
	`nroTicket` INT unsigned NOT NULL,
	`total` FLOAT NOT NULL,
	`fecha` DATE NOT NULL,
	`hora` TIME NOT NULL,
	`idCliente` INT NOT NULL,
	PRIMARY KEY (`nroTicket`)
);

CREATE TABLE `Detalle` (
	`nroTicket` INT unsigned NOT NULL,
	`idProducto` INT unsigned NOT NULL,
	`cantidad` INT unsigned NOT NULL,
	`preciounitario` FLOAT NOT NULL,
	PRIMARY KEY (`nroTicket`,`idProducto`)
);

CREATE TABLE `Producto` (
	`idProducto` INT unsigned NOT NULL,
	`descripcion` VARCHAR(45) NOT NULL,
	`precio` FLOAT NOT NULL,
	`nombreP` VARCHAR(45) NOT NULL,
	`stock` INT unsigned NOT NULL,
	PRIMARY KEY (`idProducto`)
);

-- Cargar tablas
INSERT INTO Cliente (idCliente, nombre, apellido, DNI, telefono, direccion) VALUES 
(1, 'Ana', 'Lopez', 45789456, 4567890123, 'Avenida Central 567'),
(2, 'Luis', 'Garcia', 45789416, 2218901234, 'Calle Principal 890'),
(3, 'Pedro', 'Paez', 50121156, 2212345678, 'Avenida Oeste 123'),
(4, 'Pablo', 'Pereira', 50123456, 9012345678, 'Avenida Oeste 123'),
(5, 'Matias', 'Perezozo', 11173468, 2216457895, 'Calle OC 911'),
(6, 'Ramon', 'Alvarez', 45678902, 4567890124, 'Avenida Sur 567'),
(7, 'Julia', 'Romero', 56789013, 2218901235, 'Calle Norte 678'),
(8, 'Zoe', 'Perez', 99972802, 113890154, 'Avenida Sur 5643'),
(9, 'Jorge', 'Perez', 12342, 2216778, 'Calle Centro 1111');


INSERT INTO Factura (nroTicket, total, fecha, hora, idCliente) VALUES 
(1, 150.00, '2017-10-26', '16:20:00', 1),
(2, 150.00, '2017-10-27', '16:20:00', 1),
(3, 150.00, '2018-10-26', '16:20:00', 2),
(4, 150.00, '2017-10-26', '16:20:00', 3),
(5, 150.00, '2017-10-26', '16:20:00', 3),
(6, 150.00, '2017-10-26', '16:20:00', 4),
(7, 150.00, '2019-10-26', '16:20:00', 4),
(8, 150.00, '2017-10-26', '16:20:00', 5),
(9, 150.00, '2018-10-26', '16:20:00', 6),
(10, 160.00, '2020-10-26', '16:20:00', 6),
(11, 150.00, '2021-10-26', '16:20:00', 7),
(12, 150.00, '2020-10-26', '16:20:00', 8),
(13, 150.00, '2020-10-10', '16:20:00', 9), 
(14, 150.00, '2020-10-11', '16:20:00', 9),
(15, 150.00, '2020-10-12', '16:20:00', 9),
(16, 9999.99, '2018-02-20', '15:33:33', 2),
(17, 9999.99, '2018-02-20', '15:33:33', 4);


INSERT INTO Detalle (nroTicket, idProducto, cantidad, preciounitario) VALUES 
(1, 1, 15, 10.00),
(2, 2, 3, 50.00),
(3, 1, 15, 10.00),
(4, 4, 1, 150.00),
(5, 4, 1, 150.00),
(6, 4, 1, 150.00),
(7, 3, 1, 100.00), 
(7, 2, 1, 50.00),	
(8, 4, 1, 150.00),
(9, 4, 1, 150.00),
(10, 1, 1, 10.00),
(10, 2, 1, 50.00),
(10, 3, 1, 100.00),
(11, 6, 1, 150.00),
(12, 2, 1, 50.00),
(12, 1, 10, 10.00),
(13, 6, 1, 150.00),
(14, 7, 1, 150.00),
(15, 6, 1, 150.00),
(16, 8, 1, 1),
(17, 8, 1, 1);



INSERT INTO Producto (idProducto, descripcion, precio, nombreP, stock) VALUES 
(1, 'Producto 1 Descripcion', 10.00, 'prod1', 11),
(2, 'Producto 2 Descripcion', 50.00, 'prod2', 5),
(3, 'Producto 3 Descripcion', 100.00, 'prod3', 30),
(4, 'Producto 4 Descripcion', 150.00, 'prod4', 50),
(5, 'Producto 5 No se vende', 100000.00, 'prod5', 2),
(6, 'Producto 38 ej7', 150.00, 'prod38', 3),
(7, 'Producto Z ej9', 150.00, 'Z', 24),
(8, 'Producto caro ej10', 9999.99, 'prod999', 100);

