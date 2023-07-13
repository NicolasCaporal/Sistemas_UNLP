# Algorítmica clásica sobre archivos
> Capítulo 3

En este capitulo se veran algortimos clásicos en la operatoria de archivos **secuenciales**.

Estos algoritmos se pueden resumir en tres tipos:
* De actualización
* Merge
* Corte de control

## De actualización
Se actualiza el contenido de un archivo maestro, a partir de un conjunto de archivos, denominados archivos detalle, con datos vinculados a ese archivo maestro.

### Concepto Maestro-detalle
Se denomina **archivo maestro** al archivo que resume información sobre un dominio de un problema especifico.

Se denomina **archivo detalle** al archivo que contiene novedades o movimientos realizados sobre la información almacenada en el maestro.
Puede haber uno, dos, tres, o N archivos maestros. (N > 1)

Ambos archivos, maestro y detalle, se encuentran físicamente ordenados por el mismo criterio.

Por la forma de manejar archivos de pascal, **en caso de que los datos puedan estar repetidos en el detalle**, se utiliza un procedimiento 'leer' con el fin de evitar errores con los últimos registros de el/los detalle/s. Este procedimiento hace el read correspondiente, y en caso de llegar al EOF (End of File) pone un valor como marca para indicarlo.

#### Procedimiento minimo
Si tenemos N archivos detalle ordenados por el mismo criterio, usamos un procedimiento llamado minimo, que actua como filtro. 'Minimo' retorna el elemento más pequeño de todos los archivos de acuerdo con el criterio de ordenamiento del problema.

Para poder generalizar la solución, los archivos y registros se guardan en arreglos de tamaño N.

## Merge
Se dispone de información distribuida en varios archivos que se reúne para generar un nuevo archivo, producto de la unión de los anteriores.

La principal diferencia con el caso anterior, de actualización maestro-detalle, es que en el Merge el "maestro" no existe, por lo tanto debe ser generado.

## Corte de control
A partir de información contenida en un archivo, se generan reportes que resumen el contenido, con un formato especial, de manera organizada.

Por la propia definición de corte de control el archivo si o si se encuentra ordenado por al menos un criterio.
Si fuera más de un criterio, simplemente se anidan más 'while', y se usan más acumuladores.
