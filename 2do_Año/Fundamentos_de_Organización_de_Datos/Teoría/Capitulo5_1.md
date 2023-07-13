# Busqueda de información
> Capítulo 5

## Concepto de Clave
La operación más realizada tanto en bases de datos como en archivos es la consulta.
Por lo tanto, para hacer más eficiente la busqueda, es conveniente indentificar a los registros con una **clave** que se base en el contenido del mismo.

**Entonces, la clave:**
* Debe permitir indentificar a un elemento (o un conjunto de elementos) del resto.
* Debe permitir ordenar al archivo por ese criterio

Si es clave primaria, identifica a un unico elemento.

Si es clave secundaria, identifica a un conjunto de elementos.

Este orden, dado por la clave, no tiene porque ser físico. Es decir, ya nos alejamos de archivos serie (Acceso secuencial físico), y empezamos a trabajar con archivos secuenciales (Acceso secuencial indizado).

### Forma canónica:
Se estandarizan los datos ingresados por el usuario a la hora de hacer la busqueda, para que la misma no se vea afectada.

*Por ejemplo, un usuario ingresa Lisandro (Primer letra mayúscula, el resto minúsculas) y otro ingresa LIONEL (todas las letras mayúsculas).
Para que la busqueda no se vea afectada, a la hora de buscar, por ejemplo, se pasan todas las claves a mayusculas, viendo temporalmente LISANDRO.*

Este cambio temporal se realiza solo para la busqueda, los datos en el archivo se cargan tal cual los ingresa el usuario.

## Proceso de busqueda. Performance
Cuando se busca un dato, se debe considerar la cantidad de accesos a disco en pos de encontrar esa información, y en cada acceso, la verificación de si el dato obtenido es el buscado (comparación).

Es decir, hay dos parametros a considerar, cantidad de accesos y cantidad de comparaciones.

La primera se hace en disco, la segunda se hace en RAM.
Ergo, a la hora de analizar la performance, tomaremos en cuenta solo el costo de acceso a memoria secundaria.

### En el caso secuencial:
* **Mejor caso:** leer 1 registro.
* **Promedio:** N/2 comparaciones.
* **Peor caso:** leer N registros.
* **Es de O(n)**, porque depende de la cantidad de registros.
  
Se realizan N lecturas, N comparaciones, pero no necesariamente N accesos a disco.

Lecturas no es lo mismo que Accesos a disco, ya que trabaja con buffer, lee la memoria y va trayendo de a bloques al buffer.

### Acesso directo:
* Permite acceder a un registro preciso
* Requiere una sola lectura para traer el dato [ O(1) ].
* Debe necesariamente conocerse el lugar donde comienza el registro requerido (NRR).

### Numero relativo de registro
Es un número que indica la posición relativa de un registro con respecto al principio del archivo.

*Aplicable para registros de longitud fija*

### Busqueda binaria
Si el archivo está físicamente ordenado y tiene registros de longitud fija, se puede realizar busqueda binaria.
* **Mejor caso:** 1 acceso
* **Promedio:** [log(n)+1]/2
* **Peor caso:** log(n)+1
* **Es de orden log(n)**
  
## Ordenamiento de archivos
Es muy conveniente para consultar archivos, y ganar performance, que el mismo se encuentre ordenado.

El problema es, que ordenar un archivo y mantenerlo ordenado tiene un costo alto.

### En disco
Si el archivo es muy grande, el ordenamiento se debe realizar sobre memoria secundaria, lo que es tremendamente lento. Inviable.

### En RAM
Si el archivo entra entero en RAM, se trae a memoria principal, se ordena, y luego se copia secuencialmente a memoria secundaria. Esta es la mejor alternativa para ordenar archivos, pero solo se puede realizar con archivos pequeños, que quepan en ram.
* O(2n)

### Claves en RAM 
Si el archivo no cabe en ram, se puede transferir a memoria principal solo la clave por la que se desea ordenar, junto con su NRR, para ordenarlo en memoria principal y posteriormente transferirlo a memoria secundaria. En este caso se lee el archivo completo dos veces del disco.
* O(3n)

### Excesivamente grande
Si el archivo es tan grande, que ni siquiera sus claves caben en RAM, hay que usar otra estrategir (repito, ordenarlo en disco en inviable en cuanto a eficiencia).

* Se parte en porciones de igual tamaño, que entren en ram.
* Se tranfieren de a una a memoria principal
* Se ordena en memoria principal y se crea un archivo con ese subconjunto
* Una vez que tenes todos los archivos con subconjuntos ordenados en memoria secundaria, se realiza un merge.

