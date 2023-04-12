{ 3. Se cuenta con un archivo de productos de una cadena de venta de alimentos congelados.
De cada producto se almacena: código del producto, nombre, descripción, stock disponible,
stock mínimo y precio del producto.
Se recibe diariamente un archivo detalle de cada una de las 30 sucursales de la cadena. Se
debe realizar el procedimiento que recibe los 30 detalles y actualiza el stock del archivo
maestro. La información que se recibe en los detalles es: código de producto y cantidad
vendida. Además, se deberá informar en un archivo de texto: nombre de producto,
descripción, stock disponible y precio de aquellos productos que tengan stock disponible por
debajo del stock mínimo.
Nota: todos los archivos se encuentran ordenados por código de productos. En cada detalle
puede venir 0 o N registros de un determinado producto }

program Ejercicio3;
const 
    df = 4;
    valorEspecial = -1;

type 
    producto = record 
        codigo: integer;
        nombre: string;
        descripcion: string;
        stockDisp: integer;
        stockMin: integer; 
        precio: real;
    end;

    productos = file of producto;

    producto_detalle = record
        codigo: integer;
        cantVendida: integer;
    end;

    dia = file of producto_detalle;

    dias = array[1..df] of dia;


procedure leerD (var a: dia; var p: producto_detalle);
begin
    if (not EOF(a)) then 
        read(a, p)
    else 
        p.codigo := valorEspecial;
end;


procedure actualizar_maestro ();
var 
    prod_detalle: producto_detalle;
    prod_maestro: producto;
    sumaVendidos: integer;
    i: integer;
    num: string;
    d: dias;
    archivoProductos: productos;

begin

    

    assign(archivoProductos, 'productos.dat');
    reset(archivoProductos);

    for i := 1 to df do 
    begin 
        seek(archivoProductos, 0);

        str(i, num);
        assign(d[i], 'sucursal' + num + '.dat');
        reset(d[i]);

        leerD(d[i], prod_detalle);
        while (prod_detalle.codigo <> valorEspecial) do
        begin

            read(archivoProductos, prod_maestro);
            while (prod_maestro.codigo <> prod_detalle.codigo) do 
                read(archivoProductos, prod_maestro);
                
            sumaVendidos := 0;
            while (prod_maestro.codigo = prod_detalle.codigo) do 
            begin
                sumaVendidos := sumaVendidos + prod_detalle.cantVendida;
                leerD(d[i], prod_detalle);
            end;

            seek(archivoProductos, filePos(archivoProductos) - 1);
            prod_maestro.stockDisp := prod_maestro.stockDisp - sumaVendidos;            
            write(archivoProductos, prod_maestro);
        
        end;

        close(d[i]);
    end;
    close(archivoProductos);
end;

procedure generarTxtStockBajo();
var 
    archivoBin: productos;
    archivoTxt: text;
    p: producto;

begin

    assign(archivoBin, 'productos.dat');
    assign(archivoTxt, 'StockBajo.txt');

    reset(archivoBin);
    rewrite(archivoTxt);

    while (not EOF(archivoBin)) do 
    begin
        read(archivoBin, p);
        if (p.stockDisp < p.stockMin) then 
        begin
            writeln(archivoTxt, p.nombre);
            writeln(archivoTxt, p.stockDisp, '/', p.stockMin, ' ', p.precio, ' ', p.descripcion); 
        end;
    end;
    close(archivoBin);
    close(archivoTxt);
end;

begin

    actualizar_maestro();
    generarTxtStockBajo();

end.