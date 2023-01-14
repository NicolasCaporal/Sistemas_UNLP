{ 8. Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
● Código de los dos productos más baratos.
● Código del producto de tipo “pantalón” más caro.
● Precio promedio. }

program Paractica2b_Ejercicio8;

procedure leerDatos (var precio: real; var codigo: integer; var tipo: string);
begin
    write('Ingrese precio: ');
    readln(precio);
    write('Ingrese codigo: ');
    readln(codigo);
    write('Ingrese el tipo: ');
    readln(tipo);
end;

procedure dosProdMasBaratos (precio: real; codigo: integer; var precioB1, precioB2: real; var codigoB1, codigoB2: integer);
begin
    if (precio < precioB1) then
    begin
        precioB2 := precioB1;
        codigoB2 := codigoB1;
        codigoB1 := codigo;
        precioB1 := precio;
    end
    
    else if (precio<precioB2) then
    begin
        precioB2 := precio;
        codigoB2 := codigo;
    end;
end;

procedure PantMasC(tipo: string; precio: real; codigo: integer; var pantMasCaro: real; var codigoPantMasCaro: integer);
begin
    if (tipo = 'pantalon') then
    begin
        if (precio > pantMasCaro) then
        begin
            pantMasCaro := precio;
            codigoPantMasCaro := codigo;
        end;
    end;
end;


{Variables del programa principal}
var
    precio: real;
    codigo: integer;
    tipo: string;
    precioB1: real;
    precioB2: real;
    codigoB1: integer;
    codigoB2: integer;
    pantMasCaro: real;
    codePantMasCaro: integer;
    sumaTotalPrecio: real;
    promedio: real;
    i: integer;
    
    
{PROGRAMA PRINCIPAL}
begin
    precioB1 := 99999;
    pantMasCaro := -99999;
    sumaTotalPrecio := 0;
  
    for i := 1 to 10 do 
    begin
        writeln;
        writeln('Producto Nro ', i);
        leerDatos(precio, codigo, tipo);
        writeln;
        writeln('_____________________________________________________');
        
        sumaTotalPrecio := sumaTotalPrecio + precio;
        
        dosProdMasBaratos(precio, codigo, precioB1, precioB2, codigoB1, codigoB2);
        
        PantMasC(tipo, precio, codigo, pantMasCaro, codePantMasCaro);
    end;
    
    writeln;
    writeln('Los dos productos más baratos fueron los de codigo ', codigoB1, ' y ', codigoB2);
    
    writeln('El pantalon mas caro fue el de codigo ', codePantMasCaro);
    
    promedio := sumaTotalPrecio/10;
    
    writeln('El precio promedio de todos los productos fue ', promedio:2:2);
end.

