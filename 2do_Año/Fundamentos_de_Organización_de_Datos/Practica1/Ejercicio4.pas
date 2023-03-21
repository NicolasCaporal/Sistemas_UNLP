{ 4. Agregar al menú del programa del ejercicio 3, opciones para:
a. Añadir uno o más empleados al final del archivo con sus datos ingresados por
teclado. Tener en cuenta que no se debe agregar al archivo un empleado con
un número de empleado ya registrado (control de unicidad).
b. Modificar edad a uno o más empleados.
c. Exportar el contenido del archivo a un archivo de texto llamado
“todos_empleados.txt”.
d. Exportar a un archivo de texto llamado: “faltaDNIEmpleado.txt”, los empleados
que no tengan cargado el DNI (DNI en 00).
NOTA: Las búsquedas deben realizarse por número de empleado. }

program Ejercicio4_Practica1;

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


procedure imprimirEmpleado(emp: empleado);
begin
    writeln ('Nombre: ', emp.nombre, ' | Apellido: ', emp.apellido, ' | Edad: ', emp.edad, ' | DNI: ', emp.DNI, ' | Numero: ', emp.num);
    writeln;
end;


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