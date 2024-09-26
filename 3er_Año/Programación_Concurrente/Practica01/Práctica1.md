# Práctica 1 – Variables compartidas


## Ejercicio 1
**Para el siguiente programa concurrente suponga que todas las variables están inicializadas en 0 antes de empezar. Indique cual/es de las siguientes opciones son verdaderas:
a) En algún caso el valor de x al terminar el programa es 56.
b) En algún caso el valor de x al terminar el programa es 22.
c) En algún caso el valor de x al terminar el programa es 23.**

| P1:: <br> If (x = 0) then <br> y:= 4*2; <br> x:= y + 2; | P2:: <br> If (x > 0) then <br> x:= x + 1; | P3:: <br> x:= (x * 3) + (x * 2) + 1; |
|:---------------------------------------------------------|:-------------------------------------------|:----------------------------------|



### Respuesta:
**a)** Verdadero. 
Si se ejecunta P1 entero, luego P2 entero, y luego P3 entero, el resultado es 56.

**b)** Verdadero. 
*Con el siguiente orden:*
* P3 inicia: x * 3 de P3 (0 * 3 = 0)
* P1 entero: Como x = 0, setea X en 10
* P3 termina: (x * 2) + 1 = 21
* P2 entero: como x > 0, x = x + 1 = 21

**C)** Verdadero. 
*Con el siguiente orden:*
* P3 inicia: x * 3 de P3 (0*3 = 0)
* P1 entero: Como x = 0, setea X en 10
* P2 entero: como x > 0, x = x + 1 = 11
* P3 termina: (x * 2) + 1 = 23

---

## Ejercicio 2
**Realice una solución concurrente de grano grueso (utilizando <> y/o <await B; S>) para el siguiente problema:**

**Dado un número N verifique cuántas veces aparece ese número en un arreglo de longitud M. Escriba las pre-condiciones que considere necesarias**

### Respuesta:
```go
array Arreglo;
int total = 0;
int v[M] = inicializar;
int N = algun_numero;

process recorrer[id: 0..M-1]{
    if(v[id] == N){
        <total := total + 1;>
    }
} 
```

---

## Ejercicio 3
**3. Dada la siguiente solución de grano grueso:
a) Indicar si el siguiente código funciona para resolver el problema de Productor/Consumidor con un buffer de tamaño N. 
En caso de no funcionar, debe hacer las modificaciones necesarias.**

```go
int cant = 0; 
int pri_ocupada = 0; 
int pri_vacia = 0; 
int buffer[N];

Process Productor:: {
    while (true) { 
        produce elemento
        <await (cant < N); cant++>
        buffer[pri_vacia] = elemento;
        pri_vacia = (pri_vacia + 1) mod N;
    }
}

Process Consumidor:: {
    while (true) {
        <await (cant > 0); cant-- >
        elemento = buffer[pri_ocupada];
        pri_ocupada = (pri_ocupada + 1) mod N;
        consume elemento
    }
}
```

**b) Modificar el código para que funcione para C consumidores y P productores.**

### Respuesta:
#### a)
No, no resuelve el problema.
Podría aumentarse cant en el Productor, no llegar a hacer buffer[pri_vacia] = elemento, y que tome el control el Consumidor. En ese caso, intenaría tomar un elemento de un lugar del buffer vacío.

De igual manera en el otro sentido. Podría pasar que al disminuir cant en el Consumidor, no llegar a copiar el elemento con elemento = buffer[pri_ocupada], y que tome el control el Productor. En ese caso, se sobrescribiría el elemento, perdiendo un dato en el camino.
```go
int cant = 0; 
int pri_ocupada = 0; 
int pri_vacia = 0; 
int buffer[N];

Process Productor:: {
    while (true) { 
        //produce elemento
        <await (cant < N); cant++; 
        buffer[pri_vacia] = elemento;>
        pri_vacia = (pri_vacia + 1) mod N;
    }
}

Process Consumidor:: {
    while (true) {
        <await (cant > 0); cant--; 
        elemento = buffer[pri_ocupada];>
        pri_ocupada = (pri_ocupada + 1) mod N;
        //consume elemento
    }
}
```

