/* Ejercicio 2
AGENCIA (RAZON_SOCIAL, dirección, telef, e-mail)
CIUDAD (CODIGOPOSTAL, nombreCiudad, añoCreación)
CLIENTE (DNI, nombre, apellido, teléfono, dirección)
VIAJE( FECHA,HORA,DNI, cpOrigen(fk), cpDestino(fk), razon_social(fk), descripcion)
//cpOrigen y cpDestino corresponden a la ciudades origen y destino del viaje */


/* 1. Listar razón social, dirección y teléfono de agencias que realizaron viajes desde la ciudad de
‘La Plata’ (ciudad origen) y que el cliente tenga apellido ‘Roma’. Ordenar por razón social y
luego por teléfono. */

SELECT a.RAZON_SOCIAL, a.direccion, a.telef
FROM AGENCIA a 
INNER JOIN VIAJE v ON (a.RAZON_SOCIAL = v.razon_social)
INNER JOIN CLIENTE cli ON (v.DNI = cli.DNI)
INNER JOIN CIUDAD ciu ON (ciu.CODIGOPOSTAL = v.cpOrigen)
WHERE cli.apellido = 'Roma' and ciu.nombreCiudad = 'La Plata'
ORDER BY a.RAZON_SOCIAL, a.telef;


/* 2. Listar fecha, hora, datos personales del cliente, ciudad origen y destino de viajes realizados
en enero de 2019 donde la descripción del viaje contenga el String ‘demorado’. */

SELECT v.fecha, v.hora, c.DNI, c.nombre, c.apellido, c.telefono, c.direccion, ori.nombreCiudad, dest.nombreCiudad
FROM VIAJE v 
INNER JOIN CLIENTE c ON (v.DNI = c.DNI)
INNER JOIN CIUDAD ori ON (v.cpOrigen = ori.CODIGOPOSTAL)
INNER JOIN CIUDAD dest ON (v.cpDestino = dest.CODIGOPOSTAL)
WHERE (v.descripcion LIKE "%demorado%") and (YEAR(v.fecha) = 2019)


/* 3. Reportar información de agencias que realizaron viajes durante 2019 o que tengan dirección
de mail que termine con ‘@jmail.com’. */

SELECT *
FROM AGENCIA a
INNER JOIN VIAJE v ON (a.RAZON_SOCIAL = v.razon_social)
WHERE (a.email LIKE '%@jmail.com') OR (YEAR(v.fecha)=2019);


/* 4. Listar datos personales de clientes que viajaron solo con destino a la ciudad de ‘Coronel
Brandsen’ */

SELECT DISTINCT cli.DNI, cli.nombre, cli.apellido, cli.direccion, cli.telefono
FROM Cliente cli
INNER JOIN VIAJE v ON (cli.DNI = v.DNI) 
INNER JOIN CIUDAD ciu ON (ciu.CODIGOPOSTAL = v.cpDestino)
WHERE ciu.nombreCiudad = 'Coronel Brandsen' 
AND cli.DNI NOT IN (
	SELECT cli.DNI
    FROM Cliente cli
    INNER JOIN VIAJE v ON (cli.DNI = v.DNI) 
    INNER JOIN CIUDAD ciu ON (ciu.CODIGOPOSTAL = v.cpDestino)
    WHERE ciu.nombreCiudad != 'Coronel Brandsen'    
);   


/* 5. Informar cantidad de viajes de la agencia con razón social ‘TAXI Y’ realizados a ‘Villa Elisa’. */

SELECT COUNT(*)
FROM AGENCIA a 
INNER JOIN VIAJE v ON (a.RAZON_SOCIAL = v.razon_social)
INNER JOIN CIUDAD ciu ON (ciu.CODIGOPOSTAL = v.cpDestino)
WHERE (a.RAZON_SOCIAL = 'TAXI Y') and (ciu.nombreCiudad = 'Villa Elisa');


/* 6. Listar nombre, apellido, dirección y teléfono de clientes que viajaron con todas las agencias */

SELECT DISTINCT cli.DNI, cli.nombre, cli.apellido, cli.direccion, cli.telefono
FROM CLIENTE cli
WHERE NOT EXISTS (
    SELECT a.razon_social
    FROM AGENCIA a
    WHERE NOT EXISTS (
        SELECT v.razon_social
        FROM VIAJE v
        WHERE v.DNI = cli.DNI AND v.razon_social = a.razon_social
    )
);


/* 7. Modificar el cliente con DNI: 38495444 actualizando el teléfono a: 221-4400897. */

UPDATE CLIENTE
SET telefono = '221-4400897'
WHERE DNI = 38495444;


/* 8. Listar razon_social, dirección y teléfono de la/s agencias que tengan mayor cantidad de
viajes realizados. */

SELECT a.razon_social, COUNT(*) as cantidad_viajes
FROM AGENCIA a
INNER JOIN VIAJE v ON a.RAZON_SOCIAL = v.razon_social
GROUP BY a.razon_social
HAVING COUNT(*) = (
    SELECT MAX(contador)
    FROM (
        SELECT COUNT(*) as contador
        FROM VIAJE
        GROUP BY razon_social
    ) as max
);


/* 9. Reportar nombre, apellido, dirección y teléfono de clientes con al menos 10 viajes. */

SELECT c.nombre, c.apellido, c.direccion, c.telefono
FROM CLIENTE c
INNER JOIN VIAJE v ON c.DNI = v.DNI
GROUP BY c.DNI
HAVING COUNT(*) >= 10;


/* 10. Borrar al cliente con DNI 40325692 */

DELETE FROM CLIENTE
WHERE DNI = 40325692;
