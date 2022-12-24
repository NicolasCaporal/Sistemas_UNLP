{2a. Modifique el programa anterior para que, además de informar el mayor número leído, se
informe el número de orden, dentro de la secuencia, en el que fue leído. Por ejemplo, si se lee la
misma secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98, en la posición 7”}

program Practica1b_Ejercicio2a; 

var 
    numero, nMax, i, PosNMax: integer; 

begin
    nMax := -9999;
    
    for i := 1 to 10 do 
    begin
        readln(numero);
        
        if (numero > nMax ) then 
        begin
            nMax := numero;
            PosNMax := i;
        end;
    end;

    writeln('El mayor número leído fue el ', nMax, ', en la posición ', PosNMax);

end.