{ 12. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A$B#, donde:
- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió. }

program Practica2b_Ejercicio12;

function esVocal(c: char):boolean;
begin
    esVocal := (c ='a') or (c ='A') or (c ='e') or (c ='E') or (c ='i') or (c ='I') or (c ='o') or (c ='O') or (c ='u') or (c ='U');
end;

procedure cumpleA (var cumple: boolean);
var
    c: char;
begin
    writeln('Ingrese la secuencia A: ');
    readln(c);
    while ((c <>'$') and (cumple)) do
    begin
        if (esVocal(c)=false) then begin
            writeln('entro al if'); {Esta linea es para controlar cuando entra, pero no va en el programa final}
            cumple := false
        end
        else
            readln(c);
    end;
end;

procedure cumpleB (var cumple:boolean);
var
    c: char;
begin
    writeln('Ingrese la secuencia B ');
    readln(c);
    while ((c <> '#') and (cumple)) do
    begin
        if ((esVocal(c)) or ((c <'A') or ((c >'Z') and (c <'a')) or (c >'z'))) then
            cumple := false
        else
            readln(c);
    end;
end;


{Programa principal}
var
    cumple: boolean;
begin
    writeln();

    cumple := true;
    
    cumpleA(cumple);
    if (cumple)then
    begin
        cumpleB(cumple);
        
        if (cumple) then
            writeln('La secuencia es correcta')
        else
            writeln('Falló la secuencia B');
    end
    else
        writeln('Falló la secuencia A');
end.