/* Ejercicio 3:
Club=(codigoClub, nombre, anioFundacion, codigoCiudad(FK))
Ciudad=(codigoCiudad, nombre)
Estadio=(codigoEstadio, codigoClub(FK), nombre, direccion)
Jugador=(DNI, nombre, apellido, edad, codigoCiudad(FK))
ClubJugador(codigoClub, DNI, desde, hasta)
 */

/* 1. Reportar nombre y anioFundacion de aquellos clubes de la ciudad de La Plata que no
poseen estadio. */

SELECT Club.nombre, Club.anioFundacion
FROM Club
WHERE Club.codigoCiudad IN (
    SELECT codigoCiudad 
    FROM Ciudad 
    WHERE Ciudad.nombre = 'La Plata'
) AND Club.codigoClub NOT IN (
    SELECT codigoClub 
    FROM Estadio
);


/* 2. Listar nombre de los clubes que no hayan tenido ni tengan jugadores de la ciudad de
Berisso. */

CREATE VIEW JugadoresBerisso AS(
SELECT DNI 
FROM Jugador j
INNER JOIN Ciudad c ON (j.codigoCiudad = c.codigoCiudad)
WHERE c.nombre = 'Berisso'
);

SELECT c.nombre 
FROM Club c
WHERE c.codigoClub NOT IN (
	SELECT c.codigoClub
    FROM Club c 
    INNER JOIN ClubJugador cj ON (cj.codigoClub = c.codigoClub)
    INNER JOIN JugadoresBerisso jb ON (cj.DNI = jb.DNI)
);


/* 3. Mostrar DNI, nombre y apellido de aquellos jugadores que jugaron o juegan en el club
Gimnasia y Esgrima La PLata. */

SELECT j.DNI, j.nombre, j.apellido
FROM Club c
INNER JOIN ClubJugador cj ON (c.codigoClub = cj.codigoClub)
INNER JOIN Jugador j ON (cj.DNI = j.DNI)
WHERE c.nombre = 'Gimnasia';


/* 4. Mostrar DNI, nombre y apellido de aquellos jugadores que tengan más de 29 años y
hayan jugado o juegan en algún club de la ciudad de Córdoba. */

SELECT j.DNI, j.nombre, j.apellido
FROM Club clu
INNER JOIN ClubJugador cj ON (clu.codigoClub = cj.codigoClub)
INNER JOIN Jugador j ON (cj.DNI = j.DNI)
INNER JOIN Ciudad ciu ON (clu.codigoCiudad = ciu.codigoCiudad)
WHERE j.edad > 25 and ciu.nombre = 'Cordoba';


/* 5. Mostrar para cada club, nombre de club y la edad promedio de los jugadores que juegan
actualmente en cada uno. */

SELECT c.nombre, AVG(j.edad) AS Edad_promedio
FROM  Club c
INNER JOIN ClubJugador cj ON (c.codigoClub = cj.codigoClub)
INNER JOIN Jugador j ON (cj.DNI = j.DNI)
WHERE cj.hasta IS NULL
GROUP BY c.codigoClub;


/* 6. Listar para cada jugador: nombre, apellido, edad y cantidad de clubes diferentes en los
que jugó. (incluido el actual) */

SELECT j.nombre, j.apellido, COUNT(*) AS Cantidad_clubes
FROM  Club c
INNER JOIN ClubJugador cj ON (c.codigoClub = cj.codigoClub)
INNER JOIN Jugador j ON (cj.DNI = j.DNI)
GROUP BY j.nombre, j.apellido;


/* 7. Mostrar el nombre de los clubes que nunca hayan tenido jugadores de la ciudad de Mar
del Plata. */

SELECT DISTINCT c.nombre
FROM Club c 
INNER JOIN ClubJugador cj ON (c.codigoClub = cj.codigoClub)
INNER JOIN Jugador j ON (cj.DNI =j.DNI) 
WHERE c.codigoClub NOT IN (
    SELECT clu.codigoClub
    FROM Club clu
    INNER JOIN ClubJugador cj ON (clu.codigoClub = cj.codigoClub)
    INNER JOIN Jugador j ON (cj.DNI =j.DNI) 
    INNER JOIN Ciudad ciu ON (j.codigoCiudad = ciu.codigoCiudad)
    WHERE ciu.nombre = 'Mar del plata'
);


/* 8. Reportar el nombre y apellido de aquellos jugadores que hayan jugado en todos los
clubes. */
 
SELECT j.nombre, j.apellido
FROM Jugador j
WHERE NOT EXISTS (
    SELECT c.codigoClub
    FROM Club c
    WHERE NOT EXISTS (
        SELECT cj.codigoClub
        FROM ClubJugador cj
        WHERE cj.DNI = j.DNI AND cj.codigoClub = c.codigoClub
    )
);


/* 9. Agregar con codigoClub 1234 el club “Estrella de Berisso” que se fundó en 1921 y que
pertenece a la ciudad de Berisso. Puede asumir que el codigoClub 1234 no existe en la
tabla Club.  */

 INSERT INTO Club (codigoClub, nombre, anioFundacion, codigoCiudad(FK))
 VALUES (1234,"Estrella de Berisso","1921",(
    SELECT c.codigoCiudad
    FROM Ciudad 
    WHERE Ciudad.nombre = "Berisso"
    )
 );
