{ 7. Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.
b. el dígito más leído.
c. los dígitos que no tuvieron ocurrencias.
Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
Número 3: 2 veces
Número 4: 2 veces
Número 6: 2 veces
Número 9: 4 veces
El dígito más leído fue el 9.
2
CADP 2022 – Práctica 4 – Vectores 2022
Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8 }

program practica4a_ejercicio7;

type 
    ocurrenciasD = array [0..9] of integer;

procedure descNum (var oc: ocurrenciasD; numero: integer);
var 
    digito: integer;
begin
    while (numero <> 0) do 
    begin
        digito := numero MOD 10;
        oc[digito] := oc[digito] + 1;
        numero := numero DIV 10; 
    end;
end;

function masLeido (oc: ocurrenciasD): integer;
var 
    maxD: integer;
    maxI: integer;
    i: integer;

begin
    maxD := -1;
    for i := 0 to 9 do 
    begin 
        if ( oc[i] > maxD) then 
        begin
            maxD := oc[i];
            maxI := i;  
        end;
    end;
    masLeido := maxI;
end;

procedure informarOc (oc: ocurrenciasD);
var 
    i: integer; 

begin
    for i := 1 to 9 do 
    begin
        if (oc[i] > 0) then 
            writeln('Numero ', i , ': ', oc[i]);
    end;
    writeln;
    
    write('Los digitos que no tuvieron ocurrencias son: ');
    for i := 1 to 9 do 
    begin 
        if (oc[i] = 0) then 
            writeln(' ', i , ' ');
    end;
end;

procedure inicializarEn0 (var oc: ocurrenciasD);
var
    i: integer;
begin
    for i := 1 to 9 do 
        oc[i] := 0;
end;

{ Programa principal }
var 
    ocu: ocurrenciasD;
    num: integer;
    i: integer;

begin
    inicializarEn0 (ocu);

    writeln('Ingrese varios numeros. Para finalizar, ingrese -1');
    readln(num);

    while (num <> -1) do 
    begin
        descNum(ocu, num); 
        readln(num);
    end;
    
    writeln;
    writeln('El digito más leído fue el: ', masLeido(ocu));
    writeln;

    writeln('Ocurrencias: ');
    informarOc(ocu);
end.