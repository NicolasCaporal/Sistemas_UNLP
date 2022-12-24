{4a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual debe procesarse.}

program Practica1b_Ejercicio4a;

var 
    min1, min2, numero, i: integer;
    
begin
    
    min1 := 9999;
    min2 := 9999;
    
    repeat
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
    until (numero = 0);
    
    writeln('Resultados: ', min1, ' y ', min2);
    
end.