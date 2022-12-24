{5. Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦ El número máximo leído.
◦ El número mínimo leído.
◦ La suma total de los números leídos}

program Practica1b_Ejercicio5;

var 
    num, max, min, suma: integer;
    
begin
    
    max := -9999;
    min := 9999;
    suma := 0; 
    
    repeat
    begin 
        readln(num);
        
        suma := suma + num;
        
        if (num > max) then 
            max := num;
        if (num < min) then 
            min := num;
            
    end;
    until (num = 100);
    
    writeln('El numero más alto fue el ', max);
    writeln('El numero más bajo fue el ', min);
    writeln('La suma de los valores ingresados da: ', suma);
    
end.