#### b)
```go
int cant = 0; 
int pri_ocupada = 0; 
int pri_vacia = 0; 
int buffer[N];

Process Productor[id = 0 .. P-1] {
    while (true) { 
        //produce elemento
        <await (cant < N); cant++; 
        buffer[pri_vacia] = elemento;
        pri_vacia = (pri_vacia + 1) mod N;>
    }
}

Process Consumidor[id= 0 .. C-1] {
    while (true) {
        <await (cant > 0); cant--; 
        elemento = buffer[pri_ocupada];
        pri_ocupada = (pri_ocupada + 1) mod N;>
        //consume elemento
    }
}
```

---

## Ejercicio 4
**Resolver con SENTENCIAS AWAIT (<> y <await B; S>).**

**Un sistema operativo mantiene 5 instancias de un recurso almacenadas en una cola, cuando un proceso necesita usar una instancia del recurso la saca de la cola, la usa y cuando termina de usarla la vuelve a depositar.**

### Respuesta
```go
colaRecurso c [5];
cant = 0;

Process proceso[id: 1 .. N]{
    while (true) {
        < await (cant<5); 
        recurso = c.pop(); 
        cant++; >
        
        // usa el recurso

        < c.push(recurso);
        cant--; > 
    }
}
```


---

## Ejercicio 5

**En cada ítem debe realizar una solución concurrente de grano grueso (utilizando <> y/o <await B; S>) para el siguiente problema, teniendo en cuenta las condiciones indicadas en el item.**

**Existen N personas que deben imprimir un trabajo cada una.**

**a) Implemente una solución suponiendo que existe una única impresora compartida por todas las personas, y las mismas la deben usar de a una persona a la vez, sin importar el orden. Existe una función Imprimir(documento) llamada por la persona que simula el uso de la impresora. Sólo se deben usar los procesos que representan a las Personas.**

**b) Modifique la solución de (a) para el caso en que se deba respetar el orden de llegada.**

**c) Modifique la solución de (a) para el caso en que se deba respetar el orden dado por el identificador del proceso (cuando está libre la impresora, de los procesos que han solicitado su uso la debe usar el que tenga menor identificador).**

**d) Modifique la solución de (b) para el caso en que además hay un proceso Coordinador que le indica a cada persona que es su turno de usar la impresora.**

### Respuesta
#### a)

Implemente una solución suponiendo que existe una única impresora compartida por todas las personas, y las mismas la deben usar de a una persona a la vez, sin importar el orden. Existe una función Imprimir(documento) llamada por la persona que simula el uso de la impresora. Sólo se deben usar los procesos que representan a las Personas.

```go
Process persona[id: 0 .. N-1]{
    < Imprimir(documento); >
}
```

#### b)

Modifique la solución de (a) para el caso en que se deba respetar el orden de llegada.

```go
cola C;
siguiente = -1;

Process persona[id: 0 .. N-1]{
    <if (siguiente == -1) 
        siguiente = id
    else 
        c.agregar(id) >

    <await(siguiente == id)>
    Imprimir(documento);

    <if (c.isEmpty())
        siguiente = -1
    else 
        siguiente = Sacar(C)>;
}
```


#### c)

Modifique la solución de (a) para el caso en que se deba respetar el orden dado por el identificador del proceso (cuando está libre la impresora, de los procesos que han solicitado su uso la debe usar el que tenga menor identificador).

```go
Actual = 0;

Process persona[id: 0 .. N-1]{
    <await(Actual == id)>
    Imprimir(documento);
    <Actual = id++>
}
```


#### d)

Modifique la solución de (b) para el caso en que además hay un proceso Coordinador que le indica a cada persona que es su turno de usar la impresora. 
Existe una única impresora compartida por todas las personas, y las mismas la deben usar de a una persona a la vez (Respetar orden de llegada) 

```go
cola C;
siguiente = -1;
enUso = false;

Process persona[id: 0 .. N-1]{
    < c.agregar(id) >
    <await(Siguiente == id)>
    enUso = true;
    Imprimir(documento);
    enUso = false;
}


Process Cordinador{
    <await (enUso == false)>
    <await (not c.isEmpty())> 
    Siguiente = Sacar(C);
    <await (enUso == true)>
}
```

---

