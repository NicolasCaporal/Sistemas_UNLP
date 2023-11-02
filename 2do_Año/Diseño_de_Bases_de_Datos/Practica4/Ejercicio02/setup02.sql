-- Creo Base de datos
CREATE DATABASE Ejercicio02;

USE Ejercicio02;

-- Crear tablas
CREATE TABLE `AGENCIA` (
	`RAZON_SOCIAL` VARCHAR(45) NOT NULL,
	`direccion` VARCHAR(45) NOT NULL,
	`telef` BIGINT NOT NULL,
	`email` VARCHAR(45) NOT NULL,
	PRIMARY KEY (`RAZON_SOCIAL`)
);

CREATE TABLE `CIUDAD` (
	`CODIGOPOSTAL` INT unsigned NOT NULL,
	`nombreCiudad` VARCHAR(45) NOT NULL,
	`añoCreacion` INT unsigned NOT NULL,
	PRIMARY KEY (`CODIGOPOSTAL`)
);

CREATE TABLE `CLIENTE` (
	`DNI` INT unsigned NOT NULL,
	`nombre` VARCHAR(45) NOT NULL,
	`apellido` VARCHAR(45) NOT NULL,
	`telefono` BIGINT NOT NULL,
    `direccion` VARCHAR(45) NOT NULL,
	PRIMARY KEY (`DNI`)
);

CREATE TABLE `VIAJE` (
	`FECHA` DATE NOT NULL,
	`HORA` TIME NOT NULL,
	`DNI` INT unsigned NOT NULL,
    `cpOrigen` INT unsigned NOT NULL,
    `cpDestino` INT unsigned NOT NULL,
	`razon_social` VARCHAR(45) NOT NULL,
	`descripcion` VARCHAR(45) NOT NULL,
	PRIMARY KEY (`FECHA`, `HORA`, `DNI`),
    FOREIGN KEY (`DNI`) REFERENCES CLIENTE(`DNI`),
    FOREIGN KEY (`cpOrigen`) REFERENCES CIUDAD(`CODIGOPOSTAL`),
    FOREIGN KEY (`cpDestino`) REFERENCES CIUDAD(`CODIGOPOSTAL`),
    FOREIGN KEY (`razon_social`) REFERENCES AGENCIA(`RAZON_SOCIAL`)
);

-- Cargar tablas
INSERT INTO AGENCIA (RAZON_SOCIAL, direccion, telef, email) VALUES
('Agencia1', 'Calle 123, Ciudad1', 123456789, 'agencia1@jmail.com'),
('Agencia2', 'Avenida 456, Ciudad2', 987654321, 'agencia2@example.com'),
('Agencia3', 'Calle 156, Ciudad3', 133456119, 'agencia3@example.com'),
('Agencia4', 'Calle 456, Ciudad4', 987664321, 'agencia4@example.com'),
('TAXI Y', 'Calle 50, La Plata', 2204267271, 'taxiy@example.com');


INSERT INTO CIUDAD (CODIGOPOSTAL, nombreCiudad, añoCreacion) VALUES
(1900, 'La Plata', 1882),
(22050, 'Rio de janeiro', 1565),
(1980, 'Coronel Brandsen', 1875),
(1894, 'Villa Elisa', 1999);


INSERT INTO CLIENTE (DNI, nombre, apellido, telefono, direccion) VALUES
(11111111, 'Juan', 'Roma', 123456789, 'Calle 123, La Plata'),
(22222222, 'María', 'López', 987654321, 'Avenida 456, Sao Pablo'),
(33333333, 'Roberto', 'Domiguez', 933334321, 'Avenida 123, La Plata'),
(44444444, 'Amante', 'Brandsen', 987654321, 'Avenida 123, Coronel Brandsen'),
(38495444, 'Jose', 'San Martin', 000010000, 'Avenida Virrey, Posadas Misiones'),
(40325692, 'Manuel', 'Belgrano', 11110111, 'Santo Domingo 1909, CABA');


INSERT INTO VIAJE (FECHA, HORA, DNI, cpOrigen, cpDestino, razon_social, descripcion) VALUES
('2023-10-31', '11:00:00', 11111111, 1900, 1900, 'Agencia1', 'Correcto'),
('2023-10-31', '12:00:00', 11111111, 1900, 1900, 'Agencia2', 'Correcto'),
('2023-10-31', '13:00:00', 11111111, 1900, 1900, 'Agencia3', 'Correcto'),
('2023-10-31', '14:00:00', 11111111, 1900, 1900, 'Agencia4', 'Correcto'),
('2023-12-31', '15:00:00', 11111111, 1900, 1900, 'Agencia4', 'Con descuento'),
('2019-01-15', '16:00:00', 22222222, 1900, 1900, 'Agencia4', 'Esta demorado'),
('2023-12-31', '17:00:00', 33333333, 1900, 1900, 'Agencia4', 'Con descuento'),
('2019-01-16', '18:00:00', 22222222, 22050, 1980, 'Agencia2', 'demorado tambien'),
('2000-01-20', '19:00:00', 33333333, 1980, 1894, 'Agencia2', 'demorado pero otro año'),
('2023-01-16', '20:00:00', 44444444, 1894, 1894, 'TAXI Y', 'Correcto'),
('2023-01-16', '21:00:00', 22222222, 1894, 1980, 'TAXI Y', 'Correcto'),
('2019-01-16', '22:00:00', 44444444, 1900, 1894, 'TAXI Y', 'Tardeeee'),
('2023-01-16', '23:00:00', 11111111, 1894, 1980, 'TAXI Y', 'Correcto'),
('2023-10-31', '01:30:00', 11111111, 1900, 1900, 'Agencia4', 'Correcto'),
('2019-10-31', '02:30:00', 11111111, 1900, 1900, 'Agencia4', 'demoradX'),
('2023-10-31', '03:30:00', 11111111, 1900, 1900, 'Agencia4', 'Correcto'),
('2023-10-31', '04:30:00', 11111111, 1900, 1900, 'Agencia4', 'Correcto');

