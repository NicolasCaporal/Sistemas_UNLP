{9. Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a
lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).}

program practica5a_Ejercicio8;
const
    df= 400;
    
type
    alumno = record
        nroI: integer;
        DNI: longint;
        apellido: string;
        nombre: string;
        anioN: integer;
    end;
    
    alumnos = array [1..df] of alumno;
    
procedure leerAlumnos (var alumnos: alumnos; var dimL: integer);
begin
        dimL:=1;
        write('Ingrese Nro de DNI: ');
        readln(alumnos[dimL].DNI);
    
    while ((alumnos[dimL].DNI <> -1) and (dimL < 400)) do
    begin

        write('Ingrese Nro de inscripcion: ');
        readln(alumnos[dimL].nroI);
        write('Ingrese nombre: ');
        readln(alumnos[dimL].apellido);
        write('Ingrese apellido: ');
        readln(alumnos[dimL].nombre);
        write('Ingrese año de nacimiento: ');
        readln(alumnos[dimL].anioN);
        writeln();
        
        dimL:=dimL+1;

        write('Ingrese Nro de DNI: ');
        readln(alumnos[dimL].DNI);
    end;

    if (alumnos[dimL].dni = -1) then
        dimL:=dimL-1;
end;
  
function contarDig (DNI: integer): real;
var
    cantDig: integer;

begin

    cantDig:=0;
    while(DNI <> 0) do
    begin
        DNI:= DNI DIV 10;
        cantDig:=cantDig+1;
    end;
    
    contarDig:=cantDig;

end;

function PorcAlum3DNI (alumnos: alumnos; dimL: integer): real;
var
    i: integer;
    cantAlum3: integer;

begin

    cantAlum3:=0;

    for i := 1 to dimL do
    begin
        if (ContarDig(alumnos[i].DNI)=3) then
            cantAlum3:= cantAlum3 + 1;
    end;
    
    PorcAlum3DNI:= cantAlum3 * 100 / dimL ;

end;

procedure AlumMasGrandes (alumnos: alumnos; var Amax1, Amax2, Nmax1, Nmax2: string; dimL: integer);
var
    i: integer;
    anioMin1, anioMin2: integer;

begin

    anioMin1:=9999;

    for i:= 1 to dimL do
    begin
        if (alumnos[i].anioN < anioMin1) then
        begin
            anioMin2:=anioMin1;
            anioMin1:=alumnos[i].anioN;
            Amax2 := Amax1;
            Nmax2:= Nmax1;
            Nmax1:= alumnos[i].nombre;
            Amax1:= alumnos[i].apellido;
        end
        else if (alumnos[i].anioN < anioMin2) then
        begin
            anioMin2:=alumnos[i].anioN;
            Amax2:= alumnos[i].apellido;
            Nmax2:= alumnos[i].nombre;
        end;
    end;
end;

// Programa Principal
var
    alumnoss: alumnos;
    Amax1, Amax2, Nmax1, Nmax2: string;
    dimL: integer;

begin
    writeln('Carga de datos');
    leerAlumnos(alumnoss,dimL);
    writeln();
    writeln('El porcentaje de alumnos con 3 digitos en el DNI es: ', PorcAlum3DNI(alumnoss, dimL):2:2);
    
    AlumMasGrandes(alumnoss,Amax1, Amax2, Nmax1, Nmax2, dimL);
    
    writeln('El alumno más grande es ', Amax1, ' ', Nmax1);
    writeln('El segundo más grande es ', Amax2, ' ', Nmax2);
end.