## Ejercicio 6

**Dada la siguiente solución para el Problema de la Sección Crítica entre dos procesos (suponiendo que tanto SC como SNC son segmentos de código finitos, es decir que terminan en algún momento), indicar si cumple con las 4 condiciones requeridas:**
> **Problema de la Sección Crítica:** *implementación de acciones atómicas en software (locks).*
> **Propiedades:**
> Exclusión mutua, Ausencia de death lock, Ausencia de demora innecesaria, Eventual entrada.

```go
int turno = 1;

Process SC1:: { 
    while (true) {
        while (turno == 2) skip;
        SC;
        turno = 2;
        SNC;
    }
}

Process SC2:: {
    while (true) {
        while (turno == 1) skip;
        SC;
        turno = 1;
        SNC;
    }
}
```

### Repuesta:
Si, se cumplen las 4 condiciones del Problema de la Sección Crítica.
Estas son:

##### Exclusión mutua
A lo sumo un proceso está en su SC

##### Ausencia de Deadlock (Livelock)
Si 2 o más procesos tratan de entrar a sus SC, al menos uno tendrá éxito.

##### Ausencia de Demora Innecesaria: 
Si un proceso trata de entrar a su SC y los otros están en sus SNC o terminaron, el primero no está impedido de entrar a su SC.
> Solo tengo dudas de si esta propiedad se cumple... Tal vez el Proceso 1 SÍ terminó su sección crítica, peeero no ejecutó turno = 2; por tanto el otro esperaría al pedo... ¿no?

##### Eventual Entrada: 
un proceso que intenta entrar a su SC tiene posibilidades de hacerlo (eventualmente lo hará).

---

## Ejercicio 7
**Desarrolle una solución de grano fino usando sólo variables compartidas (no se puede usar las sentencias await ni funciones especiales como TS o FA). En base a lo visto en la clase 3 de teoría, resuelva el problema de acceso a sección crítica usando un proceso coordinador. En este caso, cuando un proceso SC[i] quiere entrar a su sección crítica le avisa al coordinador, y espera a que éste le dé permiso. Al terminar de ejecutar su sección crítica, el proceso SC[i] le avisa al coordinador. Nota: puede basarse en la solución para implementar barreras con “Flags y coordinador” vista en la teoría 3.**

```go
int actual = -1;

process SC[i: 0 .. N-1]{
    while (true){
        while(actual <> i) skip;
        SC
        listo = true;
        while(listo) skip;
    }
}

process coordinador{
    while(true){
        for j = 0..n-1 {
            actual = j;
            while(!listo) skip;
            listo = false;
        }
    }
}
```


## Ejercicio 4
**Suponga  que  existe  una  BD  que  puede  ser  accedida  por  6  usuarios  como  máximo  al  mismo  tiempo.  Además,  los  usuarios  se  clasifican  como  usuarios  de  prioridad  alta  y  usuarios de prioridad baja. Por último, la BD tiene la siguiente restricción:** 
**• no puede haber más de 4 usuarios con prioridad alta al mismo tiempo usando la BD.**
**• no puede haber más de 5 usuarios con prioridad baja al mismo tiempo usando la BD.**
**Indique si la solución presentada es la más adecuada. Justifique la respuesta.**
```go
Var 
 total: sem := 6; 
 alta: sem := 4; 
 baja: sem := 5;

Process Usuario-Alta [I:1..L]::{ 
    P (total); 
    P (alta); 
    //usa la BD 
    V(total); 
    V(alta); 
} 

Process Usuario-Baja [I:1..K]:: {    
    P (total); 
    P (baja); 
    //usa la BD 
    V(total); 
    V(baja); 
} 
```

### Respuesta:
No, la solución no es correcta.
Podría suceder que un proceso pase el semaforo del total, y luego se encuentre con que no hay más espacio para los de su prioridad, bloqueando el acceso a los de la otra prioridad.
Debería chequearse primero la prioridad y luego el total.

