{4. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son
los dos números mínimos leídos.}

program Practica1b_Ejercicio4;

var 
    min1, min2, numero, i: integer;
    
begin
    
    min1 := 9999;
    min2 := 9999;
    
    for i := 1 to 10 do 
    begin
        readln(numero);
        
        if (numero < min1) then 
        begin
            min2 := min1;
            min1 := numero;
        end
        else if (numero < min2) then 
            min2 := numero;
    end;
    
    writeln('Resultados: ', min1, ' y ', min2);
    
end.