{ 3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última. 

b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.

c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.

d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.

e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c. }

//a)
procedure imprimirVector (vector: vector);
var 
    i: integer;
begin
    for i := 1 to dimF do 
        writeln(vector[i]);
end;

//b) 
procedure imprimirVectorAR (vector: vector);
var 
    i: integer;
begin
    for i := dimF downto 1 do 
        writeln(vector[i]);
end;

//c)
procedure imprimirMitas (vector: vector);
var
    i: integer;
    mitad: integer;
begin
    mitad := dimF div 2;

    for i := mitad downto 1 do 
        writeln(vector[i]);
        
    for i := (mitad + 1) to dimF do
        writeln(vector[i]);
end;

//d) 
procedure imprimirVector (vector: vector; Y, X: integer);
var 
    i: integer;
begin
    if (X < Y) then 
    begin
        for i := X to Y do 
            writeln(vector[i]);
    end
    else if (Y < X) then 
    begin
        for i := X downto Y do 
            writeln(vector[i]);
    end;
end;