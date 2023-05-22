{8. Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la lista
queden ordenados de manera ascendente (insertar ordenado).}

program Ejercicio8_Practica6;

type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;



procedure armarNodo (var L: lista; v: integer);
var
    nue, act, ant: lista;
    
begin
    new(nue);
    nue^.num := v;
    
    if (L = nil) then
    begin
        L := nue;
    end
    else 
    begin
        act := L;
        ant := L;
        
        while ((act <> nil) and (act^.num < v)) do 
        begin
           ant := act;
           act := act^.sig;
        end;
        
        if (act = ant ) then
        begin
            nue^.sig := L;
            L := nue;
        end
        else if (act <> nil) then 
        begin
            ant^.sig := nue;
            nue^.sig := act;
        end
        else
        begin
            ant^.sig := nue;
            nue^.sig := nil;
        end;
    end;  
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
    pri : lista;
    valor : integer;

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
   
end.
