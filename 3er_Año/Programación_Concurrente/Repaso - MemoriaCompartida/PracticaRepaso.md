# Semáforos


**1) Resolver los problemas siguientes:**
**a) En una estación de trenes, asisten P personas que deben realizar una carga de su tarjeta SUBE en la terminal disponible. La terminal es utilizada en forma exclusiva por cada persona de acuerdo con el orden de llegada. Implemente una solución utilizando únicamente procesos Persona.**
> Nota: la función UsarTerminal() le permite cargar la SUBE en la terminal disponible.

```go
sem mutex = 1;
bool libre = true;
cola listo[P] = semaforos(P, 0);

process Persona [id: 0 .. P-1]{
    int sig;

    P(mutex);
    if (libre){
        libre = false;
        V(mutex);
    } else {
        cola.push(id);
        V(mutex);
        P(listo[id])
    }

    UsarTerminal();
    
    P(mutex);
    if (cola.isEmpty()){
        libre = true;
    } else {
        sig = cola.pop();
        V(listo[sig]);
    }
    V(mutex);
}
```


**b) Resuelva el mismo problema anterior pero ahora considerando que hay T terminales disponibles. Las personas realizan una única fila y la carga la realizan en la primera terminal que se libera. Recuerde que sólo debe emplear procesos Persona. Nota: la función UsarTerminal(t) le permite cargar la SUBE en la terminal t.**
```go

sem mutex = 1;
sem mutex_cola = 1;
sem esperar[P] = (P, 0)
int libres = T;
cola personas;
cola terminales;

process Persona [id: 0 .. P-1]{

    P(mutex);
    if (libres > 0){
        libres = libres - 1;
        V(mutex);
    } else {
        personas.push(id);
        V(mutex);
        P(esperar[id])
    }

    P(mutex_cola);
    terminal = terminales.pop();
    V(mutex_cola);
    
    UsarTerminal();
    
    P(mutex_cola);
    terminales.push(terminal);
    V(mutex_cola);

    P(mutex);
    if (cola.isEmpty()){
        libres++;
    } else {
        sig = personas.pop();
        V(esperar[sig]);
    }
    V(mutex);
}

```

---

**2) Un sistema debe validar un conjunto de 10000 transacciones que se encuentran disponibles en una estructura de datos. Para ello, el sistema dispone de 7 workers, los cuales trabajan colaborativamente validando de a 1 transacción por vez cada uno. Cada validación puede tomar un tiempo diferente y para realizarla los workers disponen de la función Validar(t), la cual retorna como resultado un número entero entre 0 al 9. Al finalizar el procesamiento, el último worker en terminar debe informar la cantidad de transacciones por cada resultado de la función de validación. Nota: maximizar la concurrencia.**

```go
int transacciones[1000];
int actual = 0;
sem mutex = 1;
int contTransPorResultado[10] = 0;
int terminaron = 0;

process Worker[0 .. 6]{

    transaccion t;
    int aux;

    P(mutex);
    while (actual < 1000){
        
        t = transacciones[t];
        actual++;
        V(mutex);

        aux = Validar(t)

        P(mutex;)
        contTransPorResultado[aux]++;
    }
    terminaron++;
    if (terminaron == 6){
        informar(contTransPorResultado);
    }
    V(mutex);

}
```

---

**Implemente una solución para el siguiente problema. Se debe simular el uso de una máquina expendedora de gaseosas con capacidad para 100 latas por parte de U usuarios. Además, existe un repositor encargado de reponer las latas de la máquina. Los usuarios usan la máquina según el orden de llegada. Cuando les toca usarla, sacan una lata y luego se retiran. En el caso de que la máquina se quede sin latas, entonces le debe avisar al repositor para que cargue nuevamente la máquina en forma completa. Luego de la recarga, saca una botella y se retira Nota: maximizar la concurrencia; mientras se reponen las latas se debe permitir que otros usuarios puedan agregarse a la fila.**

