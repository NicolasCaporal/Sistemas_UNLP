{3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados (agregar atrás).}

program Ejercicio3_Practica6;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;



procedure armarNodo(var L: lista; v: integer);
var
    nue: lista;
    aux: lista;

begin
    new(nue);
    nue^.num := v;
    nue^.sig := nil;
    if (l = nil) then
        l := nue
    else
        while (aux^.sig <> nil) do
        begin
            aux := aux^.sig;
        end;
        aux^.sig := nue;
end;


procedure imprimirLista (l: lista); {Inciso C}
var 
    aux: lista;

begin
    writeln();
    writeln('Imprmiendo lista: ');
    aux := L;
    while (aux <> nil) do
    begin
        writeln(aux^.num);
        aux := aux^.sig;
    end;
end;



{Programa Principal}
var
    pri: lista;
    valor: integer;

begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    
    while (valor <> 0) do begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;

   imprimirLista(pri);{ imprimir lista }
   
end.


