{ 11. Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
lee: número de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con número de
inscripción 1200, que debe procesarse. Se pide calcular e informar:
● Apellido de los dos alumnos con número de inscripción más chico.
● Nombre de los dos alumnos con número de inscripción más grande.
● Porcentaje de alumnos con nro de inscripción par.}


program Practica2b_Ejercicio11;

procedure leerDatos(var nroInsc: integer; var nombre, apellido: string);
begin
    write('Ingrese nombre: ');
    readln(nombre);
    write('Ingrese apellido: ');
    readln(apellido);
    write('Ingrese numero de inscripción: ');
    readln(nroInsc);
end;

procedure AdosMenorNroInsc(nroInsc:integer; var nroInscC1, nroInscC2: integer; var apellidoC1, apellidoC2: string; apellido: string);
begin
    if (nroInsc < nroInscC1) then
    begin
        nroInscC2 := nroInscC1;
        apellidoC2 := apellidoC1;
        nroInscC1 := nroInsc;
        apellidoC1 := apellido;
    end
    else if (nroInsc < nroInscC2) then
        begin
            apellidoC2 := apellido;
            nroInscC2 := nroInsc;
        end;
end;

procedure NdosMayorNroInsc(nroInsc: integer; var nroInscG1, nroInscG2: integer; var nombreG1, nombreG2: string; nombre: string);
begin
    if (nroInsc>nroInscG1)then
    begin
        nroInscG2 := nroInscG1;
        nombreG2 := nombreG1;
        nroInscG1 := nroInsc;
        nombreG1 := nombre;
    end
    else if (nroInsc>nroInscG2)then
    begin
        nroInscG2 := nroInsc;
        nombreG2 := nombre;
    end;
end;

function EsPar (numero:integer):boolean;
begin
    EsPar := (numero mod 2 = 0);
end;

function porcentajePar(cantPar, cantAlu: integer): real;
begin
    porcentajePar := ((cantPar * 100) / cantAlu);
end;

{PROGRAMA PRINCIPAL}

var
    nroInsc: integer;
    nombre:string;
    apellido:string;
    nInscC1: integer;
    nInscC2: integer;
    aC1: string;
    aC2: string;
    nInscG1: integer;
    nInscG2: integer;
    nG1: string;
    nG2: string;
    contPares: integer;
    contAlum: integer;

begin
    nInscC1 := 9999;
    nInscG1 := -9999;
    contPares := 0;
    contAlum := 0;
    
    repeat
        contAlum := contAlum + 1;
        leerDatos(nroInsc, nombre, apellido);
        
        writeln('______________________________________');
        writeln();

        AdosMenorNroInsc(nroInsc, nInscC1, nInscC2, aC1, aC2, apellido);
        NdosMayorNroInsc(nroInsc, nInscG1, nInscG2, nG1, nG2, nombre);
        
        if (EsPar(nroInsc))then
            contPares := contPares + 1;
        
    until (nroInsc = 1200);
    
    writeln('Los alumnos con nro de inscripción menor fueron ', aC1, ' y ', aC2);
    writeln('Los alumnos con nro de inscripción mayor fueron ', nG1, ' y ', nG2);
    writeln('El ', porcentajePar(contPares, contAlum):2:2, '% de los alumnos tiene numero de inscripción par');
end.