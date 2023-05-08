{2. Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias}

program practica4b_ejercicio2;
const 
    df = 15;

type
    vector = array [1..df] of string;
    
procedure cargarArreglo (var arreglo: vector; var dL: integer); // a)
begin
    dL := 1;
    write(dl, ': ');
    readln(arreglo[dL]);
    while (dL < df) and (arreglo[dL] <> 'ZZZ') do 
    begin
        dL:= dL +1;
        write(dl, ': ');
        readln(arreglo[dL]);
    end;

    if (arreglo[dL] = 'ZZZ') then
        dl := dl -1;
end;

procedure imprimirVector (arreglo: vector; dL: integer); //No es necesario, pero para mejorar la legibilidad en consola :)
var
    i: integer;

begin
    for i := 1 to dL do 
        writeln(i, ': ', arreglo[i]);
end;

procedure eliminarNombre (var dL: integer; var arreglo: vector; var ok: boolean; nombre: string); // b)
var
    pos: integer;
    i: integer;

begin
    pos := 1;
    while ( (pos < dL) and (nombre <> arreglo[pos]) ) do
    begin
        pos := pos +1;
    end;
    
    ok := false;
    if ((nombre = arreglo[pos]) and (pos>=1)and(pos<=dl)) then
    begin
        for i := pos to (dl -1) do
            arreglo[i]:=arreglo[i+1];
        ok := true;
        dl := dl -1;
    end;
end;


procedure insertar (pos: integer; var arreglo: vector; var dl: integer; var ok: boolean; nombre: string); // c)
var
    i: integer;

begin
    ok := false;

    if ((dl+1 < df) and (pos >= 1) and (pos <= dl)) then
    begin
        ok := true;
        for i := dl downto pos do
        begin
            arreglo[i+1] := arreglo[i];
        end;

        arreglo[pos] := nombre;

        ok:=true;
        dl := dl +1;
    end;
end;

procedure agregar (var arreglo: vector; var dl: integer; var ok: boolean; nombre: string); // d)
begin

    ok := false;
    if (dl < df) then
        arreglo[dl+1] := nombre;
        dl := dl +1;
        ok := true;
end;


// Programa principal
var
    arregloo: vector;
    dL: integer;
    ok1: boolean;
    ok2: boolean;
    ok3: boolean;
    nombre: string;

begin
    cargarArreglo(arregloo, dL); // a)
    writeln();

    imprimirVector(arregloo, dL);
    writeln();

    write('Ingrese el nombre que desea eliminar: '); // b)
    eliminarNombre(dL, arregloo, ok1, nombre);
    writeln();

    imprimirVector(arregloo, dL);
    writeln();

    write('Ingrese el nombre que desea insertar en la posición 4: '); // c)
    readln(nombre);
    insertar (4, arregloo, dl, ok2, nombre);

    imprimirVector(arregloo, dL);
    writeln();

    write('Ingrese el nombre que desea agregar: '); // c)
    readln(nombre);
    agregar (arregloo, dl, ok3, nombre);

    imprimirVector(arregloo, dL);
    writeln();
end.
