{9. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en
caso contrario.
b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe). Nota:
la lista podría no estar ordenada.
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista con todos
los elementos de la lista L mayores que A y menores que B.
d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de
manera ascendente.
e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de
manera descendente.}

program Practica6_Ejercicio9;

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
    writeln;
    writeln('Imprimiendo lista: ');
    aux := L;
    while (aux <> nil) do
    begin
        writeln(aux^.num);
        aux := aux^.sig;
    end;
end;


//A)
function estaOrdenada (L: lista): boolean;
var 
    aux: lista;
    booleano: boolean;

begin
    booleano:=true;
    aux := L;

    if (L = nil) then
    begin
        writeln('ERROR LA LISTA ESTÁ VACÍA');
        booleano:=false;
    end
    else
    begin
        aux := L^.sig;
        {writeln ('Num inicia en ', L^.num);
        writeln ('Aux inicia en ', aux^.num);}

        while ((l <> nil) and (aux <> nil) and (L^.num < aux^.num)) do
        begin
            {writeln(booleano);
            writeln('¿', l^.num, ' es mas chico que ', aux^.num, '? SI --> ENTRO AL WHILE');}
            L := l^.sig;
            aux := aux^.sig;
            
           {writeln ('Ahora num vale ', L^.num);
            if (aux <> nil) then
                writeln ('Y ahora aux vale ', aux^.num);}
            writeln;
        end;
        
        {writeln('SALIO DEL WHILE'); }
    end;
    

    if (aux <> nil) then
        booleano := false;
    write('¿Está ordenda?: ', booleano);

    estaOrdenada := booleano;
end;


//B)
procedure eliminar (var L: lista; v: integer);
var
    ant, act: lista;

begin
    ant := L;
    act := L;
    
    while ((act <> nil) and (act^.num <> v)) do
    begin
        ant := act;
        act := act^.sig;
    end;
        
    if (act <> nil) then
        begin
            if (act = L) then
            begin
                L := L^.sig;
                dispose (act);
            end
            
            else 
            begin
                ant^.sig:= act^.sig;
                dispose(act);
            end;
        end;
end;


//C)
procedure sublista (L: lista; A, B: integer; var subL:lista);
var
    u: lista;

begin
    u := nil;
    subL := nil;
    while (L <> nil) do 
    begin
        if ((L^.num > A) and (L^.num < B)) then
            armarNodo(subL, u, L^.num);
        L := L^.sig;
    end;
end;



{Programa Principal}
var
    pri : lista;
    ult: lista;
    num : integer;
    valor: integer;
    A, B: integer;
    subList: lista;

begin
    pri := nil;
    writeln('Ingrese un numero');
    read(num);
    
    while (num <> 0) do begin
        armarNodo(pri, ult, num);
        writeln('Ingrese un numero');
        read(num);
    end;

    imprimirLista(pri);
    writeln;
    
    if (estaOrdenada(pri)) then
    begin
        writeln;
        write('Ingrese el numero que desea eliminar de la lista: ');
        readln(valor);
        eliminar (pri, valor);
        
        imprimirLista(pri); 
    end;
    
    writeln;
    
    sublist := nil;
    write('Ingrese el numero máximo de la nueva lista: ');
    readln(B);
    write('Ingrese el numero minimo de la nueva lista: ');
    readln(A);
    sublista (pri, A, B, subList);
    writeln;
    
    imprimirLista(subList);
    writeln;
end.


