# Manejo de índices
> Capítulo 5

## Indización
Para mejorar la eficiencia, se usa una estructura de datos adicional, llamada indice. En el indice se almacenan las claves de los registros del archivo, junto con la referencia de acceso a cada registro. 

Es necesario que las claves permanezcan ordenadas.

Este indice es otro archivo, con longitud fija.

**El indice posibilita imponer un orden en el archivo, sin que realmente se acomode.** Vemos el archivo como si estuviera ordenado, aunque en realidad no lo está.

En decir, el indice es un nuevo archivo, que si se encuentra ordenado por claves, con registros de longitud fija. Como contiene solo clave y NRR, es mucho más pequeño, por lo que, en caso de tener que ordenar el indice, seguramente entre todo en RAM

Para realizar cualquier busqueda, se busca la clave en el indice (con busqueda dicotomica porque está ordenado, y en RAM porque es pequeño), se toma la referencia y se accede **directamente** al archivo de datos a esa posición.

## Operaciones:
### Alta
Se agrega al final del archivo de datos, y se inserta ordenado en el indice.

### Baja
Se elimina del archivo de datos, y se elimina del archivo de indice.
No se recupera el espacio en el indice, para no romper con el orden.

### Actualización
Si no se modifica la clave, y la longitud del archivo no cambia, solo se actualiza el archivo de datos y el indice no sufre cambios.

Si no se modifica la clave y cambia la longitud del registro (si se agranda), hay que reubicarlo en el archivo de datos, y por tanto actualizar la referencia en el indice.

Si se modifica la clave, se debe actualizar el archivo de datos y reordenar el indice.

## Ventajas y desventajas de los índices
### Ventajas
* Permite busqueda binaria, siempre, porque está ordenado y es de longitud fija.
* Al ser pequeño, seguramente esté en memoria principal, por lo que es rápido para operar.
* Por esto mismo de que está en RAM, mantenerlo es menos costoso.

### Desventajas
* Al final del día hay que reescribir en memoria secundaria todos los indices que fueron modificados.
* Al estar en RAM y pasarse con poca frecuencia a disco, peligra la integridad de los datos en caso de corte de luz por ejemplo.
* Si no entran todos los indices necesarios en RAM, pierde sus ventajas.

## Persistencia de datos
Lo dicho anteriormente, sobre que lo indices se encuentran en RAM, perdió validez. Actualmente ya no se manejan así. Se prioriza solucionar 2 de las desventajas, el hecho de si los indices entran o no entran en RAM, y principalmente el problema con la persitencia de datos.

Los indices están en **disco**, perdiendo performance, pero mejorando lo ya mencionado.

**Las soluciones son:** 
* Árboles 
* Hashing **(no utiliza indices)**

## Claves candidatas
Una clave candidate es una clave que no se repite, al igual que las claves primarias. La diferencia con estas, es simplemente que las candidatas no fueron elegidas como primarias por cuestiones operativas.

Un indice de claves candidatas se trata igual que uno de claves primarias.

## Índice secundario
La clave que soporta valores repetidos se denomina clave secundaria, y índice secundario a los que tratan con estas.

Se puede acceder al archivo mediante esta, y suele ser más fácil de recordar, como por ejemplo, un nombre.

El indice secundario relaciona una clave secundaria con una o más claves primarias.

Para buscar un dato deseado, se accede al indice secundario donde se obtiene la clave primaria, con la clave primaria se accede al indice primario donde se obtiene el NRR, con el cual se accede al archivo de datos.

Los indices secundarios solo son modificados si cambia la clave primaria.

### Operaciones
### Alta
Culquier alta en el archivo, genera insercion en el indice secundario.

### Baja
Si se elimina un registro del archivo de datos, se elimina tambien del indice primario y de todos los indices secundarios.

Una alternativa es borrar solo la referencia en el indice primario. Evitando así alterar el indice secundario, pero despediciando espacio en el mismo.

### Actualización
Si se modifica la clave secundario, debe reordenarse el indice secundario.

Si se cambia el resto del registro (excepto la clave primaria) el indice secundario no se ve modificado.

## Alternativas de organización de índices secundarios
Hasta el momento, si había varias ocurrencias de una misma clave secundaria, se almacenaban en distintos registros del indice secundario. Esto trae un problema: con busqueda binaria podriamos recuperar solo una de esas ocurrencias.

Una posible solución es a cada clave secundaria, acompañarla con un arreglo que contenga todas las ocurrencias de las claves primarias. El problema con esta solución es definir el tamaño del vector. Si definimos uno fijo, en algún momento podriamos quedarnos sin espacio. Si lo vamos variando, el índice sería de longitud variable, por lo que no podríamos hacer busqueda binaria.

La mejor solución es mantener registros de longitud fija, poner solo una vez cada clave secundaria, sin repetición.
Y en el índice primario, generar una lista invertida de claves primarias.
