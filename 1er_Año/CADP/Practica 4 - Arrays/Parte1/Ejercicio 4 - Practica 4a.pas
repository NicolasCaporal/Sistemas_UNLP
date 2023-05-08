{ 4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:

a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.

b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.

c) sumaVector: retorna la suma de todos los elementos del vector.

d) promedio: devuelve el valor promedio de los elementos del vector.

e) elementoMaximo: retorna la posición del mayor elemento del vector

f) elementoMinimo: retorna la posicion del menor elemento del vector} 


//a) 
function posicion (var vec: vector; x: integer): integer;
begin

    for i := 1 to 100 do 
    begin
        if (vec[i] = x) then 
            posicion := i;
    end;
    
    posicion := -1;
    
end;


//b) 
procedure intercambio (var vec: vector; X, Y: integer);
var 
    aux: integer;
begin
    aux := vec[X];
    vec[X] := vec[Y];
    vec[Y] := aux;
end;


//c) 
function sumaVector (vec: vector): integer;
var 
    i: integer;
    suma: integer;
begin
    suma := 0;
    for i :=  1 to 100 do
        suma := suma + vec[i];
        
    sumaVector := suma;
end;
  
    
//d) 
function promedio (vec: vector): real;
begin
    promedio := sumaVector(vec) / 100;
end;


//e)
function elementoMaximo (vec: vector): integer;
var 
    i: integer;
    nMax: integer;
    posMax: integer;
    
begin
    nMax := -999;
    for i := 1 to 100 do
    begin
        if (vec[i] > nMax) then 
        begin
            nMax := vec[i];
            posMax := i;
        end;
    end;
    
    elementoMaximo := posMax;
end;


//f)
function elementoMinimo (vec: vector): integer;
var 
    i: integer;
    nMin: integer;
    posMin: integer;
    
begin
    nMin := 999;
    for i := 1 to 100 do
    begin
        if (vec[i] < nMin) then 
        begin
            nMin := vec[i];
            posMin := i;
        end;
    end;
    
    elementoMinimo := posMin;
end;