# Práctica 4 – Pasaje de Mensajes

# PMA
## Ejercicio 1
**Suponga que N clientes llegan a la cola de un banco y que serán atendidos por sus empleados.**
**Analice el problema y defina qué procesos, recursos y canales/comunicaciones serán necesarios/convenientes para resolverlo. Luego, resuelva considerando las siguientes situaciones:**

**a.** Existe un único empleado, el cual atiende por orden de llegada.
```java
chan cola(int);
chan turno[N] (int);

process cliente[id: 1 .. N]{
    int miTurno;
    send cola(id);
    receive turno[id](miTurno);
}

process empleado[id: 1]{
    int idCliente;
    while(true){
        receive cola(idCliente);
        send turno[idCliente] (1);
        // atiende
    }
}
```

**b. Ídem a)** pero considerando que hay 2 empleados para atender, ¿qué debe modificarse en la solución anterior?
```java
chan cola(int);
chan turno[N] (int);

process cliente[id: 1 .. N]{
    int miTurno;
    send cola(id);
    receive turno[id](miTurno);
}

process empleado[id: 1 .. 2]{
    int idCliente;
    while(true){
        receive cola(idCliente);
        send turno[idCliente] (1);
        // atiende
    }
}
```
> No, no se debe modificar nada :)
> Solo la cant de empleados, por suerte


**c. Ídem b)** pero considerando que, si no hay clientes para atender, los empleados
realizan tareas administrativas durante 15 minutos. ¿Se puede resolver sin usar
procesos adicionales? ¿Qué consecuencias implicaría?
```java
chan cola(int);
chan turno[N] (int);

process cliente[id: 1 .. N]{
    int miTurno;
    send cola(id);
    receive turno[id](miTurno);
}

process empleado[id: 1 .. 2]{
    int idCliente;
    while(true){
        if (not empty(cola)){
            receive cola(idCliente);
            send turno[idCliente] (1);
            // atiende
        } else {
            tareasAdministrativas(15);
        }
    }
}
```
> La anterior solución soluciona el problema sin usar procesos adicionales. El problema es que esto podría generar demora innecesaria en caso de que los dos empleados pregunten por el empty y haya solo un cliente en la cola: uno lo atiende y el otro se queda bloqueado en el receive

Solución correcta, con proceso coordinador:
```java
chan cola(int);
chan turno[N] (int);

process cliente[id: 1 .. N]{
    int miTurno;
    send cola(id);
    receive turno[id](miTurno);
}

// este doble receive de siguiente está mal, después cambiar
process empleado[id: 1 .. 2]{
    int idCliente;
    String trabajo;
    while(true){
        send empleadosLibres(id);
        receive siguiente[id] (trabajo);
        if (trabajo != "sin clientes"){
            receive Siguiente[id] (idCliente);
            send turno[idCliente] (1);
        } else {
            tareasAdministrativas(15);
        }
    }
}

process coordinador[id: 1]{
    int idEmpleado;
    int idCliente;

    while (true){
        receive empleadosLibre(idEmpleado);

        if (not empty(cola)){
            receive cola(idCliente);
            send Siguiente[idEmpleado] (idCliente);
        } else {
            send Siguiente[idEmpleado] ("sin clientes");
        }
    }
}
```


