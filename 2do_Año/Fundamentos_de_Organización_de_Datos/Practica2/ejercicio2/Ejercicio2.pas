{ 2. Se dispone de un archivo con información de los alumnos de la Facultad de Informática. Por
cada alumno se dispone de su código de alumno, apellido, nombre, cantidad de materias
(cursadas) aprobadas sin final y cantidad de materias con final aprobado. 
Además, se tiene un archivo detalle con el código de alumno e información correspondiente a una materia
(esta información indica si aprobó la cursada o aprobó el final).

Todos los archivos están ordenados por código de alumno y en el archivo detalle puede
haber 0, 1 ó más registros por cada alumno del archivo maestro. Se pide realizar un
programa con opciones para:

a. Actualizar el archivo maestro de la siguiente manera:
    i.Si aprobó el final se incrementa en uno la cantidad de materias con final aprobado.
    ii.Si aprobó la cursada se incrementa en uno la cantidad de materias aprobadas sin final.

b. Listar en un archivo de texto los alumnos que tengan más de cuatro materias
   con cursada aprobada pero no aprobaron el final. Deben listarse todos los campos.

NOTA: Para la actualización del inciso a) los archivos deben ser recorridos sólo una vez. }

program ejercicio2_practica2;

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



{ Programa principal }
var 

begin


end.