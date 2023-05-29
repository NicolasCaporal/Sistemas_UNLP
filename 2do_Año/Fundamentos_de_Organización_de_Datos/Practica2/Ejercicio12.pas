{ 12. La empresa de software ‘X’ posee un servidor web donde se encuentra alojado el sitio de
la organización. En dicho servidor, se almacenan en un archivo todos los accesos que se
realizan al sitio.
La información que se almacena en el archivo es la siguiente: año, mes, dia, idUsuario y
tiempo de acceso al sitio de la organización. El archivo se encuentra ordenado por los
siguientes criterios: año, mes, dia e idUsuario.

Se debe realizar un procedimiento que genere un informe en pantalla, para ello se indicará
el año calendario sobre el cual debe realizar el informe. 
El mismo debe respetar el formato mostrado a continuación: 
Año : ---
Mes:-- 1
día:-- 1
idUsuario 1 Tiempo Total de acceso en el dia 1 mes 1
--------
idusuario N Tiempo total de acceso en el dia 1 mes 1
Tiempo total acceso dia 1 mes 1
-------------
día N
idUsuario 1 Tiempo Total de acceso en el dia N mes 1
--------
idusuario N Tiempo total de acceso en el dia N mes 1
Tiempo total acceso dia N mes 1
Total tiempo de acceso mes 1
------
Mes 12
día 1
idUsuario 1 Tiempo Total de acceso en el dia 1 mes 12
--------
idusuario N Tiempo total de acceso en el dia 1 mes 12
Tiempo total acceso dia 1 mes 12
-------------
día N
idUsuario 1 Tiempo Total de acceso en el dia N mes 12
--------
idusuario N Tiempo total de acceso en el dia N mes 12
Tiempo total acceso dia N mes 12
Total tiempo de acceso mes 12
Total tiempo de acceso año

Se deberá tener en cuenta las siguientes aclaraciones:
- El año sobre el cual realizará el informe de accesos debe leerse desde teclado.
- El año puede no existir en el archivo, en tal caso, debe informarse en pantalla “año
no encontrado”.
- Debe definir las estructuras de datos necesarias.
- El recorrido del archivo debe realizarse una única vez procesando sólo la información
necesaria. }

program ejercicio11_practica2;

type 

    fecha = record 
        d: 0..31;
        m: 0..12;
        a: integer;
    end;

    informacion = record 
        f : fecha;
        id: integer;
        tiempoAcceso: real;
    end;

    archivo = file of informacion;



function buscarAnio(anio: integer; var a: archivo): boolean;
var 
    r: informacion;
    rta: boolean;

begin
    reset(a);

    read(a, r);
    while ((not EOF(a)) and (r.f.a <> anio)) do
    begin
        read(a, r); 
    end;


    if (r.f.a = anio) then 
    begin
        seek(a, filePos(a) - 1);
        rta := true;
    end
    else 
    begin
        close(a);
        rta := false;
    end;
    
    buscarAnio := rta;
end;


procedure leerInformacion (var a: archivo; var info: informacion);
begin
    if (not EOF(a)) then 
        read(a, info)
    else 
    begin 
        info.f.d := 0;
        info.f.m := 0;
        info.f.a := 0;
    end;
end;


procedure listarInformacionAnio (anio: integer; var a: archivo);
var 
    actual: informacion;
    mesActual: 1..12;
    diaActual: 1..31;
    
    tiempoTotalDia: real;
    tiempoTotalMes: real;
    tiempoTotalAnio: real;

begin
    leerInformacion(a, actual);

    writeln('AÑO ', anio);
    tiempoTotalAnio := 0;

    while (actual.f.a = anio) do 
    begin
        
        mesActual := actual.f.m;
        writeln;
        writeln('MES ', mesActual);
        tiempoTotalMes := 0;

        while (mesActual = actual.f.m) do 
        begin
            
            diaActual := actual.f.d;
            writeln;
            writeln('DIA ', diaActual);
            tiempoTotalDia := 0;

            while (diaActual = actual.f.d) do
            begin 

                writeln('idUsuario ', actual.id);
                writeln('Tiempo de acceso en el dia ', diaActual,' mes ', mesActual, ' = ', actual.tiempoAcceso);
                writeln;

                tiempoTotalDia := tiempoTotalDia + actual.tiempoAcceso;

                leerInformacion(a, actual);

            end; 

            writeln('Tiempo total acceso dia', diaActual, ' mes ', mesActual, ' = ', tiempoTotalDia);
            tiempoTotalMes := tiempoTotalMes + tiempoTotalDia;

        end;

        writeln('Total tiempo de acceso en el mes ', mesActual, ' = ', tiempoTotalMes);
        tiempoTotalAnio := tiempoTotalAnio + tiempoTotalMes;

    end;

    writeln('Total tiempo de acceso en el año ', anio, ' = ', tiempoTotalAnio);

end;



{ Programa principal }
var 
    anio: integer;
    a: archivo;
    esta: boolean;

begin 
    write('Ingrese un año: ');
    readln(anio);
    
    assign(a, 'informacion.dat');

    esta := buscarAnio(anio, a);
    if (esta) then
        listarInformacionAnio(anio, a)
    else
        writeln('Año no encontrado');
end. 