/* Ejercicio 1
Cliente(idCliente, nombre, apellido, DNI, telefono, direccion)
Factura (nroTicket, total, fecha, hora,idCliente (fk))
Detalle(nroTicket, idProducto, cantidad, preciounitario)
Producto(idProducto, descripcion, precio, nombreP, stock) */

/* 1. Listar datos personales de clientes cuyo apellido comience con el string ‘Pe’. 
Ordenar porDNI */

SELECT nombre, apellido, DNI, telefono, direccion
FROM cliente
WHERE (apellido LIKE 'Pe%') 
ORDER BY DNI



/* 2. Listar nombre, apellido, DNI, teléfono y dirección de clientes que realizaron compras
solamente durante 2017. */

SELECT DISTINCT nombre, apellido, DNI, telefono, direccion
FROM cliente c INNER JOIN factura f ON (c.idCliente = f.idCliente)
WHERE (YEAR(fecha) = 2017)
AND c.idCliente NOT IN ( SELECT c.idCliente
                         FROM Cliente c NATURAL JOIN Factura f 
                         WHERE YEAR(f.fecha) != 2017 );



/* 3. Listar nombre, descripción, precio y stock de productos vendidos al cliente con
DNI:45789456, pero que no fueron vendidos a clientes de apellido ‘Garcia’.*/

SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM Producto p 
INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
INNER JOIN Factura f ON (d.nroTicket = f.nroTicket) 
INNER JOIN Cliente c ON (f.idCliente =  c.idCliente)
WHERE (c.DNI = 45789456)
AND p.idProducto NOT IN (SELECT p.IdProducto
                         FROM Producto p 
                         INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
                         INNER JOIN Factura f ON (d.nroTicket = f.nroTicket) 
                         INNER JOIN Cliente c ON (f.idCliente =  c.idCliente)
                         WHERE (c.apellido = "Garcia"));



/* 4. Listar nombre, descripción, precio y stock de productos no vendidos a clientes que
tengan teléfono con característica: 221 (La característica está al comienzo del teléfono).
Ordenar por nombre */


CREATE VIEW ClientesCon221 AS(
    SELECT idCliente
    FROM Cliente c
    WHERE (c.telefono LIKE '221%')
);

CREATE VIEW ProductosAClientes221 AS (
    SELECT p.idProducto
    FROM Producto p 
    INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
    INNER JOIN Factura f ON (d.nroTicket = f.nroTicket) 
    INNER JOIN Cliente c ON (f.idCliente =  c.idCliente)
    WHERE (f.idCliente IN (SELECT idCliente FROM ClientesCon221))
);

SELECT nombreP, descripcion, precio, stock
FROM producto p
WHERE (p.idProducto NOT IN (SELECT idProducto FROM ProductosAClientes2212))
ORDER BY nombreP;



/* 5. Listar para cada producto: nombre, descripción, precio y cuantas veces fué vendido.
Tenga en cuenta que puede no haberse vendido nunca el producto */

CREATE VIEW cantidadSumaProducto AS (
    SELECT p.idProducto, SUM(d.cantidad) AS Cantidad
    FROM producto p INNER JOIN detalle d ON (p.idProducto = d.idProducto)
    GROUP BY p.idProducto 
);

SELECT p.idProducto, nombreP, descripcion, precio, c.cantidad
FROM producto p LEFT JOIN cantidadSumaProducto c ON (p.idProducto = c.idProducto)



/* 6. Listar nombre, apellido, DNI, teléfono y dirección de clientes que compraron los
productos con nombre ‘prod1’ y ‘prod2’ pero nunca compraron el producto con nombre
‘prod3’ */

CREATE VIEW Clientes1y2 AS (
    SELECT c.idCliente 
    FROM cliente c 
    INNER JOIN Factura f ON (c.idCliente =  f.idCliente)
    INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket) 
    INNER JOIN Producto p ON (d.idProducto = p.idProducto)
    WHERE (p.nombreP = 'prod1')
    AND (c.idCliente) IN (
    SELECT c.idCliente 
    FROM cliente c 
    INNER JOIN Factura f ON (f.idCliente =  c.idCliente)
    INNER JOIN Detalle d ON (d.nroTicket = f.nroTicket) 
    INNER JOIN Producto p ON (p.idProducto = d.idProducto)
    WHERE (p.nombreP = 'prod2'))
);

SELECT nombre, apellido, DNI, telefono, direccion
FROM cliente c INNER JOIN Clientes1y2 cl ON (c.idCliente = cl.idCliente)
WHERE cl.idCliente NOT IN ( SELECT c.idCliente 
							FROM cliente c 
							INNER JOIN Factura f ON (c.idCliente =  f.idCliente)
							INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket) 
							INNER JOIN Producto p ON (d.idProducto = p.idProducto)
							WHERE (p.nombreP = 'prod3') );



/* 7. Listar nroTicket, total, fecha, hora y DNI del cliente, de aquellas facturas donde se haya
comprado el producto ‘prod38’ o la factura tenga fecha de 2019 */

SELECT f.nroTicket, f.total, f.fecha, f.hora, c.DNI
FROM cliente c 
INNER JOIN Factura f ON (c.idCliente =  f.idCliente)
INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket) 
INNER JOIN Producto p ON (d.idProducto = p.idProducto)
WHERE p.nombreP = 'prod38' OR YEAR(f.fecha)=2019;



/* 8. Agregar un cliente con los siguientes datos: nombre:’Jorge Luis’, apellido:’Castor’,
DNI:40578999, teléfono:221-4400789, dirección:’11 entre 500 y 501 nro:2587’ y el id de
cliente: 500002. Se supone que el idCliente 500002 no existe. */

INSERT INTO Cliente (idCliente, nombre, apellido, DNI, telefono, direccion) 
VALUES (500002,"Jorge Luis","Castor","40578999","221-4400789","11 entre 500 y 501 nro:2587");



/* 9. Listar nroTicket, total, fecha, hora para las facturas del cliente ´Jorge Pérez´ donde no
haya comprado el producto ´Z´. */

SELECT f.nroTicket, f.total, f.fecha, f.hora
FROM cliente c 
INNER JOIN Factura f ON (c.idCliente =  f.idCliente)
INNER JOIN Detalle d ON (f.nroTicket = d.nroTicket) 
INNER JOIN Producto p ON (d.idProducto = p.idProducto)
WHERE (c.nombre = 'Jorge' AND c.apellido = 'Perez') 
AND f.nroTicket NOT IN( 
SELECT d.nroTicket
FROM detalle d INNER JOIN Producto p ON (d.idProducto = p.idProducto)
WHERE (p.nombreP = 'Z'));



/* 10. Listar DNI, apellido y nombre de clientes donde el monto total comprado, teniendo en
cuenta todas sus facturas, supere $10.000.000 */

CREATE VIEW totalPorCliente AS (
	SELECT f.idCliente, SUM(f.total) AS Monto
	FROM factura f
	GROUP BY f.idCliente
);

SELECT DNI, apellido, nombre
FROM cliente c INNER JOIN totalPorCliente t ON (c.idCliente = t.idCliente)
WHERE (t.monto > 10000);