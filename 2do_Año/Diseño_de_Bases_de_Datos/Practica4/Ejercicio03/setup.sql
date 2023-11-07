CREATE DATABASE Ejercicio03;

USE Ejercicio03;

CREATE TABLE `Club` (
    `codigoClub` INT NOT NULL,
    `nombre` VARCHAR(45) NOT NULL,
    `anioFundacion` INT NOT NULL,
    `codigoCiudad` INT NOT NULL,
    PRIMARY KEY (`codigoClub`)
);

CREATE TABLE `Ciudad` (
    `codigoCiudad` INT NOT NULL,
    `nombre` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`codigoCiudad`)
);

CREATE TABLE `Estadio` (
    `codigoEstadio` INT NOT NULL,
    `codigoClub` INT NOT NULL,
    `nombre` VARCHAR(45) NOT NULL,
    `direccion` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`codigoEstadio`)
);

CREATE TABLE `Jugador` (
    `DNI` BIGINT NOT NULL,
    `nombre` VARCHAR(45) NOT NULL,
    `apellido` VARCHAR(45) NOT NULL,
    `edad` INT NOT NULL,
    `codigoCiudad` INT,
    PRIMARY KEY (`DNI`)
);

CREATE TABLE `ClubJugador` (
    `codigoClub` INT NOT NULL,
    `DNI` BIGINT NOT NULL,
    `desde` DATE NOT NULL,
    `hasta` DATE,
    PRIMARY KEY (`codigoClub`, `DNI`)
);

-- Cargo tablas
INSERT INTO Club (codigoClub, nombre, anioFundacion, codigoCiudad) VALUES
(70, 'Estudiantes', 1905, 1900),
(07, 'Gimnasia', 1887, 1900),
(19, 'Belgrano', 1905, 5000),
(12, 'Boca Juniors', 1905, 1166);

INSERT INTO Ciudad (codigoCiudad, nombre) VALUES 
(1900, 'La Plata'),
(1923, 'Berisso'),
(5000, 'Cordoba'),
(1166, 'CABA'),
(7600, 'Mar del plata');

INSERT INTO Estadio (codigoEstadio, codigoClub, nombre, direccion) VALUES
(60, 07, 'Juan Carmelo Zerillo', '60 y 118'),
(28, 19, 'Julio Cesar Villagra', 'Arturo Orgaz 510'),
(12, 12, 'Alberto J. Armando', 'Brandsen 805');

INSERT INTO Jugador (DNI, nombre, apellido, edad, codigoCiudad) VALUES 
(12345678, 'Guillermo', 'Gomez', 25, 1923),
(23456789, 'Guillermo', 'Schelotto', 50, 1900),
(34567890, 'Gustavo', 'Schelotto', 50, 1900),
(45678901, 'Juan Carlos', 'Olave', 47, 5000),
(56789012, 'Roberto', 'Gimenez', 20, 1923),
(12121212, 'valentin', 'Barco', 19, 1166),
(67890123, 'Shark', 'Tiburon', 50, 7600);

INSERT INTO ClubJugador (codigoClub, DNI, desde, hasta) VALUES 
(70, 12345678, '2019-03-27', NULL),
(07, 23456789, '1991-10-06', '1997-09-13'),
(07, 34567890, '1991-10-07', NULL),
(70, 45678901, '2006-06-26', '2007-06-25'),
(07, 45678901, '2006-06-26', '2007-06-25'),
(19, 45678901, '2007-06-26', '2011-06-26'),
(19, 56789012, '2020-01-01', NULL),
(12, 12121212, '2012-12-12', '2023-12-12'),
(12, 23456789, '1997-09-14', NULL),
(12, 45678901, '2023-06-27', NULL),
(07, 67890123, '2023-02-01', NULL);