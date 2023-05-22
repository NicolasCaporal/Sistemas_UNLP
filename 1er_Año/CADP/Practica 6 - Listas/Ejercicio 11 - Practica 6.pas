{11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les
entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y el
promedio obtenido durante toda su carrera.
Implementar un programa que:
a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse.
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los
egresados que recibirán el premio. La información debe imprimirse ordenada según el promedio del egresado
(de mayor a menor).}

program Practica6_Ejercicio11;

type 
    egresado = record
        nroA: integer;
        apellido: string[40];
        prom: real;
    end;
    
    lista = ^nodo;
    nodo = record
        dato: egresado;
        sig: lista;
    end;
    


procedure armarNodo (var L: lista; e: egresado);
var
    nue, ant, act: lista;

begin
    new(nue);
    nue^.dato := e;

    if (L = nil) then
    begin
        writeln('uno');
        L := nue;
        l^.sig := nil;
    end
    else
    begin
        act := l;
        ant := l;
        
        while ((act <> nil) and (act^.dato.prom > e.prom)) do 
        begin
            writeln('dos');
            ant := act;
            act := act^.sig;
        end;

        if (act = ant) then 
        begin
            writeln('Tres');
            nue^.sig := L;
            L := nue;
        end
        else if (act <> nil) then
        begin
            writeln('cuatro');
            ant^.sig := nue;
            nue^.sig := act;
        end
        else
        begin
            writeln('Cinco');
            ant^.sig := nue;
            nue^.sig := nil;
        end;
    end;
end;


procedure leerEgresado (var e: egresado);
begin
    
    write('Ingrese nro alumno: ');
    readln(e.nroA);
    if (e.nroA <> 0) then
    begin
        write('Ingrese apellido: ');
        readln(e.apellido);
        write('Ingrese promedio: ');
        readln(e.prom);
    end;
    writeln;
end;


procedure cargarLista (var L: lista);
var
    e: egresado;

begin
    leerEgresado(e);
    while (e.nroA <> 0) do
    begin
        writeln('ENTRO AL WHILE');
        armarNodo(L, e);
        leerEgresado(e);
    end;
end;


procedure imprimirEgresado (E: egresado);
begin
    write('Nro de alumno: ');
    writeln(e.nroA);
    write('Apellido: ');
    writeln(e.apellido);    
    write('Promedio: ');
    writeln(e.prom:2:2);
    writeln;
end;


procedure imprimirLista (L: lista);
var
    i: integer;
begin
    for i := 1 to 10 do
    begin
        imprimirEgresado(l^.dato);
        l := l^.sig;
    end;
end;


{ Programa principal }
var
    l: lista;

begin
    L := nil;
    cargarLista(L);
    imprimirLista(L);
end. 
