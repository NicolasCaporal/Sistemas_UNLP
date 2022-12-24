{ 6. Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos
- La cantidad de productos de más de 16 pesos con código par }

program Practica1b_Ejercicio6;

type 
    NCodigo = 1..200;
    
var 
    codigo: NCodigo;
    precio: real;
    min1, min2: real;
    contadorMas16: integer;
    i: integer;
    codigoMin1, codigoMin2: NCodigo;
    
begin
    min1 := 9999;
    codigoMin1 := 1;
    contadorMas16 := 0;
    
    for i := 1 to 10 do 
    begin
        write('Ingrese codigo: ');
        readln(codigo);
        write('Ingrese precio: ');
        readln(precio);
        writeln;
        
        if (precio < min1) then 
        begin
            min2 := min1;
            min1 := precio;
            codigoMin2 := codigoMin1;
            codigoMin1 := codigo;
        end
        else if (precio < min2) then
        begin
            min2 := precio;
            codigoMin2 := codigo;
        end;
        
        if ( ((codigo MOD 2) = 0) and (precio > 16)) then 
            contadorMas16 := contadorMas16 + 1;
            
    end;
    
    writeln;
    writeln('RESULTADOS: ');
    writeln('Codigo de los mas baratos: ', CodigoMin1, ' y ', codigoMin2);
    write('Cantidad de codigos pares con precio mayor a 16: ', contadorMas16);
    
end.