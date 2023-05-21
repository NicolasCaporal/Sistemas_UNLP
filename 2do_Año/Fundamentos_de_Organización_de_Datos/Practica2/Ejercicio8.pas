{ 8. Se cuenta con un archivo que posee información de las ventas que realiza una empresa a
los diferentes clientes. Se necesita obtener un reporte con las ventas organizadas por
cliente. Para ello, se deberá informar por pantalla: los datos personales del cliente, el total
mensual (mes por mes cuánto compró) y finalmente el monto total comprado en el año por el
cliente.
Además, al finalizar el reporte, se debe informar el monto total de ventas obtenido por la
empresa.
El formato del archivo maestro está dado por: cliente (cod cliente, nombre y apellido), año,
mes, día y monto de la venta.
El orden del archivo está dado por: cod cliente, año y mes.
Nota: tenga en cuenta que puede haber meses en los que los clientes no realizaron
compras. }

program ejercicio8_practica2;

const 
    valorEspecial = 9999;

type 

    dia = 1..31;
    mes = 1..12;

    datosCliente = record 
        codigo: integer;
        NyA: string;
    end;

    registroFecha = record
        d: dia;
        m: mes;
        a: integer;
    end;

    dato = record 
        cliente: datosCliente;
        fecha: registroFecha;
        monto: real;
    end;

    archivoVentas = file of dato;

procedure leerDato (var a: archivoVentas; var rta: dato);
begin
    if (not EOF(a)) then 
        read(a, rta)
    else 
        rta.cliente.codigo := valorEspecial;
end;

procedure imprimirFecha (f: registroFecha);
begin
    writeln(f.d, '/', f.m, '/', f.a);
end;


procedure imprimirCliente (c: datosCliente);
begin
    writeln(c.codigo, ' ', c.NyA);
end;


procedure procesamiento (var archivo: archivoVentas);
var 
    venta: dato;
    clienteActual: datosCliente;
    mesActual: mes;
    totalMesActual: real;
    totalAnio: real;
    anioActual: integer;
    anioAnterior: integer;
    totalEmpresa: real;

begin 

    reset(archivo);
    totalEmpresa := 0;

    leerDato(archivo, venta);
    while (venta.cliente.codigo <> valorEspecial) do 
    begin 

        clienteActual := venta.cliente;
        writeln;
        imprimirCliente(clienteActual);

        while ((clienteActual.codigo = venta.cliente.codigo)) do 
        begin

            totalAnio := 0;
            anioActual := venta.fecha.a;
            anioAnterior := anioActual;
            while ((anioActual = venta.fecha.a) and (clienteActual.codigo = venta.cliente.codigo)) do 
            begin 

                totalMesActual := 0;
                mesActual := venta.fecha.m;
                write('Gastado en el mes ', mesActual, ' del año ', anioActual, ': ');

                while ((mesActual = venta.fecha.m) and (anioActual = venta.fecha.a) and (clienteActual.codigo = venta.cliente.codigo)) do 
                begin
                    totalMesActual := totalMesActual + venta.monto;
                    leerDato(archivo, venta);
                end;

                writeln(totalMesActual:2:2);
                totalAnio := totalAnio + totalMesActual;

            end;
            writeln('En el año ', anioAnterior, ' gastó en total ', totalAnio:2:2);
            writeln;
            totalEmpresa := totalEmpresa + totalAnio;

        end;
        
        writeln('_________________________________________________________________');
        writeln;
    end;

    writeln;
    writeln('La empresa en total ingresó: ', totalEmpresa:2:2);

    close(archivo);

end;



{ Programa Principal }
var 
    archivo: archivoVentas;

begin 

    assign(archivo, 'ventas.dat');
    procesamiento(archivo);

end.
