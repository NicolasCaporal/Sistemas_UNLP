{ 3. Realizar un programa que presente un menú con opciones para:

a. Crear un archivo de registros no ordenados de empleados y completarlo con
datos ingresados desde teclado. De cada empleado se registra: número de
empleado, apellido, nombre, edad y DNI. Algunos empleados se ingresan con
DNI 00. La carga finaliza cuando se ingresa el String ‘fin’ como apellido.

b. Abrir el archivo anteriormente generado y
    i. Listar en pantalla los datos de empleados que tengan un nombre o apellido
       determinado.
    ii. Listar en pantalla los empleados de a uno por línea.
    iii. Listar en pantalla empleados mayores de 70 años, próximos a jubilarse.

NOTA: El nombre del archivo a crear o utilizar debe ser proporcionado por el usuario. }

program Ejercicio3_Practica1;

type 

    empleado = record
        num: string;
        apellido: string;
        nombre: string;
        edad: integer;
        DNI: string;
    end;

    archivoRegistro = file of empleado;

procedure mostrarOpciones (var respuesta: integer);
begin

    writeln('OPCION 1: Ingresar datos de empleados. ');
    writeln('OPCION 2: Ver información de empleados. ');
    writeln('OPCION 3: Cancelar.');
    write('Ingrese numero: ');
    readln(respuesta);
    writeln;
end;

// Opcion 1

procedure leerEmpleado (var registro: empleado);
begin
    write('Apellido: ');
    readln(registro.apellido);
    if (registro.apellido <> 'fin') then 
    begin
        write('Nombre: ');
        readln(registro.nombre);
        write('Edad: ');
        readln(registro.edad);
        write('Numero de empleado: '); 
        readln(registro.num);
        write('DNI: ');
        readln(registro.DNI);

        writeln;
        writeln('_______________________________________');
        writeln;
    end;
end;

procedure crearArchivo (var archivoEmpleados: archivoRegistro);
var 
    emp: empleado;
begin 

    writeln('Cargando empleados... Ingrese "fin" como apellido para terminar');

    rewrite(archivoEmpleados);
    leerEmpleado(emp);
    while (emp.apellido <> 'fin') do 
    begin
         write(archivoEmpleados, emp);
         leerEmpleado(emp);
    end;
    close(archivoEmpleados);
end;

// Opcion 2

procedure imprimirEmpleado(emp: empleado);
begin
    writeln ('Nombre: ', emp.nombre, ' | Apellido: ', emp.apellido, ' | Edad: ', emp.edad, ' | DNI: ', emp.DNI, ' | Numero: ', emp.num);
    writeln;
end;


// Opcion 2.1
procedure buscarEmpleado(var archivoEmpleados: archivoRegistro);
var 
    opcion: integer;
    cant: integer;
    emp: empleado;
    dato: string;
begin

    cant := 1;

    writeln('¿Desea buscar por nombre o  por apellido?');
    writeln('1. Nombre');
    writeln('2. Apellido');
    write('Ingrese numero: ');
    readln(opcion);
    writeln;

    if (opcion = 1) then 
    begin
        write('Ingrese nombre a buscar: ');
        readln(dato);
        while (not EOF(archivoEmpleados)) do 
        begin
            read(archivoEmpleados, emp);
            if (emp.nombre = dato) then 
            begin 
                write(cant, '. ');
                imprimirEmpleado(emp); 
                cant := cant + 1;
            end;
        end;
    end
    else if (opcion = 2) then 
    begin
        write('Ingrese apellido a buscar: ');
        readln(dato);
        while (not EOF(archivoEmpleados)) do 
        begin
            read(archivoEmpleados, emp);
            if (emp.apellido = dato) then 
            begin
                write(cant, '. ');
                imprimirEmpleado(emp); 
                cant := cant + 1;
            end;
        end;
    end;
end;


// Opcion 2.2
procedure mostrarEmpleados (var archivoEmpleados: archivoRegistro);
var
    cant: integer;
    emp: empleado;
begin
    cant := 1;
    while (not EOF(archivoEmpleados)) do 
    begin
        read(archivoEmpleados, emp);
        write(cant, '. ');
        imprimirEmpleado(emp);
        cant := cant+1;
    end;
end;

// Opcion 2.3 
procedure mostrarMayores70 (var archivoEmpleados: archivoRegistro);
var 
    emp: empleado;
    edad: integer;
    cant: integer;
begin
    cant := 1;
    while(not EOF(archivoEmpleados)) do 
    begin
        read(archivoEmpleados, emp);
        edad := emp.edad;
        if (edad > 70) then 
        begin 
            write(cant, '. ');
            imprimirEmpleado(emp); 
            cant := cant + 1;
        end;
    end;
end;

procedure mostrarOpciones2 (var respuesta: integer);
begin
    writeln('1. Buscar por nombre o apellido');
    writeln('2. Mostrar todos los empleados.');
    writeln('3. Mostrar empleados mayores de 70 años, próximos a jubilarse.');
    write('Ingrese numero: ');
    readln(respuesta);
    writeln;
end;

procedure imprimirInfo (var archivoEmpleados: archivoRegistro);
var 
    respuesta: integer;

begin
    reset(archivoEmpleados);
    mostrarOpciones2(respuesta);
    if(respuesta = 1) then 
        buscarEmpleado(archivoEmpleados)
    else if (respuesta = 2) then 
        mostrarEmpleados(archivoEmpleados)
    else if (respuesta = 3) then 
        mostrarMayores70(archivoEmpleados)
    else 
        writeln('ERROR');
    
    close(archivoEmpleados);
end;

//

procedure ejecutarOpcionElegida (respuesta: integer; var archivoEmpleados: archivoRegistro);
var 
    nombreFisico: string;
begin
    write('Ingrese el nombre del archivo: ');
    readln(nombreFisico);
    assign(archivoEmpleados, nombreFisico);
    writeln; 

    if (respuesta = 1) then 
        crearArchivo(archivoEmpleados)
    else if (respuesta = 2) then 
        imprimirInfo(archivoEmpleados);
end;

{ Programa principal }

var 
    archivoEmpleados: archivoRegistro;
    respuesta: integer;

begin 
    mostrarOpciones(respuesta);
    if (respuesta <> 3) then
        ejecutarOpcionElegida(respuesta, archivoEmpleados);
end.