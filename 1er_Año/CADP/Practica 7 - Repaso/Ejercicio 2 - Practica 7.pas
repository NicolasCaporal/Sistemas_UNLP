{2. Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza
contratada (1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente
con código 1122, el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el
cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene
contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.}

program Practica7_Ejercicio2;
type 

    poliza = 1..6;

    cliente = record
        code: integer;
        dni: longint;
        apellido: string;
        nombre: string;
        codigoPoliza: poliza;
        montoBasico: real;
    end;
    
    lista =^nodo;
    nodo = record
        dato: cliente;
        sig: lista;
    end;
    
    TablaMontoAdicional = array [poliza] of real; // Se dispone
    

    
procedure agregarAlFinal (var l, ult: lista; c: cliente);
var
    nue: lista;

begin
    new(nue);
    nue^.dato := c;
    if (l = nil) then
        l := nue
    else
        ult^.sig := nue;
    ult := nue;
end;


procedure cargarCliente (var c: cliente);
begin
    write('Ingrese codigo: ');
    readln(c.code);
    write('Ingrese dni: ');
    readln(c.dni);
    write('Ingrese apellido: ');
    readln(c.apellido);
    write('Ingrese nombre: ');
    readln(c.nombre);
    write('Ingrese codigo de poliza: ');
    readln(c.codigoPoliza);
    write('Ingrese monto basico: ');
    readln(c.montoBasico);
    writeln;
end;


procedure cargarLista (var l: lista);
var 
    ult: lista;
    c: cliente;
    contador: integer;

begin
    contador := 1;
    ult := nil;
    repeat
        writeln(contador, ')');
        cargarCliente(c);
        agregarAlFinal(l, ult, c);
        contador := contador + 1;
    until (c.code = 1122);
end;


procedure imprimirCliente (c: cliente);
begin
    write('Codigo: ');
    writeln(c.code);
    write('Dni: ');
    writeln(c.dni);
    write('Apellido: ');
    writeln(c.apellido);
    write('Nombre: ');
    writeln(c.nombre);
    write('Codigo de poliza: ');
    writeln(c.codigoPoliza);
    write('Monto basico: ');
    writeln(c.montoBasico:2:2);
    write;
end;


procedure imprimirLista(l: lista);
begin
    writeln('IMPRIMIENDO LISTA... ============================================');
    while (l <> nil) do
    begin
        writeln;
        imprimirCliente(l^.dato);
        l := l^.sig;
    end;
    writeln;
    writeln('=================================================================');
    writeln;
end;


{ESTO SE DISPONE, NO HAY QUE IMPLEMENTARLO, LO IMPLEMENTO PARA PODER PROBRALO}
procedure cargarMontoExtra (var montoExtra: TablaMontoAdicional);
var 
    i: integer;
begin
    for i:= 1 to 6 do
    begin
        write('Monto extra para los clientes con codigo de poliza ', i, ': ');
        readln(montoExtra[i]);
    end;
    writeln;
end;


{a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
por su seguro automotriz (monto básico + monto adicional).}
procedure informarMontoCompleto (l: lista; montoExtra: TablaMontoAdicional);
var
    montoFinal: real;

begin
    writeln('MONTO COMPLETO POR CLIENTE: ');
    while (l <> nil) do
    begin
        writeln('DNI: ', l^.dato.dni);
        writeln('Apellido: ', l^.dato.apellido);        
        writeln('Nombre: ', l^.dato.nombre);
        montoFinal := l^.dato.montoBasico + montoExtra[l^.dato.codigoPoliza];
        writeln('Monto completo a pagar: ', montoFinal:2:2);
        l:=l^.sig;
        writeln;
    end;
    writeln('=================================================================');
    writeln;
end;


{b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.}
function dos9EnDni (c: cliente): boolean;
var
    contador: integer;
    digito: integer;
    num: integer;

begin
    num := c.dni;
    contador := 0;
    while (num <> 0) do
    begin
        digito := num MOD 10;
        if (digito = 9) then 
            contador := contador + 1;
        num := num DIV 10;
    end;
    
    dos9EnDni := (contador >= 2);
    
end;


procedure InformarDNI9 (l: lista);
begin
    writeln('LISTA DE CLIENTES CON DOS "9" EN SU DNI: ');
    while (l <> nil) do
    begin
        if (dos9EnDni(l^.dato)) then
        begin
            write(l^.dato.apellido, ' ', l^.dato.nombre, ' ');
            writeln(l^.dato.dni); //No hay que informarlo, pero para que sea más facil chequear.
        end;
        
        l := l^.sig;
        
    end;
    
    writeln;
    writeln('=================================================================');
    writeln;
    
end;


{c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.}
procedure eliminarClientePorCode (var l: lista; code: integer);
var 
    act, ant: lista;

begin
    act := l;
    ant := l;
    
    while (act^.dato.code <> code) do
    begin
        ant := act;
        act:=act^.sig;
    end;
    
    if (ant = act) then
        l := act^.sig
    else if (act = nil) then
    begin
        ant^.sig := nil;
        dispose(act);
    end
    else 
        ant^.sig := act^.sig;
end;



{PROGRAMA PRINCIPAL}
var
    l: lista;
    montoExtra: TablaMontoAdicional;
    codigoAEliminar : integer;
    
begin
    cargarMontoExtra(montoExtra);
    l := nil;
    cargarLista(l);
    imprimirLista(l);
    
    informarMontoCompleto (l, montoExtra);
    
    InformarDNI9(l);
    
    write('Ingrese el codigo del cliente que desea eliminar: ');
    readln(codigoAEliminar);
    writeln;
    eliminarClientePorCode(l, codigoAEliminar);
    imprimirLista(l);
end.
