{1. Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de
género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura
finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.}

program Practica7_Ejercicio1;

type
    genero = 1..5;
    
    persona = record
        DNI: longint;
        NyA: string;
        edad: integer;
        code: genero;
    end;
    
    lista = ^nodo;
    nodo = record
        dato: persona;
        sig: lista;
    end;
    
    contGeneros = array [genero] of integer;



procedure agregarAdelante (var l: lista; d: persona);
var
    nue: lista;

begin
    new(nue);
    nue^.dato := d;
    nue^.sig:= l;
    l := nue;
end;


procedure leerUnaPersona (var per: persona);
begin
    write('Ingrese DNI: ');
    readln(per.dni);
    write('Ingrese Nombre y apellido: ');
    readln(per.NyA);
    write('Ingrese edad: ');
    readln(per.edad);
    write('Ingrese codigo: ');
    readln(per.code);
end;


procedure leerPersonas (var l: lista);
var
    per: persona;

begin

    repeat 
    begin
        leerUnaPersona(per);
        agregarAdelante(l, per);
    end
    until (per.dni = 33555444);
    writeln('SALIO DEL WHILE');
end;


procedure imprimirPersona (per: persona);
begin
    write('DNI: ');
    writeln(per.dni);
    write('Nombre y apellido: ');
    writeln(per.NyA);    
    write('Edad: ');
    writeln(per.edad);    
    write('Codigo: ');
    writeln(per.code);
end;


procedure imprimirLista (l: lista);
begin
    while (l <> nil) do
    begin
        imprimirPersona(l^.dato);
        l := l^.sig;
    end;
end;


procedure contarPeIdeUnDNI (num: longint; var contP, contI: integer);
begin
    contP := 0;
    contI := 0;
    while (num <> 0) do
    begin
        if (num mod 2 = 0) then
        begin
            contP:=contP+1;
            //writeln(num, 'PAR'); //
        end
        else
        begin
            contI:=contI+1;
            //writeln(num, 'IMPAR'); 
        end;
        num := num div 10;
    end;
end;


procedure CeroContadorGenero (var cont: contGeneros);
var
    i: integer;

begin
    for i := 1 to 5 do
    begin
        cont[i]:=0;
    end;
end;


procedure recorrerLista (l: lista; var contadorMasPares: integer; VectorContador: contGeneros);
var
    contP, contI: integer;}

begin
    contadorMasPares := 0;
    CeroContadorGenero(VectorContador);
    while (l <> nil) do
    begin
        contarPeIdeUnDNI(l^.dato.dni, contP, contI);
        if (contP > contI) then
        begin
            contadorMasPares:=contadorMasPares + 1;
            // writeln('Sumo 1 a pares, ahora va: ', contadorMasPares); 
        end;   
        
        VectorContador[l^.dato.code] := VectorContador[l^.dato.code] + 1;
        
        l := l^.sig;
    end;
end;


procedure dosCodesMasElegidos (vecC: contGeneros; var IndiceMax1, IndiceMax2: integer);
var
    numeroMax1, numeroMax2, i: integer;

begin
    numeroMax1:= -1;
    for i:= 1 to 5 do 
    begin
        if (vecC[i] > numeroMax1) then
        begin
            numeroMax2 := numeroMax1;
            IndiceMax2 := IndiceMax1;
            numeroMax1 := vecC[i];
            IndiceMax1 := i;
        end
        else if (vecC [i] > numeroMax2) then
        begin
            numeroMax2 := vecC[i];
            IndiceMax2 := i;
        end;
    end;
end;


// c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no existir. Invocar dicho módulo en el programa principal.}
procedure eliminarPersona (dni: longint; var l: lista);
var
    actual, anterior: lista;

begin
    actual:=l;
    anterior := l;
    while ((actual <> nil) and (actual^.dato.dni <> dni)) do
    begin
        anterior:= actual;
        actual := actual^.sig;
    end;
    
    if (actual = anterior) then
        l := l^.sig
    else if (actual = nil) then
    begin
        anterior^.sig := nil;
        dispose(actual);
    end
    else
        anterior^.sig:=actual^.sig;
end;



{PROGRAMA PRINCIPAL}
var
    l: lista;
    contMasPares: integer;
    VectorContador: contGeneros;
    codeMasElegido1, codeMasElegido2: integer;
    DNI: longint;

begin
    l := nil;
    
    
    leerPersonas(l);
    writeln;
    
    imprimirLista(l);
    writeln;
    
    recorrerLista(l, contMasPares, VectorContador);
    
    dosCodesMasElegidos(VectorContador, codeMasElegido1, codeMasElegido2);
    writeln('Hay ', contMasPares, ' personas con mas digitos pares que impares en su DNI');
    writeln('Los dos codigos de genero más elegidos son el ', codeMasElegido1, ' y el ', codeMasElegido2);
    writeln;
    
    writeln('Ingrese el DNI de la persona que desea eliminar de la lista: ');
    readln(DNI);
    eliminarPersona (dni, l);
    writeln;
    imprimirLista(l);
    
end.
