{ 4. Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35 }

program Practica3_Ejercicio4;

const 
    cantClientes = 3; // 9300

Type
    cliente = record
        code: integer;
        cantLineas: integer;
    end;
    
    linea = record 
        nTelefono: integer;
        cantMin: integer;
        cantMB: integer;
    end;
    
    procedure leerCliente (var cliente: cliente);
    begin
        write('Ingrese codigo de cliente: ');
        readln(cliente.code);
        write('Ingrese cantidad de lineas: ');
        readln(cliente.cantLineas);
        writeln;
    end;
    
    procedure leerLinea (var linea: linea);
    begin
        write('Ingrese numero de telefono: ');
        readln(linea.nTelefono);
        write('Ingrese cantidad de minutos: ');
        readln(linea.cantMin);
        write('Ingrese cantidad de MB: ');
        readln(linea.cantMB);
        writeln;
    end;
    
    procedure procesarCliente (cliente: cliente; var MinAFacturar, MBaFacturar: real); 
    var
        l: linea;
        i: integer;
    
    begin
        MinAFacturar := 0;
        MBaFacturar := 0;
        for i := 1 to cliente.cantLineas do 
        begin
            leerLinea(l);
            MBaFacturar := MBaFacturar + l.CantMB;
            MinAFacturar := MinAFacturar + l.cantMin;
        end;
    end;
    
{Programa principal} 
var
    cli: cliente;
    minutos: real;
    MB: real;
    i: integer;
    montoAPagar: real;
    
begin
    montoAPagar := 0;
    for i := 1 to cantClientes do 
    begin
        leerCliente(cli);
        procesarCliente(cli, minutos, MB);
        montoAPagar := (minutos * 3.40 + MB * 1.35);
        writeln('El cliente ' , cli.code, ' debe pagar: $', montoAPagar:2:2);
        writeln;
    end;
end.