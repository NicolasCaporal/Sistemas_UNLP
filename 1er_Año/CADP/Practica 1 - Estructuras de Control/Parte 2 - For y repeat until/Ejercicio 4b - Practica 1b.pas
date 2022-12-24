{4b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual no debe procesarse}

program Practica1b_Ejercicio4;

var 
    min1, min2, numero, i: integer;
    
begin
    
    min1 := 9999;
    min2 := 9999;
    
    readln(numero);
    while (numero <> 0) do
    begin
        if (numero < min1) then 
        begin
            min2 := min1;
            min1 := numero;
        end
        else if (numero < min2) then 
            min2 := numero;

        readln(numero);
    end;

    
    writeln('Resultados: ', min1, ' y ', min2);
    
end.