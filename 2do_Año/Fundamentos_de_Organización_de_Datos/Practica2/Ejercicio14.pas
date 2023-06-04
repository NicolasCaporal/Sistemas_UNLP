{ 14. Una compañía aérea dispone de un archivo maestro donde guarda información sobre
sus próximos vuelos. En dicho archivo se tiene almacenado el destino, fecha, hora de salida
y la cantidad de asientos disponibles. La empresa recibe todos los días dos archivos detalles
para actualizar el archivo maestro. En dichos archivos se tiene destino, fecha, hora de salida
y cantidad de asientos comprados. Se sabe que los archivos están ordenados por destino
más fecha y hora de salida, y que en los detalles pueden venir 0, 1 ó más registros por cada
uno del maestro. Se pide realizar los módulos necesarios para:

a. Actualizar el archivo maestro sabiendo que no se registró ninguna venta de pasaje
sin asiento disponible.

b. Generar una lista con aquellos vuelos (destino y fecha y hora de salida) que
tengan menos de una cantidad específica de asientos disponibles. La misma debe
ser ingresada por teclado.

NOTA: El archivo maestro y los archivos detalles sólo pueden recorrerse una vez. }

program ejercicio14_practica2;

const 
    valorEspecial = '~~~~~';

type 

    fecha = record
        d: 1..31;
        m: 1..12;
        a: integer;
    end;

    vuelo = record 
        destino: string;
        f: fecha;
        hora: string;
        asientos: integer;
    end;

    archivo = file of vuelo;



procedure leerArchivo (var a: archivo; var r: vuelo);
begin
    if (not EOF(a)) then 
        read(a, r)
    else 
        r.destino := valorEspecial;
end;


function esMasAntiguo(f1, f2: fecha): boolean;
var 
    rta: boolean;

begin 
    rta := false;

    if (f1.a < f2.a) then 
        rta := true
    else if (f1.a = f2.a) then 
    begin 
        if (f1.m < f2.m) then 
            rta := true
        else if (f1.m = f2.m) then 
        begin
            if (f1.d < f2.d) then 
            begin
                rta := true; 
            end; 
        end 
    end;

    esMasAntiguo := rta;
end;

function mismaFecha (f1, f2: fecha): boolean;
begin
    mismaFecha := ((f1.d = f2.d) and (f1.m = f2.m) and (f1.a = f2.a));
end;

function esMasTemprano (h1, h2: string): boolean;
begin
    esMasTemprano := (h1 < h2);
end;


function buscarMinimo (var a1, a2: archivo; var r1, r2: vuelo): vuelo;
var 
    minimo: vuelo;

begin
    
    if ( (r1.destino < r2.destino) or 
    ((r1.destino = r2.destino) and (esMasAntiguo(r1.f, r2.f))) or 
    (((r1.destino = r2.destino) and (mismaFecha(r1.f, r2.f)) and (esMasTemprano(r1.hora, r2.hora)))) ) then
    begin
        minimo := r1;
        if (r1.destino <> valorEspecial) then
            leerArchivo(a1, r1);
    end
    else 
    begin
        minimo := r2;
        if (r2.destino <> valorEspecial) then
            leerArchivo(a2, r2); 
    end;

    buscarMinimo := minimo;

end;


procedure actualizarMaestro (var archivoM, archivoD1, archivoD2: archivo);
var 
    registroM: vuelo;
    registroD1, registroD2: vuelo;
    rActual: vuelo;
    aux: vuelo;

begin
    reset(archivoM);
    reset(archivoD1);
    reset(archivoD2);

    leerArchivo(archivoD1, registroD1);
    leerArchivo(archivoD2, registroD2);

    rActual := buscarMinimo(archivoD1, archivoD2, registroD1, registroD2);

    while (rActual.destino <> valorEspecial) do 
    begin
        read(archivoM, registroM);
        while ((registroM.destino <> rActual.destino) or (not(mismaFecha(registroM.f, rActual.f))) or (registroM.hora <> rActual.hora)) do 
        begin
            read(archivoM, registroM);
        end;
        seek(archivoM, filePos(archivoM) - 1);


        aux := rActual;
        while ((aux.destino = rActual.destino) and (mismaFecha(aux.f, rActual.f)) and (aux.hora = rActual.hora)) do
        begin 
            registroM.asientos := registroM.asientos - aux.asientos;
            aux := buscarMinimo(archivoD1, archivoD2, registroD1, registroD2);
        end;
        rActual := aux;

        write(archivoM, registroM);
    end;

    close(archivoM);
    close(archivoD1);
    close(archivoD2);

end;


procedure imprimirMenosDeNAsientos(var a: archivo);
var 
    N: integer;
    r: vuelo;

begin

    write('Ingrese cantidad de asientos maxima: ');
    readln(N);
    writeln('Vuelos menos de ', N, ' asientos disponibles: ');

    reset(a);
    leerArchivo(a, r);
    while (r.destino <> valorEspecial) do 
    begin
        if (r.asientos < N) then
            writeln(r.destino, ' ', r.f.d, '/', r.f.m, '/', r.f.a, ' ', r.hora, ' |||||| ', R.asientos);
        leerArchivo(a, r);
    end;
    close(a);
end;


function menu(): integer;
var 
    rta: integer;

begin
    writeln('OPCIONES');
    writeln('1. Actualizar archivo maestro');
    writeln('2 Informar vuelos con menos de N asientos disponibles');
    write('Ingrese el numero de la opcion deseada: ');
    readln(rta);

    menu := rta;
end;



{ Programa principal }
var 
    archivoM: archivo;
    archivoD1, archivoD2: archivo;

begin
    assign(archivoM, 'maestro.dat');
    assign(archivoD1, 'detalle1.dat');
    assign(archivoD2, 'detalle2.dat');

    case menu() of
        1: actualizarMaestro(archivoM, archivoD1, archivoD2);
        2: imprimirMenosDeNAsientos(archivoM);
    end;

end.