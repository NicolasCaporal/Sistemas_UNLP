{1. Dado el siguiente programa:
a. Indicar qué hace el programa.
b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista.}

program Ejercicio1_Practica6;

type
    lista = ^nodo;
    nodo = record
        num: integer;
        sig: lista;
    end;



procedure armarNodo(var L: lista; v: integer);
var
    aux: lista;
    
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
end;


procedure imprimirLista (l: lista); {Inciso C}
var 
    aux: lista;
    
begin
    aux := L;
    while (aux <> nil) do
    begin
        writeln(aux^.num);
        aux := aux^.sig;
    end;
end;


procedure incrementarV (L: lista; valor: integer); {Inciso D}
var 
    aux: lista;
    
begin
    aux := L;
    while (aux <> nil) do 
    begin
        aux^.num := aux^.num + valor;
        aux := aux^.sig;
    end;
end;



var
    pri : lista;
    valor : integer;
    aumentar: integer;
    
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    
    imprimirLista(pri);
    
    write('Ingrese en cuento desea aumentar los valores de la lista: ');
    readln (aumentar);
    incrementarV (pri, aumentar);
    imprimirLista(pri);
end.

