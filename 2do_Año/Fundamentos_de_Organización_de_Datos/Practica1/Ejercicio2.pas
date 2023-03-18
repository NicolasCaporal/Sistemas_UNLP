{ 2. Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados
creados en el ejercicio 1, informe por pantalla cantidad de números menores a 1500 y el
promedio de los números ingresados. El nombre del archivo a procesar debe ser
proporcionado por el usuario una única vez. Además, el algoritmo deberá listar el
contenido del archivo en pantalla. }

program Ejercicio2_practica2;

type
    archivoInt = file of integer;

{ Programa principal }
var 
    nombreFisico: string;
    archivoNumeros: archivoInt;
    numeroActual: integer;
    contadorMenores1500 : integer;
    cantNumeros: integer;
    suma: integer;
    promedio: real;

begin

    contadorMenores1500 := 0;
    cantNumeros := 0;
    suma := 0;

    writeln('Ingrese el nombre del archivo guardado en memoria: ');
    readln(nombreFisico);

    assign(archivoNumeros, nombreFisico);

    reset(archivoNumeros);
    while (not EOF(archivoNumeros)) do 
    begin
        read(archivoNumeros, numeroActual);

        if (numeroActual < 1500) then 
            contadorMenores1500 := contadorMenores1500 + 1;
        cantNumeros := cantNumeros + 1;
        suma := suma + numeroActual;
        writeln(cantNumeros, ': ', numeroActual);
    end;

    writeln;
    writeln('La cantidad de numeros menores a 1500 fue de: ', contadorMenores1500);
    promedio := suma/cantNumeros;
    writeln('El promedio de los numeros ingresados fue: ', promedio:2:2);
end.