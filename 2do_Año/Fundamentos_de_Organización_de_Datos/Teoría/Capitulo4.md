# Eliminacion de datos
> Capítulo 4
## Definición 
Se denomina proceso de baja a aquel proceso que permite quitar información de un archivo.

**En el presente capitulo se analizara a la baja desde la algoritmica y performance**, sin tener en cuenta que en el contexto informatico actual donde la información es un bien preciado, la misma no se borra sino que se preserva en repositorios historicos.

**El proceso de baja puede llevarse a cabo de dos modos diferentes:**
* Baja lógica
* Baja física

## Baja física
Consiste en borar efectivamente la información del archivo, recuperando el espacio físico.
El elemento borrado es reemplazado por otro del mismo archivo, y se decrementa en 1 la cantidad de elementos.

La **ventaja** es que el archivo ocupa el lugar mínimo necesario.

La **desventaja** es que se tiene una performance menor.

**Para realizar la baja física existen, básicamente, dos tecnicas algoritmicas:**
* Generar un nuevo archivo con los elementos válidops, es decir, sin copiar los que se desea eliminar.
* Utilizar el mismo archivo de datos, generando los reacomodamientos que sean necesarios.

### Baja física generando nuevo archivo de datos
Básicamente se recorre el archivo original, copiando al nuevo archivo toda la información, menos la que se desea quitar.

Una vez finalizado el proceso se debe eliminar el archivo inicial de la memoria secundario, renombrando luego el generado con el nombre original.

Si el archivo tiene N elementos, se realizan N lecturas y N-1 escrituras.

Se debe notar que, una vez finalizado el proceso de generación del nuevo archivo, coexisten por un momento en el disco dos archivos: el original y el nuevo sin el registro borrado. Lo que significa que se debe disponer en memoria secundaria de la capacidad de almacenamiento suficiente para ambos archivos.

### Baja física utilizando el mismo archivo de datos
Se localiza el elemento a eliminar. Luego se hace un corrimiento, es decir se copia sobre el reistro el elemento siguiente, y así sucesivamente, repitiendo esta operatorio hasta el final del archivo.

Se hacen N lecturas, y la cantidad de escrituras depende del lugar donde se encuentre el elemento a borrar, en el peor de los casos serán N-1 escrituras.

## Baja lógica
Consiste en marcar como borrado (con alguna marca especial) el elemento que se desea quitar.

La **ventaja** es que tiene una gran performance. Se realiza solo una escritura.

La **desventaja** es que no se recupera el espacio borrado. Quedan espacios inutilizados, invisibles al usuario, pero que siguen ocupando espacio, el tamaño del espacio tiende a crecer.

## Recuperación de espacio
Al hacer baja física el espacio se recupera automáticamente.

El proceso de **baja lógica** deja espacios inutilizados con la marca de borrado, ocupando espacio en el disco, para recuperarlo hay dos opciones:

### Recuperar el espacio (compactación)
Compactar el archivo quiere decir recuperar el espacio.

Se debería hacerce una compactación cada cierto tiempo o bien ante la necesidad de espacio.

Básicamente consiste en realizar el proceso de baja física, eliminando aquellos reistros que contengan la marca de borrado.

### Recuperación dinamica del espacio (reasignación)
Consiste en recuperar el espacio al hacer altas en los espacios marcados.
Hay que tener cuidado si el archivo es de registros de longitud variable, ya que podría no caber.

Podría buscarse desde el principio recorriendo el archivo de manera lineal, pero es más eficiente la **técnica de lista invertida:**
Se cuenta con un espacio reservado para actuar como cabecera, que al comienzo marca que no hay elementos borrados. Si se elimina algún dato, se forma la lista invertida para que el proceso de recuperación de espacio sea mucho más eficiente.

## Archivos de longitud variable
Si bien trabajar con registros de lonmgitud fija presentan ventajas a la hora de realizar altas y bajas, es un hecho que se desperdicia espacio. Por tanto, a veces es conveniente trabajar con registros de longitud variable.

Trabajar con longitud predecible (fija) tiene una mayor operatividad, es más eficiente.
> Hoy en día las Bases de datos usan longitud fija, pues desperdiciar un byte, no es nada. Antes era impensado

Trabajar con lonitud variable, hay que maneralo desde el algoritmo, pero no se desperdicia espacio.

### Alternativas para registros de longitud variable
**Delimitadores de campo:** Utilizar algún caracter especial para delimitar donde termina cada campo del registro. Y si se tiene 4 campos, al llegar a 4 marcas, se sabe que terminó el registro.

**Indicador de longitud:** Al principio de cada campo, se indica de forma explicita cuanto ocupa el mismo.

### Recuperación de espacio en reistros con longitud variable
Luego de hacer una baja en un archivo de longitud variable, es natural querer recuperar el espacio.

Si queremos recuperar el espacio luego de una **baja lógica** con una alta, hay que tener en consideración, en primer lugar, si el nuevo registro cabe, podría no haber suficiente espacio.

Otro tema a considerar es, en caso de que haya más de un registro borrado en el que el nuevo registro puede ir, hay que decidir cual es la mejor opción. El mejor ajuste consiste en seleccionar el espacio más adecuado. Entendiendo por más adecuado a aquel espacio de menor tamaño donde quepa el registro.

### Fragmentación
Para detallar el proceso de selección de espacio, es necesario avanzar con el concepto de fragmentación.

**Hay fragmentación cuando un archivo ocupa más espacio de lo que realmente necesita.**

Existen 2 tipos de fragmentación:
* Interna
* Externa

#### Fragmentación interna
**Se demonima fragmentación interna a aquella que se produce cuando a un elemento de dato se le asigna mayor espacio del necesario.**

Los registros de longitud fija tienden a generar framentación interna cuando se le asigna a un campo, una cantidad mayor a la que suele necesitar. 
Por ejemplo nombre: string[50]; Siendo que la mayoría de nombres tendran menos de 20 caracteres. Desperdicia espacio. Se reserva lugar que no se utiliza.

#### Fragmentación externa
**Se denomina framentación externa al espacio disponible entre dos registros, pero que es demasiado pequeño para poder ser reutilizado.**

### Framentación y recuperación del espacio
Para intentar recuperar el espacio luego de una baja lógica en archivos de longitud variable hay tres alternativas para seleccionar el espacio a ocupar:
* **Primer ajuste:** Consiste en seleccionar el primer espacio disponible donde quepa el registro a insertar. Más eficiente en cuanto a tiempo, porque no requiere busqueda. Se asigna el espacio completo, genera fragmentación interna.
* **Mejor ajuste:** Consiste ne seleccionar el espacio más adecuado para el registro. Se considera espacio más adecuado a aquel de menor tamaño donde quepa el registro. Más eficiente en cuanto a espacio, pero requiere una busqueda. Se asigna el espacio completo, genera fragmentación interna.
* **Peor ajuste:** Consiste en seleccionar el espacio de mayor tamaño, asignando para el registro solo los bytes necesarios. Se asigna solo el espacio del necesario, el resto queda libre, enera fragmentación externa.

### Modificación
Modificar un registro existente puede significar que el nuevo registro requiera el mismo espacio, menos espacio o más espacio.

Eviidentemente si requiere el mismo espacio, no hay problema.

Si requiere menos espacio, no hay problema, porque cabe, pero se genera fragmentación interna.

Si requiere más espacio, si es un problema, pues no se puede reutilizar el mismo lugar. Lo que se hace es dar de baja el registro anterior, e insertar el nuevo de acuerdo con la politica de recuperación de espacio determinada.