## Ejercicio 2
**Se desea modelar el funcionamiento de un banco en el cual existen 5 cajas para realizar pagos.** 
**Existen P clientes que desean hacer un pago. Para esto, cada una selecciona la caja donde hay menos personas esperando; una vez seleccionada, espera a ser atendido.** 
**En cada caja, los clientes son atendidos por orden de llegada por los cajeros. Luego del pago, se les entrega un comprobante.** 
> Nota: maximizar la concurrencia.
```java
chan colaCaja[5];
chan turno[P];
chan comprobante[P];
chan llegada;
chan libero;



process Cajero [id: 1 .. 5]{
    int idCliente;
    Comprobante comprobante;
    while(true){
        receive colaCaja[id] (idCliente);
        send turno[idCliente] (true);
        // atiende;
        comprobante = generarComprobante(idCliente);
        send comprobante[idCliente] (comprobante);
    }
}

process Cliente [id: 1 .. P]{
    int miCaja;
    boolean miTurno;
    String comprobante;

    send llegada(id);
    receive cajaMin[id] (miCaja);

    send colaCaja[miCaja] (id);
    receive turno[id] (miTurno);
    send libero (miCaja);

    // Es atendido
    receive comprobante[miCaja] (comprobante);
}

process coordinador [id: 1]{

    int idCliente;
    int cantPorCaja[5] = (5, 0);
    int min;

    while(true){

        if (not empty(llegada) && empty(libero)){
            receive llegada(idCliente);
            min = seleccionarMinimo(cantPorCaja)
            cantPorCaja[min]++;
            send cajaMin[idCliente] (min);

        } else if (not empty(libero)){
                receive libero (idCaja);
                cantPorCaja[idCaja]--;
        }
    }
}
```

## Ejercicio 3
**3. Se debe modelar el funcionamiento de una casa de comida rápida, en la cual trabajan 2 cocineros y 3 vendedores, y que debe atender a C clientes.**
**El modelado debe considerar que:**
**- Cada cliente realiza un pedido y luego espera a que se lo entreguen.**
**- Los pedidos que hacen los clientes son tomados por cualquiera de los vendedores y se lo pasan a los cocineros para que realicen el plato. Cuando no hay pedidos para atender, los vendedores aprovechan para reponer un pack de bebidas de la heladera (tardan entre 1 y 3 minutos para hacer esto).**
**- Repetidamente cada cocinero toma un pedido pendiente dejado por los vendedores, lo cocina y se lo entrega directamente al cliente correspondiente.**
> Nota: maximizar la concurrencia.

```java
chan pedido (int, String);
chan pedidoListo[C] (Comida);
chan vendedoresLibres[3] (int);
chan siguiente[3] (int, String);

process Cliente [id: 1 .. C] {
    String pedidos;
    Comida miPedido;
    send pedido(id, pedido);
    receive pedidoListo[id](miPedido);
}

process coordinador [1]{
    int idVendedor;
    int idCliente;
    String pedido;

    while (true) {
        receive vendedoresLibres(idVendedor);

        if (not empty(pedido)){
            receive pedido(idCliente, pedido);
            send siguiente[idVendedor] (idCliente, pedido);
        } else {
            send siguiente[idVendedor] (-1, "sin clientes");
        }
    }
}

process Vendedor [id: 1 .. 3] {
    int idCliente;
    String pedido;
    while(true){
        send vendedoresLibres(id);
        receive siguiente[id] (idCliente, pedido);
        if (pedido != "sin clientes"){
            receive siguiente[id] (idCliente);
            send pedidosCocinar (idCliente, pedido);
        } else {
            reponerBebidas(1, 3);
        }
    }
}

process Cocinero [id: 1 .. 2] {
    int idCliente;
    String pedido;
    while(true){
        receive pedidosCocinar(idCliente, pedido);
        Comida comida = new Comida(pedido);
        send pedidoListo[idCliente] (comida);
    }
}

```


## Ejercicio 04

**Simular la atención en un locutorio con 10 cabinas telefónicas, el cual tiene un empleado que se encarga de atender a N clientes.**
**Al llegar, cada cliente espera hasta que el empleado le indique a qué cabina ir, la usa y luego se dirige al empleado para pagarle.**
**El empleado atiende a los clientes en el orden en que hacen los pedidos, pero siempre dando prioridad a los que terminaron de usar la cabina.**
**A cada cliente se le entrega un ticket factura.**
> Nota: maximizar la concurrencia; 
> suponga que hay una función Cobrar() llamada por el empleado que simula que el empleado le cobra al cliente.

