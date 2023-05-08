{3. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida
por el camión (medida en kilómetros).
a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.
c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez}

program practica4b_ejercicio3;

const
    maxViajes = 200;

type
    dia = 1..31;
    
    viaje = record 
        dia: dia;
        monto: real;
        distancia: real;
    end;
    
    viajes = array [1..maxViajes] of viaje;
    
procedure leerViaje (var viaje: viaje);
begin
    write('Día: ');
    readln(viaje.dia);
    write('Monto: ');
    readln(viaje.monto);
    write('Distancia: ');
    readln(viaje.distancia);
    writeln();
end;
    
procedure cargarViajes (var viajes: viajes; var dl: integer); // PROBLEMA a) -----------------------------------------
var 
    viajee: viaje;
begin
    dl := 1;
    writeln('Viaje numero ', dl, ': ');
    leerViaje(viajee);
    viajes[dl] := viajee;

    while (dl < maxViajes) and (viajes[dl].distancia <> 0) do 
    begin
        dl := dl +1;
        writeln('Viaje numero ',dl, ': ');
        leerViaje(viajee);
        viajes[dl] := viajee;
    end;

    if (viajes[dl].distancia = 0) then
        dl := dl -1;
end;

procedure ImprimirV (viajes: viajes; dl: integer);
var
    i: integer;

begin
    writeln('-------------- IMPRIMIENDO VECTOR -------------- ');
    writeln();

    for i:= 1 to dl do 
    begin
        writeln('Viaje numero ',i, ': ');
        write('Día: ');
        writeln(viajes[i].dia);
        write('Monto: ');
        writeln(viajes[i].monto:2:2);
        write('Distancia: ');
        writeln(viajes[i].distancia:2:2);
        writeln();
    end;
    
    writeln('------------------------------------------------ ');
    writeln();
end;

// PROBLEMA b)
procedure InformarData (viajes: viajes; dl: integer);   //Es un solo procedure, con 80 cosas adentro, porque hay que recorrelo solo una vez :) 
    type
        cantViajes = array [dia] of integer;
        
    procedure inicializarEn0Dias (var cantViajes: cantViajes);
    var 
        i: integer;
        
    begin
        for i := 1 to 31 do 
        begin
            cantViajes[i] := 0;
        end;
    end;

    procedure informarVPorDia (cantViajes: cantViajes);
    var
        i: integer;

    begin
        writeln('La cantidad de viajes por día, es la siguiente: ');
        for i := 1 to 31 do 
        begin
            write('Día ', i, ': ');
            writeln(cantViajes[i]);
        end;
    end;
    
    //Ejecucion principal del procedure InformarData
var
        i:integer;
        suma:real;
        promedio: real;
        
        minDinero: real; //el que voy a usar para evaluar la condición, los otros dos se informan
        indiceMin: integer;
        
        cantVxD: cantViajes;
begin
        inicializarEn0Dias(cantVxD);
        suma := 0;
        minDinero := 9999;
        for i := 1 to dl do 
        begin
            suma := suma + viajes[i].monto; //El monto promedio transportado de los viajes realizados
            
            if (viajes[i].monto < minDinero) then //La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero
            begin
                minDinero := viajes[i].monto;
                indiceMin := i; 
            end;
            
            cantVxD[viajes[i].dia] := cantVxD[viajes[i].dia] + 1; //  La cantidad de viajes realizados cada día del mes.
                
        end;
        promedio:=suma/dl;
        
        // Informa todo
        writeln();
        writeln('El monto promedio de los viajes fue ', promedio:2:2);
        writeln();
        writeln('El viaje que transportó menos dinero se realizó el día ', viajes[indiceMin].dia, ' y tuvo una distancia de ', viajes[indiceMin].distancia:2:2, 'kms.' );
        writeln();
        informarVPorDia(cantVxD);
end;

procedure eliminarDist100 (var viajes: viajes; var dl: integer; var ok: boolean); //PROBLEMA c) 
var 
    pos: integer;
    i: integer;
    i2: integer;

begin
    for i := 1 to dl do 
    begin
        if (viajes[i].distancia = 100) then
        begin
            pos := i;
            for i2 := pos to dl do 
            begin
                viajes[i] := viajes[i+1];
            end;
            dl := dl -1;
        end;
    end;
end; 

// Programa Principal
var
    viajess: viajes;
    dl: integer;
    ok: boolean;

begin
  cargarViajes(viajess, dl);
  ImprimirV(viajess, dl);
  InformarData (viajess, dl);
  writeln();
  eliminarDist100(viajess, dl, ok);
  ImprimirV(viajess, dl);
end.
