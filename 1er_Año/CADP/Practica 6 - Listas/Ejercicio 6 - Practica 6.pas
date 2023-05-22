{6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas
al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión
(cantidad de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y
rango del espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al
ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible}

program Practica6_Ejercicio6;

type
RE = 1..7;

    sonda = record
        nombre: string;
        duracionE: real;
        costoC: real;
        costoMM: real;
        rango: RE;
    end;
    
    lista=^nodo;
    nodo = record
        dato: sonda;
        sig: lista;
    end;
    
    rangosElectromagneticos = array [RE] of integer;



procedure cargarSonda (var s: sonda);
begin
    write('Ingrese nombre: ');
    readln(s.nombre);
    write('Ingrese duracion estimanda: ');
    readln(s.duracionE);
    write('Ingrese costo de construcción: ');
    readln(s.costoC);
    write('Ingrese costo mensual de mantenimiento: ');
    readln(s.costoMM);
    write('Ingrese rango: ');
    readln(s.rango);
    writeln;
end;


procedure agregarAtras (var l, ult: lista; s: sonda);
var
    nue: lista;

begin
    new(nue);
    nue^.dato := s;
    if (L = nil) then
        l:=nue
    else
        ult^.sig:=nue;
    ult := nue;
end;


procedure cargarLista (var L: lista; S: sonda);
var
    ult: lista;

begin
    repeat
        cargarSonda(S);
        agregarAtras(L, ult, S);
    until (s.nombre = 'GAIA');
end;


procedure imprimirSonda (s: sonda);
begin
    write('Nombre: ');
    writeln(s.nombre);
    write('Duracion estimanda: ');
    writeln(s.duracionE:2:2);
    write('Costo de construcción: ');
    writeln(s.costoC:2:2);
    write('Costo mensual de mantenimiento: ');
    writeln(s.costoMM:2:2);
    write('Rango: ');
    writeln(s.rango);
    writeln;
end;


procedure imprimirLista (l: lista);     
begin
    WRITEln('Imprimiendo lista...');
    while (L <> nil) do
    begin
        imprimirSonda(l^.dato);
        L := L^.sig;
    end;
end;


procedure masCostosa (l: lista; var masCaro: real; var NmasCaro: string); {Inicializar masCaro en -9999} {Inciso A}
var
    costoTotal: real;

begin
    costoTotal := (l^.dato.costoC + (l^.dato.costoMM * l^.dato.duracionE));
    if (masCaro < costoTotal) then
    begin
        masCaro := costoTotal;
        NMasCaro := l^.dato.nombre;
    end;
end;


procedure inicializarEn0EE (var EE: rangosElectromagneticos); {Inciso B}
var
    i: RE;

begin
    for i := 1 to 7 do 
        EE[i] := 0;
end;


procedure contadorEE (var EE: rangosElectromagneticos; L: lista); {Inciso B}
begin
    EE[L^.dato.rango] := EE[L^.dato.rango] + 1;  
end;


procedure informarEE (EE: rangosElectromagneticos);
var
    i: integer;

begin
    for i := 1 to 7 do 
        writeln(EE[i]);
end;


procedure recorrerListayComparar (L: lista; var masCaro: real; var NMasCaro: string; var EE: rangosElectromagneticos; var sumaTiempos, sumaCostos: real; var contT: integer);
begin
    inicializarEn0EE(EE);
    sumaTiempos := 0;
    sumaCostos := 0;
    contT := 0;
    while (L <> nil) do 
    begin
        masCostosa(L, masCaro, NMasCaro);
        contadorEE(EE, L);
        sumaTiempos:=sumaTiempos+ l^.dato.duracionE;
        sumaCostos:= sumaCostos + L^.dato.costoC;
        contT:=contT+1;
        
        L := L^.sig;
    end;
    //WRITELN('LA SUMA DE TIEMPOS DIO ', sumaTiempos:2:2, ' Y LA SUMA DE COSTOS DIO ', SUMACOSTOS:2:2, ' Y INGRESASTE ', contT , ' CANTIDAD DE SONDAS');
end;


procedure contadorSupPromedios (sumaTiempos: real; sumaCostos: real; contT: integer; l: lista; var cantSondasMayorT: integer; var mayorCosto: lista);
var
    promT, promC: real;
    ult: lista;

begin
    cantSondasMayorT := 0;
    promT := sumaTiempos/contT; //WRITELN('EL TIEMPO PROMEDIO DIO ', promT:2:2);
    promC := sumaCostos/contT;  //WRITELN('EL COSTO PROMEDIO DIO ', promC:2:2);
    while (L <> nil) do
    begin
        if (L^.dato.duracionE > promT) then
            cantSondasMayorT := cantSondasMayorT + 1;
            //WRITELN('SUMO UNO A LA CANTIDAD SONDAS MAYOR T'); //
        
        if (L^.dato.costoC > promC) then
        begin
            agregarAtras(mayorCosto, ult, L^.dato);
            //writeln('ENTRO AL IF QUE CREO LISTA DE MAYOR COSTO'); //
        end;
        
        L := L^.sig;
    end;
end;



{PROGRAMA PRINCIPAL}
var
    S: sonda;
    L, mayorCosto: lista;
    masCaro, sumaCostos, sumaTiempos: real;
    NMasCaro: string;
    EE: rangosElectromagneticos;
    contT, cantSondasMayorT: integer;

begin
    masCaro := -9999;
    L := nil;
    mayorCosto := nil;
    cargarLista(L, S);
    imprimirLista(L);
    recorrerListayComparar(L, masCaro, NMasCaro, EE, sumaTiempos, sumaCostos, contT);
    contadorSupPromedios(sumaTiempos, sumaCostos, contT, L, cantSondasMayorT, mayorCosto);
    
    writeln('El nombre de la sonda mas costosa es ', NmasCaro);
    writeln;
    
    writeln('La cantidad de sondas por cada rango del Espectro Electromanetico es ');
    informarEE(EE);
    writeln;
    
    write('La cantidad de sondas con duracion estimada mayor al promedio es de ', cantSondasMayorT);
    writeln;
    
    writeln('Las sondas con costo de construcción mayor al promedio son: ');
    imprimirLista(mayorCosto);
end.

