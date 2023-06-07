{3. Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de
2020. De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de
destino y kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código
de auto y para un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número
de viaje.}
program Ejercicio3_Practica7;

type
    viaje = record 
        numeroDeViaje: integer;
        code: integer;
        direccionOrigen: string;
        direccionDestino: string;
        kms: real;
    end;
    
    lista=^nodo;
    nodo = record
        dato: viaje;
        sig: lista;
    end;
    


procedure insertarOrdenado (var l: lista; v: viaje);
var
    nue, ant, act: lista;

begin
    new(nue);
    nue^.dato := v;
    
    ant := l;
    act := l;
    
    if (l = nil) then
        l := nue
    else 
    begin
        while (act <> nil) and (nue^.dato.code > act^.dato.code) do 
        begin
            ant := act;
            act := act^.sig;
        end;
        
        if (ant = act) then
        begin
            nue^.sig := l;
            l := nue;
        end
        else
        begin
            ant^.sig := nue;
            nue^.sig := act;
        end;
        
    end;
end;


{b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número de viaje.}
procedure insertarOrdenadoB (var l: lista; v: viaje);
var
    nue, ant, act: lista;

begin
    new(nue);
    nue^.dato:=v;
    act := l;
    ant := l;
    
    while ((act <> nil) and (act^.dato.numeroDeViaje < v.numeroDeViaje)) do 
    begin
        ant:=act;
        act:=act^.sig;
    end;
    
    if (act = ant) then
    begin
        nue^.sig := l;
        l := nue;
    end
    else
    begin
        ant^.sig:=nue;
        nue^.sig:=act;
    end;
end;


procedure cargarViaje (var v: viaje);
begin
    write('Ingrese codigo de auto: ');
    readln(v.code);
    if (v.code <> -1) then
    begin
        write('Ingrese Nro de Viaje: ');
        readln(v.numeroDeViaje);
        write('Ingrese direccion de origen: ');
        readln(v.direccionOrigen);
        write('Ingrese direccion de destino: ');
        readln(v.direccionDestino);
        write('Ingrese kilometros realizados: ');
        readln(v.kms);
        writeln;
    end;
end;


procedure cargarLista (var l, lB: lista);
var
    v: viaje;
    contador: integer;

begin
    contador := 1;
    writeln(contador, ')');
    cargarViaje(v);
    
    while (v.code <> -1) do 
    begin
        insertarOrdenado(l, v);
        if (v.kms > 5) then //Inciso B
            insertarOrdenadoB(lB, v); 
        contador:= contador + 1;
        writeln(contador, ')');
        cargarViaje(v);
    end;
end;


procedure imprimirViaje (v: viaje);
begin
    writeln('Codigo: ', v.code);
    writeln('Numero de viaje: ', v.numeroDeViaje);
    writeln('Direccion de origen: ', v.direccionOrigen);
    writeln('Direccion de destino: ', v.direccionDestino);
    writeln('Kilometros recorridos: ', v.kms:2:2);
    writeln;
end;


procedure imprimirLista (l: lista);
begin
    writeln(' IMPRIMIENDO LISTA ==============================================');
    while (l <> nil) do 
    begin
        imprimirViaje(l^.dato);
        l := l^.sig;
    end;
    writeln('=================================================================');
end;


{a. Informar los dos códigos de auto que más kilómetros recorrieron.}
procedure calcularSiEsMax (suma: real; var max1, max2: real; code: integer; var cMax1, cMax2: integer);
begin
    if (suma > max1) then
    begin
        writeln('Es max 1: ', suma:2:2);
        max2 := max1;
        cMax2 := cMax1;
        max1:= suma;
        cMax1 := code;
    end
    else if (suma > max2) then
    begin
        writeln('Es max 2: ', suma:2:2);
        max2 := suma;
        cMax2 := code;
    end;
end;


procedure informarDosMax (l: lista);
var
    act: integer;
    suma: real;
    max1,max2: real;
    cMax1, cMax2: integer;

begin

    max1:=-1;
    max2:=-1;
    writeln('Arranca procedure informar dos max');
    while (l <> nil) do
    begin
        writeln('entra al while principal, de recorrer la lista');
        suma := 0;
        act := l^.dato.code;
        while (l<>nil) and (act = l^.dato.code) do
        begin
            writeln('Es el mismo code: ', l^.dato.code);
            write(suma:2:2, ' + ', l^.dato.kms:2:2, ' = ');
            suma := suma + l^.dato.kms;
            writeln(suma:2:2);
            l := l^.sig;
        end;
        writeln;
        calcularSiEsMax(suma, max1, max2, act, cMax1, cMax2);
        writeln('Por ahora, max1: ', max1:2:2, ' de code ', cMax1, ' y max2: ', max2:2:2, ' de code ', cMax2);
        writeln;
    end;
    writeln;
    writeln('=================================================================');
    writeln;
    writeln('Los dos codigos de auto con mas kilometros recorridos son: codigo ', cMax1, ' con ', max1:2:2, ' kms, y codigo ', cMax2, ' con ', max2:2:2,' kms');
    writeln;
end;



{PROGRAMA PRINCIPAL}
var
    l, lB: lista;

begin
    l := nil;
    cargarLista(l, lB);
    writeln('LISTA TOTAL');
    imprimirLista(l);
    informarDosMax (l);
    writeln('LISTA DE MAS DE 5KMS, ORDENADA POR NUMERO DE VIAJE');
    imprimirLista(lB);
end.
