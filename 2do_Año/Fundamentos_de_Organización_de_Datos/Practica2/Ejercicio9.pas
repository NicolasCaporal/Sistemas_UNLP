{ 9. Se necesita contabilizar los votos de las diferentes mesas electorales registradas por provincia y localidad. 
Para ello, se posee un archivo con la siguiente información: 
código de provincia, código de localidad, número de mesa y cantidad de votos en dicha mesa.

Presentar en pantalla un listado como se muestra a continuación:

Código de Provincia
Código de Localidad              Total de Votos
................................ ......................
................................ ......................
Total de Votos Provincia: ___

Código de Provincia
Código de Localidad              Total de Votos
................................ ......................
Total de Votos Provincia: ___

…………………………………………………………..
Total General de Votos: ___

NOTA: La información se encuentra ordenada por código de provincia y código de localidad. }

program ejercicio9_practica2;

const 
    valorEspecial = 9999;

type 
    dato = record 
        provincia: integer;
        localidad: integer;
        mesa: integer;
        votos: integer;
    end;

    archivo = file of dato;



procedure leerDato (var a: archivo; var rta: dato);
begin
    if (not EOF(a)) then
        read(a, rta)
    else 
        rta.provincia := valorEspecial;
end;


procedure ProcesarInformarDatos (var a: archivo);
var 
    actual: dato;
    provinciaActual: integer;
    localidadActual: integer;

    totalVotosL: integer;
    totalVotosP: integer;
    totalGeneralVotos: integer;

begin
    reset(a);

    leerDato(a, actual);
    totalGeneralVotos := 0;

    while (actual.provincia <> valorEspecial) do 
    begin

        provinciaActual := actual.provincia;
        totalVotosP := 0;
        writeln('Codigo de Provincia: ', provinciaActual);

        while ((actual.provincia = provinciaActual)) do 
        begin

            localidadActual := actual.localidad;
            totalVotosL := 0;

            while ((actual.provincia = provinciaActual) and (actual.localidad = localidadActual)) do 
            begin
                totalVotosL := totalVotosL + actual.votos;
                leerDato(a, actual);
            end;

            writeln('Codigo de Localidad: ', localidadActual, '     Total de Votos: ', totalVotosL);
            totalVotosP := totalVotosP + totalVotosL;

        end;

        writeln('Total Votos de Provincia: ', totalVotosP);
        totalGeneralVotos := totalGeneralVotos + totalVotosP;
        writeln;

    end;

    writeln;
    writeln('Total General de Votos: ', totalGeneralVotos);

    close(a);
end;


{ Programa principal }
var 
    a: archivo;

begin 
    assign(a, 'informacion.dat');
    ProcesarInformarDatos(a);
end.
