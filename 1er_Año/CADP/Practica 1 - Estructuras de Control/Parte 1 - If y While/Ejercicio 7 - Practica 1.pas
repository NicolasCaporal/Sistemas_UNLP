{ 7. Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un
almacén. La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse.
Para cada producto leído, el programa deberá indicar si el nuevo precio del producto supera en un
10% al precio anterior.
Por ejemplo:
○ Si se ingresa el código 10382, con precio actual 40, y nuevo precio 44, deberá imprimir: “el
aumento de precio del producto 10382 no supera el 10%”
○ Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir: “el
aumento de precio del producto 32767 es superior al 10%” }

program Practica1_Ejercicio7;
var
    codigo: integer;
    precioA, precioN: real;
    
begin
    repeat
        begin
            readln(codigo);
            readln(precioA);
            readln(precioN);
            
            if (((precioN-precioA)*100/precioA)>10) then
                writeln('El aumento de precio del producto ', codigo, ' supera el 10%')
            
            else
                writeln('El aumento de precio del producto ', codigo, ' no supera el 10%')
        end;
    until (codigo=32767);
end.