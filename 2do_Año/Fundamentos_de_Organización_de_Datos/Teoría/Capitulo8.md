# Dispersión (Hashing)
> Capítulo 8

## Definición:
El hashing es un mecanismo que trata de conseguir una rapida recuperación de los registros, en un solo acceso en promedio. Es una tecnica que convierte la clave asociada a un registro de datos en un numero aleatorio, el cual posteriormente es utilizado para determinar donde se almacena dicho registro.

## Limitaciones
* Los archivos deben ser de longitud fija.
* No es posible obetener un orden lógico de los datos
* No es posible tratar con claves duplicadas.

## Tipos de dispersión
### Hashing con espacio de direccionamiento estático
Se denomina hashing estático a aquella política donde el espacio disponible para dispersar los reistros de un archivo de datos está fijado previamente.
Así, la función de hash aplicada a una clave da como resultado una dirección física posible dentro del espacio disponible para el archivo.

### Hashing con espacio de direccionamiento dinámico
Se denomina hashing dinámico a aquella política donde el espacio disponible para dispersar los registros de un archivo de datos aumenta o disminuye en fución de las necesidades de espacio que en cada momento tiene el archivo. Así, la función de hash aplicada a una clave da un valor intermedio, que será utilizado para obtener una dirección física posible para el archivo. Estas direcciones físicas no están establecidas a priori y son generadas de manera dinámica.

# Hash estático
Se denomina hashing estático a aquella política donde el espacio disponible para dispersar los reistros de un archivo de datos está fijado previamente.
Así, la función de hash aplicada a una clave da como resultado una dirección física posible dentro del espacio disponible para el archivo.
##### Conceptos clave:

> ##### Sinonimo
> Dos claves son sinonimas cuando la función de hash les retorna una misma salida.

>##### Colisión
>Cuando dos registros intentan almacenarse en la misma dirección de memoria.

>##### Desborde (overflow)
>Ocurre overflow cuando un registro es direccionado a un nodo que no dispone de capacidad para almacenarlo.


## Parámetros de dispersión:
El hashing, cuando se utiliza espacio de direccionamiento estático, presenta cuatro parámetros escenciales que definen su comportamiento.

### Función de hash
Una función de hash es una función que transforma un valor, que representa una clave primaria de un registro, en otro valor dentro de un rango determinado, que se utiliza como dirección física de acceso para insertar un registro en un archivo de datos.

Esta función debe esparcir los registros de la maneramás uniformemente posible, es decir, que a cada clave se le asigne una dirección física distinta.

### Tamaño de cada nodo de almacenamiento
El tamaño ideal de un nodo queda determinado, al igual que en árboles, por la capacidad de transferencia de información RAM <-> Disco

### Densidad de empaquetamiento
Se define la Densidad de Empaquetamiento (DE) como la relación entre el espacio disponible para el archivo de datos y la cantidad de registros que integran dicho archivo.

La fórmula para calcularla es la la cantidad de registros que componen un archivo ( r ) dividido el espacio disponible para almacenar ese archivo. 
> El espacio disponible se define como la cantidad de nodos direccionables por la función de hash  ( n ), y la cantidad de registros que cada nodo puede almacenar, Registros por Nodo ( RPN )

`DE = r / (RPN * n)`

A mayor densidad de empaquetamiento, lógicamente, mayor es la probabilidad de colisiones.

Si la densidad de empaquetamiento es muy baja, se desperdicia espacio en el disco, dado que se utiliza menos que el reservado, generando fragmentación.

### Métodos de tratamiendo de desbordes (overflow)
Un desborde o overflow ocurre cuando un registro es direccionado a un nodo que no dispone de capacidad para almacenarlo.

Cuando esto ocurre, deben realizarse dos acciones:
Encontrar lugar para el registro en otra dirección y asegurarse que el registro posterioremente sea encontrado en esa nueva dirección.

## Resolución de colisiones con overflow
Incluso con una buena función de hash y con una densidad de empaquetamiento baja, siempre es probable que se produzcan overflow.

