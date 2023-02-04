{ 13. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A%B*, donde:
- A es una secuencia de caracteres en la que no existe el carácter ‘$’.
- B es una secuencia con la misma cantidad de caracteres que aparecen en A y en la que aparece a lo sumo
3 veces el carácter ‘@’.
- Los caracteres % y * seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió. }




program Practica2b_Ejercicio13;

procedure cumpleA (var cumple: boolean; var contador: integer);
var
    c: char;
begin
    writeln('Ingrese la secuencia A {Caracteres cuales quiera, distintos de $. Finalice con %}');
    readln(c);
    while ((cumple) and (c <> '%')) do
    begin
        contador:=contador+1;
        if (c ='$') then
            cumple := false
        else
            readln(c);
    end;
end;

function cuentaArrobas (c: char; var contadorArr: integer): boolean;
begin
    if (c ='@')then
        contadorArr:=contadorArr+1;
        
    if (contadorArr > 3)then
        cuentaArrobas := false
    else
        cuentaArrobas := true;
end;

function igualCant (contador: integer; contadorB: integer): boolean;
begin
    igualCant := (contador=contadorB);
end;

procedure cumpleB (var cumple: boolean; contadorA: integer);
var
    contadorArrobas: integer;
    contadorChar: integer;
    c: char;
begin
    contadorArrobas := 0;
    contadorChar := 0;
    writeln('Ingrese la secuencia B {Caracteres cuales quiera, pero la misma cantidad que en A, y como máximo 3 arrobas. Finalice con *');
    readln(c);
    while ((cumple) and (c <>'*'))do
    begin
        contadorChar:=contadorChar+1;
        if ((NOT(cuentaArrobas(c, contadorArrobas))) or (contadorChar > contadorA)) then
            cumple := false
        else
            readln(c);
    end;
    
    if (cumple) then
        cumple := ( igualCant(contadorA, contadorChar) );
end;

{PROGRAMA PRINCIPAL}
var
    cumple: boolean;
    contadorA: integer;
begin
    cumple := true;
    cumpleA(cumple, contadorA);
    
    if (cumple) then
    begin
        cumpleB(cumple, contadorA);
        
        if (cumple) then
            writeln('La secuencia es correcta, todo ok')
        else
            writeln('Error en la secuencia B');
    end
    else 
        writeln('Error en la secuencia A');
end.