```java
chan cola(int);
chan cabina[N] (int);
chan terminaron (int, int);
chan comprobante[N] (int);

process Cliente[id: 1 .. N]{
    int miCabina;
    send cola(id);
    receive cabina[id](miCabina);

    Cabinas.usar(miCabina);

    send terminaron(id, miCabina);
    receive comprobante[id] (miComprobante)
}

process Empleado [1] {

    boolean cabinasLibres[10] (10, True):
    int idCliente;
    int idCabina;

    while(true){

        if (not empty(terminaron)){
            receive terminaron(idCliente, idCabina);
            cabinasLibres[idCabina] = true;
            String comprobante = generarComprobante();
            comprobante[idCliente] (comprobante);

        } else if (not empty(cola) && cabinasLibres.hayAlMenosUna()) {
            receive cola(idCliente);
            int cabinaLibre = cabinasLibres.getAnyTrue();
            send cabina[idCliente] (cabinaLibre);
        }
    }
}
```

## Ejercicio 05
**Resolver la administración de 3 impresoras de una oficina. Las impresoras son usadas por N administrativos,** 
**los cuales están continuamente trabajando y cada tanto envían documentos a imprimir.** 
**Cada impresora, cuando está libre, toma un documento y lo imprime, de acuerdo con el orden de llegada.**
> Nota: ni los administrativos ni el director deben esperar a que se imprima el documento.

**a) Implemente una solución para el problema descrito.**
```java
chan colaImpresion (Documento);
chan impresiones (Documento);

process administrativo[id: 1 .. N]{
    while (true){
        int tiempoDeTrabajo = randomTime();
        trabajar(tiempoDeTrabajo);
        Documento documento = new Documento(data);
        send colaImpresion (documento);
    }
}

process impresora[id: 1 .. 3]{
    Documento documento;
    while (true){
        receive colaImpresion(documento);
        imprimir(documento);
        send impresiones (documento);
    }
}
```

**b) Modifique la solución implementada para que considere la presencia de un director de oficina que también usa las impresas, el cual tiene prioridad sobre los administrativos.**
```java
chan colaImpresionAdministrativos (Documento);
chan colaImpresionPrioritaria (Documento);
chan impresiones (Documento);

process administrativo[id: 1 .. N]{
    while (true){
        int tiempoDeTrabajo = randomTime();
        trabajar(tiempoDeTrabajo);
        Documento documento = new Documento(data);
        send colaImpresionAdministrativos (documento);
    }
}

process director[1]{
    while (true){
        int tiempoDeTrabajo = randomTime();
        trabajar(tiempoDeTrabajo);
        Documento documento = new Documento(data);
        send colaImpresionPrioritaria (documento);
    }
}

process impresora[id: 1 .. 3]{
    Documento documento;
    while (true){
        receive colaImpresionAdministrativos(documento);
        imprimir(documento);
        send impresiones (documento);
    }
}
```
c) Modifique la solución (a) considerando que cada administrativo imprime 10 trabajos y
que todos los procesos deben terminar su ejecución.
d) Modifique la solución (b) considerando que tanto el director como cada administrativo
imprimen 10 trabajos y que todos los procesos deben terminar su ejecución.
e) Si la solución al ítem d) implica realizar Busy Waiting, modifíquela para evitarlo.


# PMS
## Ejercicio 01
**Suponga que existe un antivirus distribuido que se compone de R procesos robots**
**Examinadores y 1 proceso Analizador.**
**Los procesos Examinadores están buscando continuamente posibles sitios web infectados; cada vez que encuentran uno avisan la dirección y luego continúan buscando.**
**El proceso Analizador se encarga de hacer todas las pruebas necesarias con cada uno de los sitios encontrados por los robots para determinar si están o no infectados.**
**a) Analice el problema y defina qué procesos, recursos y comunicaciones serán necesarios/convenientes para resolverlo.**

