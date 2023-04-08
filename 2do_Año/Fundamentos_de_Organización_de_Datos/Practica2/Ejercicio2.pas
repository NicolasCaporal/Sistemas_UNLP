{ 2. Se dispone de un archivo con información de los alumnos de la Facultad de Informática. Por
cada alumno se dispone de su código de alumno, apellido, nombre, cantidad de materias
(cursadas) aprobadas sin final y cantidad de materias con final aprobado. 
Además, se tiene un archivo detalle con el código de alumno e información correspondiente a una materia
(esta información indica si aprobó la cursada o aprobó el final).

Todos los archivos están ordenados por código de alumno y en el archivo detalle puede
haber 0, 1 ó más registros por cada alumno del archivo maestro. 

Se pide realizar un programa con opciones para:

a. Actualizar el archivo maestro de la siguiente manera:
    i.Si aprobó el final se incrementa en uno la cantidad de materias con final aprobado.
    ii.Si aprobó la cursada se incrementa en uno la cantidad de materias aprobadas sin final.

b. Listar en un archivo de texto los alumnos que tengan más de cuatro materias
   con cursada aprobada pero no aprobaron el final. Deben listarse todos los campos.

NOTA: Para la actualización del inciso a) los archivos deben ser recorridos sólo una vez. }

program ejercicio2_practica2;
const 
    valor_especial = -1;

type 
    alumno = record 
        codigo: integer;
        apellido: String;
        nombre: String;
        cantCursadas: integer;
        cantFinales: integer; 
    end; 

    aprobacion = record
        codigo: integer;
        estado: integer; // 0 = cursada desaprobada | 1 = Cursada aprobada | 2 = Final aprobado
    end;

    archivo_alumnos = file of alumno;
    archivo_notas = file of aprobacion;

procedure leerN (var archivo: archivo_notas; var r: aprobacion);
begin
    if (not EOF(archivo)) then 
        read(archivo, r)
    else 
        r.codigo := valor_especial;
end;

procedure actualizarMaestro (nombreMaestro: string; nombreDetalle: string);
var 
    archiAlumnos: archivo_alumnos;
    archiNotas: archivo_notas;
    a: alumno;
    n: aprobacion;

begin 
    assign(archiAlumnos, nombreMaestro);
    assign(archiNotas, nombreDetalle);

    reset(archiAlumnos);
    reset(archiNotas);

    leerN(archiNotas, n);
    while (n.codigo <> valor_especial) do 
    begin
        read(archiAlumnos, a);
        while (a.codigo <> n.codigo) do 
            read(archiAlumnos, a);
        
        while (a.codigo = n.codigo) do 
        begin
            case n.estado of 
                1: a.cantCursadas := a.cantCursadas + 1;
                2: a.cantFinales := a.cantFinales + 1;  
            end;
            leerN(archiNotas, n);
        end;

        seek(archiAlumnos, filePos(archiAlumnos) - 1);
        write(archiAlumnos, a);
    end;

    close(archiAlumnos);
    close(archiNotas);
end;

procedure leerA (var archivo: archivo_alumnos; var r: alumno);
begin
    if (not EOF(archivo)) then 
        read(archivo, r)
    else 
        r.codigo := valor_especial;
end;

procedure listarAlumnos4cursadas (nombreArchivo: string);
var
    archivoTexto: text;
    nombreTxt: string;
    archivoBin: archivo_alumnos;
    a: alumno;

begin
    assign(archivoBin, nombreArchivo);
    reset(archivoBin);
    write('Ingrese el nombre del archivo de texto a crear: ');
    readln(nombreTxt);
    assign(archivoTexto, nombreTxt);
    rewrite(archivoTexto);

    leerA(archivoBin, a);
    while (a.codigo <> valor_especial) do 
    begin
        if (a.cantCursadas > 4) then 
        begin
            writeln(archivoTexto, a.codigo, ' ', a.cantCursadas, ' ', a.cantFinales, ' ', a.apellido);
            writeln(archivoTexto, a.nombre);
        end;
        leerA(archivoBin, a);
    end;

    close(archivoBin);
    close(archivoTexto);
end;


function opcion (): integer;
var 
    numero: integer;

begin
    writeln;
    writeln('MENU');
    writeln('1. Actualizar archivo de alumnos');
    writeln('2. Generar txt con 4 cursadas sin final');
    write('Elija la opcion deseada: ');
    readln(numero);
    opcion := numero;
end;


{ Programa principal }
var 
    eleccion: integer;
    nombreArchiAlumnos: string;
    nombreArchiNotas: string;

begin

    eleccion := opcion;

    write('Ingrese nombre del archivo de alumnos: ');
    readln(nombreArchiAlumnos);

    if (eleccion = 1) then 
    begin
        write('Ingrese nombre del archivo de notas: ');
        readln(nombreArchiNotas);
        actualizarMaestro(nombreArchiAlumnos, nombreArchiNotas);
    end
    else if (eleccion = 2) then 
    begin
        listarAlumnos4cursadas(nombreArchiAlumnos);
    end;

end.