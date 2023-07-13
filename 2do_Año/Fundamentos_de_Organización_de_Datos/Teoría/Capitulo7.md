# Familia de árboles balanceados
> Capítulo 7

# Árbol B
## Definición
**Los árboles B son árboles multicamino con una construcción especial que permite mantenerlos balanceados a bajo costo.**

Un árbol B de orden M posee las siguientes propiedades básicas:
1. Cada nodo del árbol puede contener, como máximo, M descendientes y M-1 elementos.
2. La raíz no posee descendientes o tiene al menos dos.
3. Un nodo con x descendientes directos contiene x-1 elementos.
4. Los nodos terminales (hojas) tienen, como mínimo, [M/2] -1 elementos, y como máximo, M-1 elementos.
5. Los nodos que no son terminales ni raíz tienen, como mínimo, [M/2] elementos.
6. Todos los nodos terminales se encuentran al mismo nivel.

No hay que olvidar que en la materia, se presenta y se utilizan los árboles B como **índice** de un archivo.

En este caso, el Árbol B contendría solamente la clave primaria y la referencia (NRR).
Un archivo serie es el que contiene todos los datos efectivos del registro.

## Operaciones sobre árboles B
### Creación
En un primer instante, con el archivo de datos vacios, se dispone de un nodo raíz vacio.

Al insetar un elemento este se coloca en la primer posición libre. Los punteros de los hijos se establencen en nulo.
Se seguirán insertando los nodos en la raíz mientras haya espacio.

### Inserción
En primer lugar se debe buscar el nodo donde debería ir el dato.
Se recorre el nodo raíz hasta que la clave a insertar sea mayor a la clave actual. Entonces, si el enlace anterior no es nulo, se va a la izquierda.
Se seguirá buscando de esa manera hasta encontrar un enlace nulo, es decir, un nodo terminal, ya que los elementos deben insertarse siempre en nodos terminales. 
Una vez hayado el nodo indicado, si hay lugar se inserta ahí sin problemas y la operación finaliza.
Si no hay lugar, se produce overflow.

#### Overflow
Cuando venga un nuevo dato y no haya espacio, se produce overflow en el nodo.
**Para solucionarlo, se realiza el siguiente proceso, denominado DIVISIÓN:**
1. **Se crea un nuevo nodo**
2. **La primera mitad de las claves se mantienen en el nodo viejo.**
3. **La segunda mitad de las claves se trasladan al nodo nuevo.**
4. **La menor de las claves de la segunda mitad se promocionan al nodo padre** *(que en caso de no existir, por overflow en la raíz, también se crea)*

*En caso de que, al promocionar una clave en el paso 4, se genere overflow en el padre, se repite el mismo proceso.*

### Búsqueda
Se realiza el mismo proceso de busqueda ya descripto en la inserción.
Hasta encontrar el elemento, o hasta llegar a un nodo terminal que no lo contenga.
Si se encontró se retorna una condición de éxito (el NRR).

### Eliminación
Se realiza un proceso de busqueda. En caso de llegar a un nodo terminar que no lo contenga, el proceso finaliza, pues el nodo no se encontró.
En caso de encontrarlo, se procede con la eliminación

Para poder eliminar un elemento, el mismo debe estar ubicado en un nodo terminal.

Si esto se cumple, se elimina ahí mismo sin problema.


En caso de que no se cumpla, se debe intercambiar por el menor de sus claves mayores, y a continuación se da la baja.

En caso de que al eliminar el elemento, la cantidad de claves del nodo en cuestión quede por debajo de [M/2] - 1 *(propiedad 4)*, se produce underflow

#### Underflow
> Para tratar el underflow, primero hay que conocer dos conceptos:
> * **Nodos hermanos:** Aquellos nodos que tienen el mismo padre.
> * **Nodos hermanos adyacentes:** Aquellos nodos que, siendo hermanos, son además dependientes de punteros consecutivos del padre.

1. **Redistribuir**
   
   Primero se intenta redistribuir.
   
   Se revisa el hermano adyacente según la politica, el izquierdo o derecho. 
   
   Para que se pueda realizar la redistribución, el hermano adyacente debe tener más de [M/2] - 1 elementos *(es decir, no puede estar al minimo)*. 
   
   Si esto se cumple, se procede con la redistribución. Se toman los elementos del hermano, el elemento padre, y los elementos que queden del nodo en que entró underflow. La mitad van al primer nodo, un intermedio que actue como separador va al padre y la otra mitad a segundo nodo.

