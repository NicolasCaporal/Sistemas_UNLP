{3. El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes).}

program Practica3_Ejercicio3;

type
    TipoEscuela = record
        cue: integer;
        nombreE: string;
        cantDE: integer;
        cantAE:integer;
        localE: string;
    end;
    
procedure leerEscuela (var escu: TipoEscuela);
begin
    write('Ingrese codigo unico de establecimiento: ');
    readln(escu.cue);
    write('Ingrese nombre del establecimiento: ');
    readln(escu.nombreE);
    write('Ingrese cantidad de docentes: ');
    readln(escu.cantDE);
    write('Ingrese cantidad de alumnos: ');
    readln(escu.cantAE);
    write('Ingrese la localidad del establecimiento: ');
    readln(escu.localE);
    writeln('_______________________________________________________');
    writeln('');
end;

function calcularPropAD(alum, docen:integer; var proporcion: real):boolean;
begin
    proporcion := alum / docen;
    calcularPropAD := (proporcion <= 23.435);
end;

procedure mejoresEscuelas (proporcion: real; nombre: string; cue: integer; var MCUE1, MCUE2: integer; var MNE1, MNE2: string; var MP1, MP2: real);
begin
    if (proporcion < MP1)then
    begin
        MP2 := MP1;
        MCUE2 := MCUE1;
        MNE2 := MNE1;
        MP1 := proporcion;
        MCUE1 := cue;
        MNE1 := nombre;
    end
    else if (proporcion < MP2) then
    begin
        MP2 := proporcion;
        MNE2 := nombre;
        MCUE2 := cue;
    end;
end;

{Programa Principal}
var 
    escuela: TipoEscuela;
    cumpleProporcion: boolean;
    proporcion: real;
    MCUE1, MCUE2: integer;
    MNE1, MNE2: string;
    MPE1, MPE2: real;
    i: integer;
    contadorEscuelasCumplen: integer;


begin
    contadorEscuelasCumplen := 0;
    MPE1 := 9999;
    for i := 1 to 4 do
    begin 
        leerEscuela(escuela);
        cumpleProporcion := calcularPropAD(escuela.cantAe, escuela.cantDE, proporcion);
        if (cumpleProporcion) then
            contadorEscuelasCumplen := contadorEscuelasCumplen + 1;
        mejoresEscuelas(proporcion, escuela.nombreE, escuela.cue, MCUE1, MCUE2, MNE1, MNE2, MPE1, MPE2);
    end;
    writeln(contadorEscuelasCumplen, ' colegios cumplen con la proporcion alumnos/docentes recomendada por la UNESCO');
    writeln('Las escuelas con más docentes por alumno son ', MNE1, ' de codigo ', MCUE1, ' y ', MNE2, ' de codigo ', MCUE2);
end.