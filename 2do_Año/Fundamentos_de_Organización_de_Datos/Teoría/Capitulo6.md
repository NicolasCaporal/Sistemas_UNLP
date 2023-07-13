# Árboles. Introducción
> Capítulo 6

Las estructuras del tipo árbol presentan mejoras tanto para la velocidad de busqueda como para el mantenimiento del orden de la información.

## Árboles binarios
### Definición
**Un árbol binario  es una estructura de datos dinámica no lineal, en la cual cada nodo puede tener a lo sumo dos hijos.**

La estructura del árbol binario tiene sentido si está ordenado. Es decir un Árbol Binario de Busqueda.

Al buscar, se comienza de la raiz, si es el elemento buscado se finaliza, sino se va hacia la izquierda o derecha dependiendo si es menor o mayor, descartando la mitad de los elementos en cada paso.
Encontrar un elemento en un arbol binario de busqueda es de O(log(n)).

Para utilizarlo como índice, es necesario que esté implementado sobre memoria secundaria, perdiendo performance, pero preservando la integridad de los datos.

Implementar un índice con árbol mejora tanto la inserción de nuevos datos como la baja. En cuánto a la busqueda son iguales a tener un archivo ordenado, ya que se realizaba busqueda dicotomica O(log(n)).

## Problema con los árboles binarios
El desempeño de los arboles binarios es bueno cuando se encuentran balanceados.

Se entiende por árbol balanceado a aquel árbol donde la trayectoria de la raíz hasta las hojas está representada por la misma cantidad de nodos. Es decir, todos los nodos hojas se encuentran en el mismo nivel.

El gran problema de los árboles binarios es que se desbalancean fácilemente, de hecho, pueden incluso degenerarse en una lista, llegando a bajar su performance en el peor de los casos a una busqueda de orden lineal, O(n).

El árbol binario funciona bien como índice si está balanceado, lo que depende de que la raíz sea un valor intermedio, depende del orden en el que se ingresan los datos, lo cual está fuera de nuestro control.

## Árboles AVL
Los árboles balanceados en altura son árboles binarios cuya construcción se determina respetando un precepto muy simple: la diferencia entre el camino más corto y el más largo entre un nodo terminal y la raíz no puede diferir en más que 1.

El hecho de mantener balanceado el árbol, es muy costoso, ya que se implementa un algoritmo que accede muchas veces a disco para reacomodar las referencias de multiples nodos. 

Lo importante a destacar es que, por la cantidad de accesos a disco para mantener el balanceo del arbol, el usarlos como índice no es viable.

## Árboles binarios paginados
Al generar el archivo que contiene el árbol binario, dicho arbol se divide en páginas, en bloques, cada página contiene un conjunto de nodos que se encuentran físicamente cerca en memoria secundaria.

Así, cuando se accede al disco no se trae solo un registro, sino que se trae una página completa, muchos registros, al buffer, para trabajar con ellos.

Se aumenta la performance, se disminuyen los accesos a disco.

El problema nuevamente es que, para que los elementos cercanos en el dibujo del arbol esten también cercanos en memoria secundaria, deben llegar en un orden muy específico, lo cual está fuera de nuestro control.

## Árboles multicamino
### Definición
**Un árbol multicamino es una estructura de datos en la cual cada nodo puede contener k elementos y k+1 nodos.**

Se define el concepto de **orden** de un árbol multicamino como la máxima cantidad de descendientes posibles de un nodo.
 
En este caso, el tamaño de la página está dado por el orden del árbol.
Al leer de disco, se trae el nodo entero al buffer.

Los arboles multicamino aún tienen pendiente resolver el tema del balanceo...