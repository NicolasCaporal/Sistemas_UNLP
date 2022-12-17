 {1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos. }

program Practica1b_Ejercicio1;

var
    i, numero, suma: integer;

begin 
    suma := 0;
    for i := 1 to 10 do
    begin
        readln(numero);
        suma := suma + numero;
    end;
    
    writeln('El resultado es ', suma);
end.