{ 7- El encargado de ventas de un negocio de productos de limpieza desea administrar el
stock de los productos que vende. Para ello, genera un archivo maestro donde figuran todos
los productos que comercializa. De cada producto se maneja la siguiente información:
código de producto, nombre comercial, precio de venta, stock actual y stock mínimo.
Diariamente se genera un archivo detalle donde se registran todas las ventas de productos 
realizadas. De cada venta se registran: código de producto y cantidad de unidades vendidas.
Se pide realizar un programa con opciones para:
a. Actualizar el archivo maestro con el archivo detalle, sabiendo que:
● Ambos archivos están ordenados por código de producto.
● Cada registro del maestro puede ser actualizado por 0, 1 ó más registros del
archivo detalle.
● El archivo detalle sólo contiene registros que están en el archivo maestro.
b. Listar en un archivo de texto llamado “stock_minimo.txt” aquellos productos cuyo
stock actual esté por debajo del stock mínimo permitido }

program ejercicio7_practica2;

const 
    cantDetalles = 4;
    valorEspecial = 31766;

type 

    producto = record
        codigo: integer;
        nombre: string;
        precio: real;
        stockAct: integer;
        stockMin: integer;
    end;

    venta = record
        codigo: integer;
        unidadesVendidas: integer;
    end;

    archivoMaestro = file of producto;

    archivoDetalle = file of venta;
    vectorDetalles = array [1..cantDetalles] of archivoDetalle;



procedure leerDetalle (var a: archivoDetalle; var infoVenta: venta);
begin 
    if (not EOF(a)) then 
        read(a, infoVenta)
    else 
        infoVenta.codigo := valorEspecial;
end;


function opcionElegida (): integer;
var 
    rta: integer;
begin
    writeln('SELECCIONE UNA OPCION: ');
    writeln('1. Actualizar stock en funcion de las ventas del mes.');
    writeln('2. Generar “stock_minimo.txt”. (Productos con stock actual por debajo del minimo)');
    write('Ingrese opción elegida: ');
    readln(rta);
    opcionElegida := rta;
end;


function buscarMinimoDetalle (detalles: vectorDetalles): integer;
var 
    min: integer;
    iMin: integer;
    i: integer;
    registro: venta;

begin
    min := 31766;

    for i := 1 to cantDetalles do 
    begin
        leerDetalle(detalles[i], registro);
        if (registro.codigo <= min) then 
        begin
            min := registro.codigo;
            iMin := i;
        end;

        if (registro.codigo <> valorEspecial) then 
            seek(detalles[i], filePos(detalles[i]) - 1);

    end;

    buscarMinimoDetalle := iMin;

end;


procedure actualizarMaestro (var maestro: archivoMaestro; detalles: vectorDetalles);
var 
    i: integer;
    registroDetalle: venta;
    registroMaestro: producto;
    indiceMinimo: integer;
    registroDetalleActual: venta;

begin

    for i := 1 to cantDetalles do 
    begin
        reset(detalles[i]);
    end;
    reset(maestro);

    indiceMinimo := buscarMinimoDetalle(detalles);
    leerDetalle(detalles[indiceMinimo], registroDetalle);

    while (registroDetalle.codigo <> valorEspecial) do 
    begin

        read(maestro, registroMaestro);
        while (registroMaestro.codigo <> registroDetalle.codigo) do 
        begin
            read(maestro, registroMaestro);
        end;
        seek(maestro, filePos(maestro) - 1);


        registroDetalleActual := registroDetalle;
        while ((registroDetalle.codigo <> valorEspecial) and (registroDetalle.codigo = registroDetalleActual.codigo)) do 
        begin
            registroMaestro.stockAct := registroMaestro.stockAct - registroDetalle.unidadesVendidas;
            indiceMinimo := buscarMinimoDetalle(detalles); 
            leerDetalle(detalles[indiceMinimo], registroDetalle);
        end;

        write(maestro, registroMaestro);

    end;

    for i := 1 to cantDetalles do 
    begin
        close(detalles[i]); 
    end;

    close(maestro);

    writeln('Archivo actualizado correctamente.');

end;


procedure generarTxt (var maestro: archivoMaestro);
var 
    archivoTxt: text;
    productoAct: producto;

begin

    assign(archivoTxt, 'stock_minimo.txt');
    rewrite(archivoTxt);

    reset(maestro);
    while (not EOF(maestro)) do 
    begin
        read(maestro, productoAct);
        if (productoAct.stockAct < productoAct.stockMin) then 
            writeln(archivoTxt, productoAct.codigo, ' ', productoAct.nombre, ' ', productoAct.precio, ' ', productoAct.stockAct, '/', productoAct.stockMin);
    end;

    close(archivoTxt);
    close(maestro);

    writeln('Txt generado correctamente.');

end;

// Programa Principal
var 
    maestro: archivoMaestro;
    detalles: vectorDetalles;
    i: integer;
    iStr: string;

begin 

    assign(maestro, 'stock.dat');

    case opcionElegida() of

        // Actualizar stock en funcion de las ventas del mes.
        1: begin 
                for i := 1 to cantDetalles do 
                begin
                    str(i, iStr);
                    assign(detalles[i], 'ventas' + iStr + '.dat');
                end;
                actualizarMaestro(maestro, detalles);
           end;
        
        // Generar “stock_minimo.txt”. (Productos con stock actual por debajo del minimo)
        2: generarTxt(maestro);

    end;
end.