Por tanto, se debe contar con algún método para reubicar a aquellos registros que no pueden ser almacenados en la dirección obtenida a partir de la función de hash.

### Saturación progresiva
El método consiste en almacenar el registro en la dirección libre siguiente más próxima al nodo donde se produce la saturación.

Al buscar un elemento, la dirección base dada por la función de hash seguirá siendo la misma, entonces, a partir de ahí debe buscarse secuencialmente en los siguientes nodos hasta encontrar el elemento o hasta encontrar un nodo que no esté completo.

Al hacer una eliminación, hay que usar una marca para indicar que ese nodo alguna vez estuvo saturado, a fin de no impedir la busqueda potencial de registros.

Potencialmente se podría requerir chequear todas las direcciones para intentar localizar un registro.

### Saturación progresiva encadenada
En lineas generales este método trabaja igual que el anterior.

Un elemento que se intenta almacenar en una dirección ocupada, es direccionada a la inmediata siguiente libre.

La diferencia radica en que, una vez localizada la nueva dirección, esta se encadena o enlaza con la dirección base inicial, generando una lista de busqueda de elementos.

En terminos de performance, es mejor que el anterior.
Sin embargo, requiere que cada nodo manipule información extra: el enlace al siguiente.

### Doble dispersión
El problema de la saturación progresiva es que a medida que se producen saturaciones, los registros tienden a esparcirse por nodos cercanos. Esto podría provocar un exceso de saturación sectorizada,

El método de doble dispersión consiste en disponer de dos funciones de hash.

La primera obtiene la dirección base.

En caso de overflow, se utiliza la segunda función de hash. Esta segunda función no retorna una dirección, sino un desplazamiento. Este desplazamiento se le suma a la dirección base para obtener una nueva dirección donde se intentará almacenar el registro. En caso de otro overflow, se sigue desplazando lo que indica la segunda función de hash hasta encontrar un lugar.

Lo malo es que los registros en overflow tienden a ubicarse lejos de sus direcciones base, lo cual produce un mayor desplazamiento de la cabeza lectora del disco duro, aumentando la latencia y el tiempo de respuesta.

### Area de desborde por separado
Ante la ocurrencia de overflow, los registros son dispersados en nodos que no corresponden con su dirección base original. Así a medida que se completa un archivo por dispersión, pueden existir muchos registros ocupando direcciones que originalmente no les correspondían, disminuyendo la performance final del método.

El método con area de desborde por separado, se distinguen dos tipos de nodos: aquellos direccionables por la función de hash y aquellos de reserva, que solo podrán ser utilizados en caso de saturación pero que no son alcanzables por la función de hash.

Se tiene un enlace desde cada nodo en la tabla de hash a la dirección del area de desborde separada, que apunta al sinonimo que entró en overflow.

# Hash dinámico
Se denomina hashing dinámico a aquella política donde el espacio disponible para dispersar los registros de un archivo de datos aumenta o disminuye en fución de las necesidades de espacio que en cada momento tiene el archivo. Así, la función de hash aplicada a una clave da un valor intermedio, que será utilizado para obtener una dirección física posible para el archivo. Estas direcciones físicas no están establecidas a priori y son generadas de manera dinámica.

## Hash extensible
El método de hash extensible es una alternativa de implementeación para hash con espacio de direccionamiento dinámico.

Se comienza con un único nodo para guardar registros, a medida que los nodos se van completando, se duplica su cantidad.

Acá no aplica el concepto de Densidad de Empaquetamiento, ya que el espacio utilizado en disco aumenta o disminuye, de manera dinámica, en función de lo que se requiere en cada momento.

En este método la función de hash retorna un strig de bits. La cantidad de bits que retorna determina la cantidad máxima de direcciones a las que puede acceder el método.

El método necesita para su implementación de una estructura auxiliar. Esta estructura es una tabla que contiene la dirección física de cada nodo.

Si se intenta insertar en un nodo lleno, deben reubicarse todos los registros allí contenidos entre el nodo viejo y el nuevo.

Se asegura encontrar cada registro en un solo acceso.