**b) Implemente una solución con PMS sin tener en cuenta el orden de los pedidos.**
> Me salió de una con orden, ni idea como sería hacerlo sin orden (?

**c) Modifique el inciso (b) para que el Analizador resuelva los pedidos en el orden en que se hicieron.**

```java
process examinador [id: 1 .. R]{
    while(true){
        Direccion url = buscarVirus();
        buffer! (url);
    }
}

process analizador [id: 1]{
    while(true){
        buffer!pedido ();
        buffer? (virus);    
        hacerPruebas(virus);
    }
}

process buffer[1]{
    while(true){
        Cola sitios;
        Direccion url;
        do  examinador[*]? (url); -> sitios.push(url);
            ◻ viruses.lenght() > 0 : analizador?pedido() -> analizador!(sitios.pop());
        od
    }
    
}
```

## Ejercicio 02
**En un laboratorio de genética veterinaria hay 3 empleados.**
**El primero de ellos continuamente prepara las muestras de ADN; cada vez que termina, se la envía al segundo empleado y vuelve a su trabajo.**
**El segundo empleado toma cada muestra de ADN preparada, arma el set de análisis que se deben realizar con ella y espera el resultado para archivarlo.**
**Por último, el tercer empleado se encarga de realizar el análisis y devolverle el resultado al segundo empleado.** 

```java
process Empleado[id: 1]{
    Muestra muestra;

    while(true){
        muestra = prepararMuestra();
        buffer! (muestra);
    }
}

process Empleado[id: 2]{
    Muestra muestra;

    while(true){
        buffer!pedido();
        buffer? (muestra);

        String setAnalisis = armarSet(muestra);

        Empleado[3]! (setAnalisis);
        Empleado[3]? (String resultado);
        archivar(resultado);
    }
}

process Empleado[id: 3]{
    String setAnalisis;

    while(true){
        Empleado[2]? (setAnalisis);
        String resultado = realizar(setAnalisis);
        Empleado[2]! (resultado);
    }
}

process buffer[1]{
    Cola muestras;
    Muestra muestra;

    do  Empleado[1]? (muestra); -> muestras.push(url);
        ◻ muestras.lenght() > 0 : Empleado[2]?pedido() -> empleado[2]!(muestras.pop());
    od
}
```

## Ejercicio 03
**En un examen final hay N alumnos y P profesores.** 
**Cada alumno resuelve su examen, lo entrega y espera a que alguno de los profesores lo corrija y le indique la nota.** 
**Los profesores corrigen los exámenes respetando el orden en que los alumnos van entregando.**
> Nota: maximizar la concurencia

**a) Considerando que P=1.**
```java
process Alumno[1 .. N]{
    Examen examen = resolver();
    admin! (examen);
    String nota;
    profesor[*]?nota (nota);
}

process Profesor[id: 1]{
    Examen examen;
    int idAlumno;

    while (true){
        admin!pedido();
        admin? (idAlumno, examen);
        nota = corregir(examen);
        alumno[idAlumno]!nota (nota);
    }
}

process admin[1]{
    cola examenes (int, Examen);
    Examen examen;
    int idAlumno;

    do  Examen[*]? (idAlumno, examen) -> examenes.push(idAlumno, examen);
        ◻ examenes.lenght() > 0 : Profesor[*]?pedido() -> Profesor[]! (examenes.pop());
    od
}
```