## Ejercicio 5
**En una empresa de logística de paquetes existe una sala de contenedores donde se preparan las entregas. Cada contenedor puede almacenar un paquete y la sala cuenta con capacidad para N contenedores. Resuelva considerando las siguientes situaciones:**
**a) La empresa cuenta con 2 empleados: un empleado Preparador que se ocupa de preparar los paquetes y dejarlos en los contenedores; un empelado Entregador que se ocupa de tomar los paquetes de los contenedores y realizar la entregas. Tanto el Preparador como el Entregador trabajan de a un paquete por vez.**
**b) Modifique la solución a) para el caso en que haya P empleados Preparadores.**
**c) Modifique la solución a) para el caso en que haya E empleados Entregadores.**
**d) Modifique la solución a) para el caso en que haya P empleados Preparadores y E empleadores Entregadores.**

### Respuesta:
#### a)
```go
Pila[N] contenedores; 
sem vacio = 1; 
sem lleno = 0;

Process preparador {
    while (true){
        //prepara pedido;
        P(vacio);
        contenedores.push(paquete);
        V(lleno);
    }
}

Process entregador {
    while (true){
        P(lleno);
        paquete = contenedores.pop();
        V(vacio);
        //entregar pedido;
    }
}
```

#### b)
```go
Pila[N] contenedores; 
sem vacio = 1; 
sem lleno = 0;
sem mutexPreparadores = 1;

Process preparador [id: 0 .. P-1] {
    while (true){
        //prepara pedido;
        P(vacio);
        P(mutexPreparadores);
        contenedores.push(paquete);
        V(mutexPreparadores);
        V(lleno);
    }
}

Process entregador {
    while (true){
        P(lleno);
        paquete = contenedores.pop();
        V(vacio);
        //entregar pedido;
    }
}
```

#### c)
```go
Pila[N] contenedores; 
sem vacio = 1; 
sem lleno = 0;
sem mutexEntregadores = 1;

Process preparador {
    while (true){
        //prepara pedido;
        P(vacio);
        contenedores.push(paquete);
        V(lleno);
    }
}

Process entregador [id: 0 .. E-1] {
    while (true){
        P(lleno);
        P(mutexPreparadores);
        paquete = contenedores.pop();
        V(mutexPreparadores);
        V(vacio);
        //entregar pedido;
    }
}
```

#### d)
```go
Pila[N] contenedores; 
sem vacio = 1; 
sem lleno = 0;
sem mutexPreparadores = 1;
sem mutexEntregadores = 1;

Process preparador [id: 0 .. P-1] {
    while (true){
        //prepara pedido;
        P(vacio);
        P(mutexPreparadores);
        contenedores.push(paquete);
        V(mutexPreparadores);
        V(lleno);
    }
}

Process entregador [id: 0 .. E-1] {
    while (true){
        P(lleno);
        P(mutexPreparadores);
        paquete = contenedores.pop();
        V(mutexPreparadores);
        V(vacio);
        //entregar pedido;
    }
}
```


### Ejercicio 6
**Existen N personas que deben imprimir un trabajo cada una. Resolver cada ítem usando semáforos:**
**a) Implemente una solución suponiendo que existe una única impresora compartida por todas las personas, y las mismas la deben usar de a una persona a la vez, sin importar el orden. Existe una función Imprimir(documento) llamada por la persona que simula el uso de la impresora. Sólo se deben usar los procesos que representan a las Personas.**
**b) Modifique la solución de (a) para el caso en que se deba respetar el orden de llegada.**
**c) Modifique la solución de (a) para el caso en que se deba respetar estrictamente el orden dado por el identificador del proceso (la persona X no puede usar la impresora hasta que no haya terminado de usarla la persona X-1).**
**d) Modifique la solución de (b) para el caso en que además hay un proceso Coordinador que le indica a cada persona que es su turno de usar la impresora.**
**e) Modificar la solución (d) para el caso en que sean 5 impresoras. El coordinador le indica a la persona cuando puede usar una impresora, y cual debe usar**

### Respuesta:
#### a)
```go
sem impresora = 1;

Process Persona [id: 1 .. N-1]{
    P(impresora);
    Imprimir(documento);
    V(impresora);
}
```

#### b)
```go
Cola C;
sem mutex = 1;
sem impresora = 1;

Process Persona [id: 1 .. N-1]{
    P(cola);
    cola.agregar(id);
    P(impresora);
    Imprimir(documento);
    V(impresora);
}
```