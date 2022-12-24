{2. Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo, si se lee la secuencia:

3 5 6 2 3 10 98 8 -12 9

deberá informar: “El mayor número leído fue el 98” }

program Practica1b_Ejercicio2;

var 
    numero, nMax, i: integer; 

begin
    nMax := -9999;
    
    for i := 1 to 10 do
    begin
        readln(numero);
        if (numero > nMax) then 
            nMax := numero; 
    end;
    
    writeln('El mayor número leído fue el ', nMax);
    
end.