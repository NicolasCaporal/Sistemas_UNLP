{3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados, manteniendo un puntero al último ingresado.}

program Ejercicio3b_Practica6;

type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;


procedure armarNodo(var L, ult: lista; v: integer);
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
    ult: lista;
    valor: integer;

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
   
end.
