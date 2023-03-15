{ 6. Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente información de
los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.),
cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en
nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores se lee de
forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no
debe procesarse). Se pide implementar un programa que lea información de los microprocesadores de la empresa
importadora e informe:
● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz. }

program Practica3_Ejercicio6;

type
    tipoProcesador = record
        marca: string;
        linea: string;
        cores: integer;
        ghz: real;
        sizeT: integer;
    end;
    
procedure leerProcesador(var procesador: tipoProcesador);
begin
    write('Marca: ');
    readln(procesador.marca);
    write('Linea: ');
    readln(procesador.linea);
    write('Cantidad cores: ');
    readln(procesador.cores);
    
    if (procesador.cores <> 0) then
    begin
        write('Velocidad reloj: ');
        readln(procesador.ghz);
        write('Tamaño transistores: ');
        readln(procesador.sizeT);
    end;
    writeln;
end;


function esBueno (procesador: tipoProcesador): boolean; {ANALIZAR POR CADA PROCESADOR}
begin
    esBueno := ((procesador.sizeT <= 22) and (procesador.cores > 2));
end;


procedure contarProcesadores14nm (siteT: integer; var contP: integer); {POR CADA PROCESADOR}
begin
    if (siteT = 14)then
        contP := contP + 1; writeln('sumo uno al contador de procesadores 14 nanometros, va: ', contP);
end;

procedure dosMarcasConMasDe14nm {POR CADA MARCA} (cantP: integer; nomMarca: string; var cantPMax1, cantPMax2: integer; var nomMarcaMax1, nomMarcaMax2: string);
begin
    if (cantP > cantPMax1)then
    begin
        cantPMax2 := cantPMax1; {writeln('actualizo maximo 2: ', cantPMax2);}
        nomMarcaMax2 := nomMarcaMax1; {writeln('actualizo maximo 2: ', nomMarcaMax2);}
        cantPMax1 := cantP; {writeln('actualizo maximo1: ', cantPMax1);}
        nomMarcaMax1 := nomMarca; {writeln('actualizó maximo 1: ', nomMarcaMax1);}
    end
    else if (cantP > cantPMax2) then
    begin
        cantPMax2 := cantP; {writeln('actualizó maximo 2: ', cantPMax2);}
        nomMarcaMax2 := nomMarca; {writeln('actualizo maximo 2: ', nomMarcaMax2);}
    end;
end;

procedure AMDorIntel2ghz {POR CADA PROCESADOR} (procesador: tipoProcesador; var contadorProcesadoresAMD, contadorProcesadoresIntel: integer);
begin
    if ((procesador.marca = 'AMD') and (procesador.ghz >= 2)) then BEGIN
        contadorProcesadoresAMD := contadorProcesadoresAMD + 1; {writeln('Sumo 1 al contador procesadores amd, va: ', contadorProcesadoresAMD)} END
    else if ((procesador.marca = 'intel') and (procesador.ghz >= 2))then
        contadorProcesadoresIntel := contadorProcesadoresIntel + 1; {writeln('Sumo 1 al contador procesadores intel, va: ', contadorProcesadoresIntel);}
end;

{Programa Principal}
var
    procesador: tipoProcesador;
    cantPMax1, cantPMax2: integer; 
    nomMarcaMax1, nomMarcaMax2: string;
    contadorProce2AMD: integer;
    contadorProceIntel: integer;
    contadorProce14: integer;
    marcaActual: string;
    
begin
    cantPMax1 := -9999;
    contadorProce2AMD := 0;
    contadorProceIntel := 0;
    leerProcesador(procesador);
    
    
    while (procesador.cores <> 0) do
    begin
        contadorProce14 := 0;
        marcaActual := procesador.marca;
        
        while (marcaActual = procesador.marca) do
        begin
            if (esBueno(procesador)) then
                writeln(procesador.marca, ' / ', procesador.linea);
            
            contarProcesadores14nm(procesador.sizeT, contadorProce14);
        
            if ( (procesador.cores > 1) and ((procesador.marca = 'AMD') or (procesador.marca = 'intel' )) ) then
                AMDorIntel2ghz(procesador, contadorProce2AMD, contadorProceIntel);
            
        leerProcesador(procesador);
        end;
        
        
        if ((marcaActual = 'intel') and (contadorProceIntel > 0)) then
            writeln(marcaActual, ' tiene ', contadorProceIntel, ' procesadores de mas de 2 ghz')
        else if ((marcaActual = 'AMD') and (contadorProce2AMD > 0))then
            writeln(marcaActual, ' tiene ', contadorProce2AMD, ' procesadores de mas de 2 ghz'); 
            
        dosMarcasConMasDe14nm(contadorProce14, marcaActual, cantPMax1, cantPMax2, nomMarcaMax1, nomMarcaMax2);
    end;
    
    writeln('Las marcas con mayor cantidad de procesadores con transistores de 14nm son ', nomMarcaMax1, ' y ', nomMarcaMax2);
end.