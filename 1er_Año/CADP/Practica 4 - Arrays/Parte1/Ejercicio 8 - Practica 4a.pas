{8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.}

program practica5a_Ejercicio8;
const
    df = 5; //400
    
type
    alumno = record
        nroI: integer;
        DNI: longint;
        apellido: string;
        nombre: string;
        anioN: integer;
    end;
    
    alumnos = array [1..df] of alumno;
    
procedure leerAlumnos (var alumnos: alumnos);
var
    i: integer;
    
begin
    for i := 1 to df do
    begin
        writeln(i, ' de ', df);
        write('Ingrese Nro de inscripcion: ');
        readln(alumnos[i].nroI);
        write('Ingrese Nro de DNI: ');
        readln(alumnos[i].DNI);
        write('Ingrese nombre: ');
        readln(alumnos[i].apellido);
        write('Ingrese apellido: ');
        readln(alumnos[i].nombre);
        write('Ingrese año de nacimiento: ');
        readln(alumnos[i].anioN);
        writeln();
    end;
end;
  
function esPar (DNI: integer): boolean;
var
    rta: boolean;
    digito: integer;

begin
    rta := true;
    while(DNI <> 0) do
    begin
        digito := DNI MOD 10;
        if not(dni MOD 2 = 0) then 
            rta := false;
        DNI := DNI DIV 10;
    end;
    
    esPar := rta;
end;

function PorcAlum3DNI (alumnos: alumnos): real;
var
    i: integer;
    cantAlum3: integer;

begin
    cantAlum3 := 0;
    for i := 1 to df do
    begin
        if (esPar(alumnos[i].DNI)) then
            cantAlum3 := cantAlum3 + 1;
    end;
    
    PorcAlum3DNI := cantAlum3 * 100 / df ;
end;

procedure AlumMasGrandes (alumnos: alumnos; var Amax1, Amax2, Nmax1, Nmax2: string);
var
    i: integer;
    anioMin1, anioMin2: integer;

begin
    anioMin1 := 9999;

    for i:= 1 to df do
    begin
        if (alumnos[i].anioN < anioMin1) then
        begin
            anioMin2 := anioMin1;
            anioMin1 := alumnos[i].anioN;
            Amax2 := Amax1;
            Nmax2 := Nmax1;
            Nmax1 := alumnos[i].nombre;
            Amax1 := alumnos[i].apellido;
        end
        else if (alumnos[i].anioN < anioMin2) then
        begin
            anioMin2 := alumnos[i].anioN;
            Amax2 := alumnos[i].apellido;
            Nmax2 := alumnos[i].nombre;
        end;
    end;
end;

// Programa Principal
var
    alumnoss: alumnos;
    Amax1, Amax2, Nmax1, Nmax2: string;

begin
    writeln('Carga de datos');
    leerAlumnos(alumnoss);
    writeln();
    writeln('El porcentaje de alumnos con 3 digitos en el DNI es: ', PorcAlum3DNI(alumnoss):2:2);
    
    AlumMasGrandes(alumnoss,Amax1, Amax2, Nmax1, Nmax2);
    
    writeln('El alumno más grande es ', Amax1, ' ', Nmax1);
    writeln('El segundo más grande es ', Amax2, ' ', Nmax2);
end.