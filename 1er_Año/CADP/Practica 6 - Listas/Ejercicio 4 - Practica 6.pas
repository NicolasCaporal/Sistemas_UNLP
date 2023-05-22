{4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la
lista que son múltiplos de A.}

program Practica6_Ejercicio4;

type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;



procedure armarNodo(var L, ult: lista; v: integer); {Agrega atras}
var
    nue: lista;

begin
    new(nue);
    nue^.num := v;
    nue^.sig := nil;
    
    if (L = nil) then
        l := nue
    else
        ult^.sig := nue;
    ult := nue;
end;


procedure imprimirLista (l: lista);
var 
    aux: lista;

begin
    writeln();
    writeln('Imprimiendo lista: ');
    aux := L;
    while (aux <> nil) do
    begin
        writeln(aux^.num);
        aux := aux^.sig;
    end;
end;


function calcularMax (l: lista): integer; {Inciso A}
var
    maximo: integer;

begin
    maximo := -9999;
    while (l <> nil) do 
    begin
        if (maximo < l^.num) then
            maximo := l^.num;
        l := l^.sig;
    end;
    calcularMax := maximo;
end;


function calcularMin (l: lista): integer; {Inciso B}
var
    min: integer;

begin
    min := 9999;
    while (l <> nil) do 
    begin
        if (l^.num < min) then
            min := l^.num;
        l := l^.sig;
    end;
    calcularMin := min;
end;


function CantMultiplos (l: lista; A: integer): integer;
var 
    contador: integer;

begin
    contador := 0;
    while (l <> nil) do
    begin
        if (l^.num MOD A = 0) then
            contador := contador + 1;
        l := l^.sig;
    end;
    cantMultiplos := contador;
end;

{Programa Principal}
var
    pri: lista;
    ult: lista;
    valor: integer;
    Aa: integer;

begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    
    while (valor <> 0) do begin
        armarNodo(pri, ult, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;

   imprimirLista(pri);
   
   writeln;
   writeln('El numero más grande ingresado fue ', calcularMax(pri));
   writeln('El numero más chico ingresado fue ', calcularMin(pri));
   
   writeln;
   write('Ingrese el numero que quiere verificar la cantidad de multiplos: ');
   readln(Aa);
   writeln('La cantidad de multiplos de ', Aa, ' ingresados fue de ', cantMultiplos(pri, Aa));
   
end.
