# Práctica 2 – Variables compartidas

## Ejercicio 1
**Existen N personas que deben ser chequeadas por un detector de metales antes de poder ingresar al avión.**
**a. Analice  el  problema  y  defina  qué  procesos,  recursos  y  semáforos/sincronizaciones serán necesarios/convenientes para resolverlo.**
**b. Implemente una solución que modele el acceso de las personas a un detector (es decir, si el detector está libre la persona lo puede utilizar; en caso contrario, debe esperar).** 
**c. Modifique su solución para el caso que haya tres detectores.**  
**d. Modifique la solución anterior para el caso en que cada persona pueda pasar más de una vez, siendo aleatoria esa cantidad de veces.**

### Respuesta:
#### a)
**Procesos:**
* Persona
**Recursos:**
* Detector
**Semáforos:**
* Un solo semáforo

#### b)
```go
sem mutex = 1;
Detector detector;

Process Persona[id: 0 .. N-1] {
    P(mutex);
    detector.pasar();
    V(mutex)
}
```

#### c)
```go
sem mutex = 3;

Process Persona[id: 0 .. N-1] {
    P(mutex);
    detector.pasar();
    V(mutex)
}
```

#### d)
```go
sem mutex = 3;

Process Persona[id: 0 .. N-1] {
    P(mutex);
    for (i = 1 .. num.random()){
        detector.pasar();
    }
    V(mutex)
}
```

---

## Ejercicio 2
**Un sistema de control cuenta con 4 procesos que realizan chequeos en forma colaborativa. Para ello, reciben el historial de fallos del día anterior (por simplicidad, de tamaño  N). De  cada  fallo,  se  conoce  su  número  de  identificación  (ID)  y  su  nivel  de  gravedad (0=bajo, 1=intermedio, 2=alto, 3=crítico). Resuelva considerando las siguientes situaciones:**
**a) Se debe imprimir en pantalla los ID de todos los errores críticos (no importa el orden).**
**b) Se debe calcular la cantidad de fallos por nivel de gravedad, debiendo quedar los resultados en un vector global.**
**c) Ídem  b)  pero  cada  proceso  debe  ocuparse  de  contar  los  fallos  de  un  nivel  de gravedad determinado.**

### Respuesta:

#### a)
```go
sem mutex = 1;
Cola[N] errores;
cant = 0;

Process Chequear [id: 1 .. 4] {
    P(mutex);
    while (N > cant){
        cant++;
        error = C.pop();
        V(mutex);
        if (error.getGravedad() == 3){
            Imprimir(error.getID());
        }
        P(mutex);
    }
    V(mutex);
}
```

#### b)
```go
sem mutex = 1;
Cola[N] errores;
Vector[4] cantErrores;
cant = 0;

Process Chequear [id: 1 .. 4] {
    P(mutex);
    while (N > cant){
        cant++;
        error = C.pop();
        V(mutex);
        cantErrores[error.getGravedad()]++;
        P(mutex);
    }
    V(mutex);
}
```

#### c)
```go
sem mutex = 1;
Cola[N] errores;
Vector[4] cantErrores;
cant = 0;

Process Chequear [id: 1 .. 4] {
    P(mutex);
    while (N > cant){
        cant++;
        error = C.pop();
        if (error.getGravedad() == id){
            cantErrores[error.getGravedad()]++;
        } else {
            c.push(error);
        }
        V(mutex);
        P(mutex);
    }
    V(mutex);
}
```

### PREGUNTAR:
> ¿Hay conflicto en la concurrencia cuando dos procesos acceden a diferentes posiciones de un vector? ¿es crítico o no hay drama?.
> Si es crítico, está bien hecho. Si no pasa nada, tengo que liberar antes ☝

---

## Ejercicio 3
**Un  sistema  operativo  mantiene  5  instancias  de  un  recurso  almacenadas  en  una  cola. Además, existen P procesos que necesitan usar una instancia del recurso. Para eso deben  sacar la instancia de la cola antes de usarla. Una vez usada, la instancia debe ser encolada nuevamente para su reúso.**

```go
Cola[5] recursos;
sem mutex = 5;
sem acceso = 1;

Process preceso_SO [id: 0 .. P-1] {
    P(mutex);

        P(acceso);
        recurso = cola.pop();
        V(acceso);

        recurso.usar();

        P(acceso);
        cola.push(recurso);
        V(acceso);

    V(mutex);
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
colaLlegada c;
sem espera[P] = ([P] 0);
sem mutex = 1;
bool libre = true;

Process persona [i: 0 .. P-1]{

    int aux;
    P(mutex);
    if (libre){
        libre = false;
        V(mutex);
    } else {
        c.push(i);
        V(mutex);
        P(espera[i]);
    }

    Imprimir(documento);
    P(mutex);

    if (c.isEmpty()){
        libre = true;
    } else {
        aux = c.pop();
        V(espera[aux]);
    }
    V(mutex);
}
```

#### c)
```go
int actual = 0;
sem espera[P] = ([P] 0);

Process persona [id: 0 .. P-1]{
    if (actuak != id){ 
        P(espera[id]);
    }
    Imprimir(documento);
    actual++;
    V(espera[actual]);
}
```

#### d)
Modifique la solución de (b) para el caso en que además hay un proceso Coordinador que le indica a cada persona que es su turno de usar la impresora.
#### b)
```go
sem espera[P] = ([P] 0);
sem mutex = 1;
sem listo = 0;
sem llena = 0;
colaLlegada c;

Process persona [i: 0 .. P-1]{
    P(mutex);
    c.push(i);
    V(mutex);
    V(llena);
    P(espera[i]);
    Imprimir(documento);
    V(listo);
}

Process coordinador{
    int aux;
    for i = 0 .. P-1 {
        P(llena);
        P(mutex);
        aux = c.pop();
        V(mutex);
        V(espera[aux]);
        P(listo);
    }
}
```