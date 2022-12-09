{ 9. Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro
carácter, debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse
una secuencia de números enteros que finaliza con 0. El programa deberá aplicar la operación leída
con la secuencia de números, e imprimir el resultado final.
Por ejemplo:
○ Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) )
○ Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir 0 ( -10 + 5 + 6 + (-1) )}

program Practica1_Ejercicio9;
var
    operador: char;
    numero, suma: integer;
    

begin
    suma := 0;
    readln(operador);
    if (operador = '+') or (operador = '-') then
    begin
        readln(numero);
        suma := numero;
        repeat
        
            if (operador = '+') then
            begin
                readln(numero);
                suma := suma + numero;
            end;
            
            if (operador = '-') then
            begin
                readln(numero);
                suma := suma - numero;
            end;
            
        until (numero = 0);
        
    writeln('= ', suma);
    end
    else
        writeln('Error');

end.