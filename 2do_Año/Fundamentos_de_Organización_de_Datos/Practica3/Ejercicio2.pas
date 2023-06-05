{ 2. Definir un programa que genere un archivo con registros de longitud fija conteniendo
información de asistentes a un congreso a partir de la información obtenida por
teclado. Se deberá almacenar la siguiente información: nro de asistente, apellido y
nombre, email, teléfono y D.N.I. Implementar un procedimiento que, a partir del
archivo de datos generado, elimine de forma lógica todos los asistentes con nro de
asistente inferior a 1000.
Para ello se podrá utilizar algún carácter especial situándolo delante de algún campo
String a su elección. Ejemplo: ‘@Saldaño’. }

program ejercicio2_practica3;

const 
    valorAlto = 9999;

type 
    asistente = record 
        nro: integer;
        nya: string[40];
        email: string[40];
        tel: string[13];
        dni: string[8];
    end;

    archivo = file of asistente;



procedure leerAsistente(var a: archivo; var asis: asistente);
begin
    if (not EOF(a)) then 
        read(a, asis)
    else 
        asis.nro := valorAlto;
end;


procedure leerDatos(var a: asistente);
begin
    write('Ingrese nro: '); readln(a.nro);
    if (a.nro <> -1) then
    begin
        write('Ingrese Nombre y apellido: '); readln(a.nya);
        write('Ingrese email: '); readln(a.email);
        write('Ingrese telefono: '); readln(a.tel);
        write('Ingrese dni: '); readln(a.dni);
    end;
    writeln;
end;


procedure crearArchivo(var a: archivo);
var 
    asis: asistente;
begin
    writeln('Ingrese numero -1 para terminar');
    rewrite(a);
    leerDatos(asis);
    while (asis.nro <> -1) do 
    begin 
        write(a, asis);
        leerDatos(asis);
    end;
    close(a);
end;


procedure mostrarDatos(a: asistente);
begin
    writeln('Nro: ', a.nro);
    writeln('Nombre y apellido: ', a.nya);
    writeln('Email: ', a.email);
    writeln('Telefono: ', a.tel);
    writeln('DNI: ', a.dni);
    writeln;
end;


procedure imprimirArchivo (var a: archivo);
var 
    asis: asistente;

begin
    reset(a);
    leerAsistente(a, asis);
    while (asis.nro <> valorAlto) do 
    begin
        if (asis.nya[1] <> '#') then
            mostrarDatos(asis); 
        leerAsistente(a, asis);
    end;
    close(a);
end;


procedure eliminarMenos100 (var a: archivo);
var 
    asis: asistente;

begin
    reset(a);
    leerAsistente(a, asis);
    while(asis.nro <> valorAlto) do 
    begin
        if (asis.nro < 1000) then 
        begin
            asis.nya := ('#' + asis.nya);
            seek(a, filePos(a) - 1);
            write(a, asis);
        end;
        leerAsistente(a, asis);
    end;
    close(a);
end;



{ Programa principal }
var 
    asistentes: archivo;

begin
    assign(asistentes, 'asistentes.dat');
    crearArchivo(asistentes);

    writeln('Antes de eliminar: ');
    imprimirArchivo(asistentes);

    eliminarMenos100(asistentes);

    writeln('Despues de eliminar menores a 1000: ');
    imprimirArchivo(asistentes);
end.