**b) Considerando que P>1.**
```java
process Alumno[1 .. N]{
    Examen examen = resolver();
    admin! (examen);
    String nota;
    profesor[*]?nota (nota);
}

process Profesor[id: 1 .. P]{
    Examen examen;
    int idProfesor;
    int idAlumno;

    while (true){
        admin!pedido(id);
        admin? (idAlumno, examen);
        nota = corregir(examen);
        alumno[idAlumno]!nota (nota);
    }
}

process admin[1]{
    cola examenes (int, Examen);
    Examen examen;
    int idProfesor;
    int idAlumno;

    do  Examen[*]? (idAlumno, examen) -> examenes.push(idAlumno, examen);
        ◻ examenes.lenght() > 0 : Profesor[*]?pedido(idProfesor) -> Profesor[idProfesor]! (examenes.pop());
    od
}
```
**c) Ídem b) pero considerando que los alumnos no comienzan a realizar su examen hasta que todos hayan llegado al aula.**
```java
process Alumno[1 .. N]{

    admin!llegue ();
    admin?empezar ();

    Examen examen = resolver();
    admin! (examen);
    String nota;
    profesor[*]?nota (nota);
}

process Profesor[id: 1 .. P]{
    Examen examen;
    int idProfesor;
    int idAlumno;

    while (true){
        admin!pedido(id);
        admin? (idAlumno, examen);
        nota = corregir(examen);
        alumno[idAlumno]!nota (nota);
    }
}

process admin[1]{
    cola examenes (int, Examen);
    Examen examen;
    int idProfesor;
    int idAlumno;

    for i = 1 .. N { alumno[*]?llegue (); }
    for i = 1 .. N { alumno[i]!empezar (); }

    do  Examen[*]? (idAlumno, examen) -> examenes.push(idAlumno, examen);
        ◻ examenes.lenght() > 0 : Profesor[*]?pedido(idProfesor) -> Profesor[idProfesor]! (examenes.pop());
    od
}
```

## Ejercicio 04
**En una exposición aeronáutica hay un simulador de vuelo (que debe ser usado con exclusión mutua) y un empleado encargado de administrar su uso.**
**Hay P personas que esperan a que el empleado lo deje acceder al simulador, lo usa por un rato y se retira.**
> Nota: cada persona usa sólo una vez el simulador.

**a) Implemente una solución donde el empleado sólo se ocupa de garantizar la exclusión mutua.**
```java
Process Persona [id: 0..P-1] {
    Empleado!pedido(id);   
    Empleado?pasar();      
    simulador.usar();      
    Empleado!liberar();    
}

Process Empleado {
    bool libre = true;

    do Persona[*]?pedido(idPersona) -> 
           if (libre) { 
               libre = false;
               Persona[idPersona]!pasar();
           }
    ◻ Persona[*]?liberar() -> 
           libre = true;
    od
}
```

**b) Modifique la solución anterior para que el empleado considere el orden de llegada para dar acceso al simulador.**
```java
Process Persona [id: 0..P-1] {
    Empleado!pedido(id);
    Empleado?pasar();
    simulador.usar();  
    Empleado!liberar();
}

Process Empleado {
    cola cola;
    int idPersona;
    bool libre = true;

    do Persona[*]?pedido(idPersona) ->  if (!libre) { 
                                            cola.push(idPersona);
                                        } else { 
                                            libre = false;
                                            Persona[idPersona]!pasar();
                                        }

    ◻ Persona[*]?liberar() -> if (empty(cola)) { 
                                 libre = true; 
                             } else { 
                                 idPersona = cola.pop(); 
                                 Persona[idPersona]!pasar();
                             }
    od
}
```

## Ejercicio 05
**En un estadio de fútbol hay una máquina expendedora de gaseosas que debe ser usada por E Espectadores de acuerdo con el orden de llegada.**
**Cuando el espectador accede a la máquina en su turno, usa la máquina y luego se retira para dejar al siguiente.**
> Nota: cada Espectador usa sólo una vez la máquina.

```java
process cola[1]{
Cola fila;
while(true){
        do  espectador[*]?fila (idEspectador); -> fila.push(id);
            ◻ fila.lenght() > 0 : Espectador?avanzar() -> Espectador!(sitios.pop());
        od
    }

}

process Espectador[1 .. E]{
    cola!fila(id);
    pedido!avanzar();

}
```