```go
int latas = 100;
int colaUsuarios[];
bool libre = true;
sem sem_cola = 1;
sem sen_maquina = 1;
sem usuarios_espera[U] = (U, 0);
sem reponer = 0;
sem termino_reponer = 0;;

process Usuario[id: 0 .. U-1]{
    P(sem_cola);
    if (libre){
        libre = false;
        V(sem_cola);
    } else {
        colaUsuarios.push(id);
        V(sem_cola);
        P(usuarios_espera[id]);
    }


    if (latas==0){
        V(reponer);
        P(termino_reponer);
    }

    maquina.comprar_gaseosa();
    latas--;
    
    P(sem_cola);
    if (colaUsuarios.isEmpty()){
        libre = true;
    } else {
        V(usuarios_espera[colaUsuarios.pop()]);
    }
    V(sem_cola);

}

process Repositor[1]{
    while (true){
        P(reponer);
        for (i = 1 .. 100){
            maquina.reponer_gaseosa;
            latas++;
        }
        V(termino_reponer);
    }
}
```


# Monitores

**1) Resolver el siguiente problema. En una elección estudiantil, se utiliza una máquina para voto electrónico. Existen N Personas que votan y una Autoridad de Mesa que les da acceso a la máquina de acuerdo con el orden de llegada, aunque ancianos y embarazadas tienen prioridad sobre el resto. La máquina de voto sólo puede ser usada por una persona a la vez. Nota: la función Votar() permite usar la máquina.**

```go
process Persona[id: 0 .. N-1]{
    int edad = random(17, 100);
    bool embarazada = random(true, false);

    accesoVoto.pasar(id, edad, embarazada);
    Votar();
    accesoVoto.salir();
}

Monitor accesoVoto [1]{
    bool libre;
    cond Espera[N];
    int idAux = 0;
    int cantEsperando = 0;
    colaOrdenada fila;

    procedure pasar (int id, int edad, bool embarazada){
        if (libre){
            libre = false;
        } else {
            cantEsperando++;
            fila.insertar(id, edad, embarazada);
            wait(Espera[id]);
        }
    }

    procedure salir(){
        if (cantEsperando > 0){
            cantEsperando--;
            int idSig = fila.pop().id;
            signal(Espera[idSig])
        } else {
            libre = true;
        }
}
```

**2) Resolver el siguiente problema. En una empresa trabajan 20 vendedores ambulantes que forman 5 equipos de 4 personas cada uno (cada vendedor conoce previamente a qué equipo pertenece). Cada equipo se encarga de vender un producto diferente. Las personas de un equipo se deben juntar antes de comenzar a trabajar. Luego cada integrante del equipo trabaja independientemente del resto vendiendo ejemplares del producto correspondiente. Al terminar cada integrante del grupo debe conocer la cantidad de ejemplares vendidos por el grupo. Nota: maximizar la concurrencia.**

```go 

process Vendedor[1 .. 20]{
    int nroEquipo = empresa.getEquipo(id); // cada vendedor conoce previamente a qué equipo pertenece

    Equipo[nroEquipo].llegada();

    int cantidad = productos.vender(); // asumo función que simula tiempo de venta y retorna cuantos vendió

    Equipo[nroEquipo].cantidadVendida(cantidad);

}

Monitor Equipo[id: 1 .. 5]{
    int cantLlegaron = 0;
    int cantTerminaron = 0;
    cond espera;
    cond terminaron;
    int cantidadTotal = 0;

    procedure llegada(){
        cantLlegaron++;
        if (cantLlegaron < 5) {
            wait(espera);
        } else {
            signal_all(espera);
        }
    }

    procedure cantidadVendida(E/S int cantidad){
        cantidadTotal += cantidad;
        cantTerminaron++;
        if (cantLlegaron < 5) {
            wait(terminaron);
        } else {
            signal_all(terminaron);
        }
        cantidad = cantidadTotal;
    }
}
```

---

**3) Resolver el siguiente problema. En una montaña hay 30 escaladores que en una parte de la subida deben utilizar un único paso de a uno a la vez y de acuerdo con el orden de llegada al mismo. Nota: sólo se pueden utilizar procesos que representen a los escaladores; cada escalador usa sólo una vez el paso**

```go
process Escalador [id: 1 .. 30]{
    paso.pasar();
    caminar();
    paso.terminarPaso();
}

Monitor paso [1]{
    bool libre = true;
    cond cola;
    int cantEsperando = 0;

    Procedure pasar(){
        if (libre){
            libre = false;
        } else {
            cantEsperando++;
            wait(cola);
        }
    }

    Procedure terminarPaso(){
        if (cantEsperando == 0){
            libre = true;
        } else {
            cantEsperando--;
            signal(cola);
        }
    }
}
```