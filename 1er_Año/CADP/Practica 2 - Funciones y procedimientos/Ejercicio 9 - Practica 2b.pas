{ 9. a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.
b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el
cual debe procesarse }

program Practica2b_Ejercicio9;

procedure descomponer (numero: integer; var cantD, suma: integer);
var
    digito: integer;
    
begin
    cantD := 0;
    suma := 0;
    
    while (numero <> 0) do
    begin
        cantD := cantD + 1;
        digito := numero mod 10;
        suma := suma + digito;
        numero := numero div 10;
    end;
end;

{Programa Principal}
var
    cantidadDigitos, num, sumaD, totalDigitos: integer;
    
begin
    totalDigitos := 0;
    repeat
        readln(num);
        descomponer(num, cantidadDigitos, sumaD);
        totalDigitos := totalDigitos + cantidadDigitos;
    until (sumaD = 10);

    writeln('Se leyeron una cantidad de ', totalDigitos, ' digitos');
end.