2. **Fusión**
   En caso de que el hermano adyacente esté al mínimo, no es posible redistribuir, pues también entraría en underflow.

   Entonces, se fusionan.

   Para esto se toman los elementos del primer nodo, se juntan con los elementos del segundo, se trae también el elemento del padre, y se ponen todos el el primer nodo.

   Se libera el nodo que generó el underflow.

   *En caso de que al tomar el elemento del nodo padre, el mismo quede en underflow, se repite el mismo proceso.*

### Modificación
Se da la baja del elemento anterior y se da la alta del nuevo.

## Analisis de performance:
### Eficiencia de búsqueda en un árbol B
### Mejor caso: 
Encontrar el elemento en el nodo raíz, **1 lectura**.

### Peor caso: 
Recorrer todos los nodos, hasta una hoja y no encontrar el elemento, **h lecturas** *(siendo h la altura del arbol)*
  > ¿Y cual es el valor de h?

### Eficiencia de inserción en un árbol B
### Mejor caso:
>(sin overflow)
  
* H lecturas
* 1 escritura

### Peor caso:
> (con overflow hasta la raíz, que aumenta en 1 el nivel del árbol)
* H lecturas
* 2h + 1 escrituras (dos por nivel más la raíz)

### Eficiencia de eliminación en un árbol B
### Mejor caso: 
> Se elimina un elemento de un nodo terminal, sin underflow.
* H lecturas 
* 1 escritura

### Peor caso:
> En caso de fusión, se produce una lectura más por cada nivel que haya que fusionar.
* 2*H -1 lecturas
* H -1 escrituras

# Árboles B*
## Definición
Un árbol B* es un árbol balanceado con las siguientes propiedades especiales:
1. Cada nodo del árbol puede contener, como máximo, M descendientes y M-1 elementos
2. La raíz no posee descendientes o tiene al menos 2.
3. Un nodo con X descendientes contiene x-1 elementos.
4. Los nodos terminales tienen, como mínimo, [(2M-1)/3]-1 elementos, y como máximo, M-1 elementos.
5. Los nodos que no son terminales ni raíz tienen, como mínimo, [(2M-1)/3] descendientes.
6. Todos los nodos terminales se encuentran al mismo nivel.

## Operaciones
La operación de busqueda y de baja son casi identicas a las vistas en árboles B.

La diferencia principal radica en el proceso de inserción, y es lo que se dedica a analizar el libro:

### Operaciones de inserción sobre árboles B*
En arboles B*, en caso de overflow, antes de dividir, se puede redistribuir. Esta acción demora la generación de nuevos nodos, tendiendo a tener 'arboles con menor altura que los B, por tanto aumentando la performance, ya que menor altura implica menos lecturas para las operaciones.

Entonces, en caso de overflow en una inserción, primero se intenta redistribuir con los nodos adyacentes hermanos. Si el hermano no está lleno, entonces puede redistribuir.
El elemento central va al padre. Las otros dos van a grupos se dividen a los nodos.

En caso de que el hermano adyacente si esté lleno, hay que dividir.

Se toman el primer nodo, el elemento padre, y el segundo nodo. Se crea un nuevo nodo y se dividen equitativamente.
Quedan 3 nodos llenos a 2/3. Se promocionan separadores al padre.

# Árboles B+
## Definición
Un árbol B+ es un árbol multicamino con las siguientes propiedades:
1. Cada nodo del árbol puede contener, como máximo, M descendientes y M-1 elementos.
2. La raíz no posee descendientes o tiene al menos dos.
3. Un nodo con X descendientes, contiene x-1 elementos.
4. Los nodos terminales tienen, como mínimo, ([M/2]-1) elementos, y como máximo, M-1 elementos.
5. Los nodos que no son terminales ni raíz tienen como mínimo [M/2] descendientes.
6. Todos los nodos terminales se encuentran en el mismo nivel.
7. Los nodos terminales representan el conjunto de datos y están entrelazados entre ellos.

Esta última propiedad permite hacer un recorrido secuencial ordenado.

Los elementos están solo en las hojas, los nodos internos son separadores.

En caso de dividir una hoja, se promociona una copia que actua como separador.

Si se divide un nodo interno, se promociona el elemento en si.

Para borrar un elemento de un árbol B+, siempre se borra de un nodo terminal, y si hubiese copia de ese elemento en un nodo interno, esta copia se mantiene porque sigue actuando como separador, salvo que rompa el criterio de órden, en cuyo caso corresponde actualizarla.

