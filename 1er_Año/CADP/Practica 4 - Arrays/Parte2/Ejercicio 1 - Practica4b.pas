{1. 
a) Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor
N y retorne si n se encuentra en el vector o no.

b) Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente}

const
    maxV = 500;

type 
    vector = array [1..maxV] of integer;

// a)
function estaN (N: integer; vector: vector; dimL: integer;): boolean;
var 
    i: integer;

begin

    while ((vector[i] <> N) and (i <= dimL) do begin
        i := i + 1;
    end;
    
    estaN := (N = vector[i]); 
end;

// b)
procedure ordenadoEstaN (N: integer; vector: vector): boolean;
var
    i: integer;

begin

    while ((vector[i] < N )and (i<=dL) do
    begin
        i := i + 1;
    end;
    
    if ((vector[i] = N) and (i <= dL)) then
        ordenadoEstaN := true;
    else 
        ordenadoEstaN := false;
end;
