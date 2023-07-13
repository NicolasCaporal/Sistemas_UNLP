# Introducción a las bases de datos
El presente archivo es una sintesis o resumen para uso personal del libro de referencia de la catedra, de los capitulos 1 al 9.
En varias ocaciones se ha citado de manera textual e identica al libro, en otras se han modificado palabras para favorecer mi comprensión, que podrían cambiar o no el sentido de la frase original.
***Se recomienda consultar el libro en cuestión.***

**Bertone, R y Thomas, P. (2011). Introducción a las Bases de Datos. Fundamentos y Diseño. Buenos Aires: Pearson Education.**

# Introducción a las bases de datos
El presente archivo es una sintesis o resumen para uso personal del libro de referencia de la catedra, de los capitulos 1 al 9.
En varias ocaciones se ha citado de manera textual e identica al libro, en otras se han modificado palabras para favorecer mi comprensión, que podrían cambiar o no el sentido de la frase original.
***Se recomienda consultar el libro en cuestión.***

**Bertone, R y Thomas, P. (2011). Introducción a las Bases de Datos. Fundamentos y Diseño. Buenos Aires: Pearson Education.**

# Indice
1. Archivos
2. Algoritmica sobre archivos
3. Eliminacion de datos
4. Busqueda de información. Manejo de indices.
5. Arboles
6. Dispersión (Hashing)

# ARCHIVOS
### Definición:
**Un archivo es una estructura de datos que recopila, en un dispositivo de almacenamiento secundario de una computadora, una colección de elementos del mismo tipo.**

Es decir, los datos de un archivo son homogeneos por definición, y los mismos deben persistir en el tiempo.
Se encuentran en memoria secundaria (como puede ser un disco duro o un SSD) que no pierden la información al apagar la computadora, como si pasa con la memoria principal (RAM).
Otra diferencia a destacar entre la memorica principal y la memoria secundaria, es que la primera tiene menor capacidad pero tiempos de acceso más rápidos, y la segunda tiene gran capacidad pero tiempos de acceso, en comparación, mucho más lentos.

### Administración de archivos
Los archivos son manejados por algoritmos.
Un algoritmo no referencia a la posición de memoria de un archivo, al lugar físico, sino que tiene una visión lógica de este, utilizando el nombre de una variable, y manejandolo como si estuviera en memoria RAM.
Desde el algoritmo se establece una conexión con el sistema operativo (assign en pascal) y este es el responsable de la administración.

#### Archivo físico:
Es el archivo real, el residente en memoria secundaria y es administrado por el sistema operativo.

#### Archivo lógico:
Es el archivo utilizado desde el algoritmo.

### Organización de archivos
* Secuencia de bytes
* Registros y Campos

### Acceso a información contenida en los archivos
Se pueden definir tres formas de acceder a los datos de un archivo:
#### Secuencial:
El acceso a cada elemento de datos se realiza luego de haber accedido a su inmediato anterior. El recorrido es, entonces, desde el primero hasta el útlimo de los elementos, siguiendo el orden físico de estos.

#### Secuencial indizado:
El acceso a los elementos de un archivo se realiza teniendo presente algún tipo de organización previa, sin tener en cuenta el orden físico.

#### Directo:
Es posible recuperar un elemento de dato de un archivo con un solo acceso, conociendo sus carácteristicas, más allá de que exista un orden lógico o físico determinado.

> Durante este capitulo se tratará con archivos de acceso secuencial

### Tipos de archivos
De acuerdo a la forma de acceso, se clasifican en:
* **Archivo serie:** Cada registro es accesible solo luego de procesar su antecesor (acceso secuencial físico)
* **Archivo secuencial:** Los registros son accesibles en orden de alguna clave (acceso secuencial indizado o lógico)
* **Directo:** Se accede al registro deseado (acceso directo)

### Operaciones básicas sobre archivos:
Para poder operar con archivos, todos los lenguajes de programación deben contar con algunas operaciones básicas:
* La definición del archivo lógico que utilizará el algoritmo y la relación del nombre lógico con su almacenamiento en el disco duro
``Var archivo_logico: file of tipo_de_dato;``
``Assign(nombre_logico, nombre_fisico);``

* La definición de la forma de trabajo del archivo, que puede ser la creación inicial de un archivo o la utilización de uno ya existente.
``rewrite(nombre_logico);``
``reset(nombre_logico); ``

* La administración de datos (lectura y escritura)
`` read(nombre_logico, var_tipo);``
``write(nombre_logico, var_tipo); ``

### Operaciones escenciales:
Las operaciones escenciales sobre archivos son:
* **Alta:** Ingresar nuevos datos al archivo.
* **Modificación:** Alterar el contenido de algún dato del archivo.
* **Consulta:** Presentar el contenido total o parcial del archivo.
* **Baja:** Quitar información del archivo.