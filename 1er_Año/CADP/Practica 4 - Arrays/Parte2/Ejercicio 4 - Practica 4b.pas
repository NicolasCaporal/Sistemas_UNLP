{4. Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos
leídos de teclado.}

program Practica4b_Ejercicio 4;

const
    maxAlumnos = 1000;
    
type
    alumno = record
        nroAlumno: integer;
        nombre: string;
        apellido: string;
        asist: integer;
    end;
    
    dataAlumnos = array [1..maxAlumnos] of alumno;
    
procedure cargarAlumnos (var dataA: dataAlumnos; var dl: integer); // Se dispone, no hace falta implementarlo
begin
end;


procedure posicionAlumno (dataA: dataAlumnos, dl: integer; var nroAlumno: integer; var posicion: integer); // Problema a)
begin
    posicion := 1;
    while (dataA[posicion].nroAlumno <> nroAlumno) do // El alumno seguro existe, si no habría que verificar que (nroAlumno < a dataA[posicion].nroAlumno)
        posicion := posicion +1;
    nroAlumno := dataA[posicion].nroAlumno;
end;

procedure insertarAlum (alumno; var dataA: dataAlumnos; var dl: integer;); //Problema b)
var 
    pos: integer;

begin
    if (dl < maxAlumnos) then
    begin
        pos:=1;
        repeat
            pos := pos + 1;
        until (dataA[pos].nroAlumno < alumno.nroAlumno);
    
        for i := dl downto pos do 
        begin 
            dataA[i+1] := dataA[i];
        end;
    
        dl := dl +1;
        dataA[pos] := alumno;
    end
    else 
        writeln('ERROR: No se pudo insertar al alumno. El vector está lleno');
end;

procedure eliminarAlumPos (var dataA: dataAlumnos; var dl: integer; posicion: integer); // Problema c)
var 
    i: integer;

begin
    for i := posicion to dl do 
    begin
        dataA[i] := dataA[i+1];
    end;
    dl := dl-1;
end;

procedure eliminarAlumNro (var dataA: dataAlumnos; var dl: integer; nroAlumno: integer); // Problema d)
var 
    posicionAlumno: integer;

begin
    posicionAlumno(dataA, dl, nroAlumno, posicionAlumno); // Reutilizo el módulo del problema a)
    for i := posicionAlumno to dl do 
    begin
        dataA[i] := dataA[i+1];
    end;
    dl := dl -1;
end;

procedure eliminarAsistEn0 (var dataA: dataAlumnos; var dl: integer); // Problema e)
var
    i: integer;

begin
    for i := 1 to dl do
    begin
        if (dataA[i].asist = 0) then
            eliminarAlumPos(dataA, dl, i); // Reutilizo el modulo del problema c)
    end;
end;

// PROGRAMA PRINCIPAL 
var
    dataA: dataAlumnos;
    dl: integer;
    nroAa: integer;
    posA: integer;
    alumnoB: alumno;
    posC: integer;
    nroAd: integer;
    
begin
    cargarAlumnos (dataA, dl);
    
    //Invoca problema a)
    readln(nroA);
    procedure posicionAlumno (dataA, dl, nroA, posA);
    
    //Invoca Problema b)
    readln(alumnoB.nroAlumno);
    readln(alumnoB.nombre);
    readln(alumnoB.apellido);
    readln(alumnoB.asist);
    insertarAlum (alumnoB, dataA, dl);
    
    //Invoca Problema c)
    readln(posC);
    eliminarAlumPos (dataA,dl, posC);
    
    //Invoca Problema d)
    readln(nroAd);
    eliminarAlumNro (dataA, dl, nroAd);
    
    //Invoca Problema e)
    eliminarAsistEn0 (dataA, dl); 
end.

