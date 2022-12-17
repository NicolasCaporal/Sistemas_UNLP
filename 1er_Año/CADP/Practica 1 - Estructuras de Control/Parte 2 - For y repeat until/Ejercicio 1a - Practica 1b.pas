 {1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos. 
        a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5 }
        
program Practica1b_Ejercicio1a;

var
    i, numero, suma, mayoresA5: integer;

begin 
    suma := 0;
    mayoresA5 := 0;
    
    for i := 1 to 10 do
    begin
        readln(numero);
        suma := suma + numero;
        
        if (numero > 5) then
            mayoresA5 := mayoresA5 + 1;
    end;
    
    writeln;
    writeln('El resultado es ', suma);
    writeln('Había ', mayoresA5, ' numeros mayores a 5');
end.