{5. Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros
desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar
la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la
operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ...
fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.}

program practica4_ejercicio5;
const
    dimF = 10;
type

    vector = array [1..dimF] of integer;
    
procedure cargarVector (var vec: vector);
var
    i:integer;
begin
    for i := 1 to dimF do 
        readln(vec[i]);
end;

procedure intercambio (var vec: vector; x, y: integer);
var
    aux:integer;
begin
    aux := vec[x];
    vec[x] := vec[y];
    vec[y] := aux;
end;

function elementoMaximo (vec: vector): integer;
var 
    i: integer;
    nMax: integer;
    posMax: integer;
    
begin
    nMax := -999;
    for i := 1 to dimF do
    begin
        if (vec[i] > nMax) then
        begin
            nMax := vec[i];
            posMax := i;
        end;
    end;
    
    elementoMaximo := posMax;
end;

function elementoMinimo (vec: vector): integer;
var 
    i: integer;
    nMin: integer;
    posMin: integer;
    
begin
    nMin := 999;
    for i := 1 to dimF do
    begin
        if (vec[i] < nMin) then 
        begin
            nMin := vec[i];
            posMin := i;
        end;
    end;
    
    elementoMinimo := posMin;
end;

{Programa principal}
var
    vec:vector;
    Nmin, NMax, PosMin, PosMax: integer;
    
begin
    cargarVector(vec);
    
    PosMin := elementoMinimo (vec);
    PosMax := elementoMaximo(vec);
    Nmin := vec[PosMin];
    Nmax := vec[PosMax];
    
    writeln('El elemento minimo fue ', Nmin, ' que estaba en la posición ', PosMin);
    writeln('El elemento maximo fue ', Nmax, ' que estaba en la posición ', PosMax);
    
    writeln;
    writeln('Inicia el intercambio ........ ');
    intercambio(vec, PosMax, PosMin);
    
    writeln('El elemento ', Nmax, ' que estaba en la posición ', PosMax, ' fue intercambiado por ', Nmin, ' que estaba en la posición ', PosMin);
    
    //////
    writeln;
    writeln('Chequeo...');
    writeln(vec[PosMax], '  ', vec[PosMin]);
end.
