{ 1. Modificar el ejercicio 4 de la práctica 1 (programa de gestión de empleados),
agregándole una opción para realizar bajas copiando el último registro del archivo en
la posición del registro a borrar y luego truncando el archivo en la posición del último
registro de forma tal de evitar duplicados. }

program ejercicio1_practica3;

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
    writeln('OPCION 3: Exportar información a .txt');
    writeln('OPCION 4: Eliminar un empleado.');
    writeln('OPCION 5: Cancelar.');
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

function chequearEmpleado(var archivoEmpleados: archivoRegistro; num: string):boolean;
var 
    return: boolean;
    emp: empleado;

begin
    return := true;
    seek(archivoEmpleados, 0);
    while (not EOF(archivoEmpleados)) do 
    begin
        read(archivoEmpleados, emp);
        if (emp.num = num) then 
        begin
            return := false;
            seek(archivoEmpleados, fileSize(archivoEmpleados));
        end; 
    end;
    chequearEmpleado := return;
end;

procedure agregarEmpleadosArchivo(var archivoEmpleados: archivoRegistro);
var
    emp: empleado;
    cant: integer;

begin
    write('Ingrese cuantos empleados desea agregar al archivo: ');
    readln(cant);
    reset(archivoEmpleados);

    if (cant > 0) then 
    begin
        while (cant > 0) do
        begin
            leerEmpleado(emp);
            if (chequearEmpleado(archivoEmpleados, emp.num)) then 
                write(archivoEmpleados, emp)
            else 
                writeln('Error: El empleado con numero ', emp.num , ' ya se encontraba en el archivo.');
            cant := cant - 1;
            writeln(cant);
        end;
    end 
    else 
        writeln('ERROR');
    close(archivoEmpleados);
end;


procedure modificarEdad (var archivoEmpleados: archivoRegistro);
var 
    nro: string;
    empActual: empleado;
    pos: integer;
    emp: empleado;
begin

    reset(archivoEmpleados);
    write('Ingrese numero de empleado a modificar edad. Para finalizar ingrese "00" ');
    readln(nro);
    while (nro <> '00') do
    begin
        pos := -1;
        seek(archivoEmpleados, 0);
        while (not EOF(archivoEmpleados)) do 
        begin
            read(archivoEmpleados, empActual);
            if (empActual.num = nro) then 
            begin
                emp := empActual;
                pos := filePos(archivoEmpleados) - 1;
                seek(archivoEmpleados, fileSize(archivoEmpleados));
            end;
        end; 
        if (pos <> -1) then
        begin
            imprimirEmpleado(emp);
            write('Ingrese edad: ');
            readln(emp.edad);
            seek(archivoEmpleados, pos);
            write(archivoEmpleados, emp);
        end 
        else 
            writeln('No se encontró al empleado número ', nro);

        write('Ingrese numero de empleado a modificar edad. Para finalizar ingrese "00" ');
        readln(nro);
    end;

    close(archivoEmpleados);
end;


procedure submenuOpcion2 (var archivoEmpleados: archivoRegistro);
var 
    opcion: integer;
    nombreFisico: string;
begin

    write('Ingrese el nombre del archivo: ');
    readln(nombreFisico);
    assign(archivoEmpleados, nombreFisico);
    writeln; 

    writeln('1. Agregar empleados');
    writeln('2. Modificar edad de empleados');
    write('Ingrese un numero: ');
    readln(opcion);

    if (opcion = 1) then
    begin 
        agregarEmpleadosArchivo(archivoEmpleados);
    end
    else if (opcion = 2) then 
    begin 
        modificarEdad(archivoEmpleados);
    end
    else 
        writeln('ERROR');
end;


procedure escribirEmpleadoEnTXT (emp: empleado; var archivoTXT: text);
begin
    writeln(archivoTXT, emp.num);
    writeln(archivoTXT, emp.apellido);
    writeln(archivoTXT, emp.nombre);
    writeln(archivoTXT, emp.edad);
    writeln(archivoTXT, emp.DNI);
    writeln(archivoTXT, '__________________________________');
end;


procedure generarTXTcompleto (var archivoEmpleados: archivoRegistro);
var 
    archivoTXT: text;
    emp: empleado;
begin
    assign(archivoTXT, 'todos_empleados.txt');
    rewrite(archivoTXT);
    reset(archivoEmpleados);

    while (not EOF(archivoEmpleados)) do 
    begin
        read(archivoEmpleados, emp);
        escribirEmpleadoEnTXT(emp, archivoTXT);
    end;

    close(archivoTXT);
    close(archivoEmpleados);

end;


procedure generarTXTsinDNI(var archivoEmpleados: archivoRegistro);
var 
    archivoTXT: text;
    emp: empleado;
begin
    assign(archivoTXT, 'faltaDNIEmpleado.txt');
    rewrite(archivoTXT);
    reset(archivoEmpleados);

    while (not EOF(archivoEmpleados)) do 
    begin
        read(archivoEmpleados, emp);
        if (emp.DNI = '00') then 
            escribirEmpleadoEnTXT(emp, archivoTXT);
    end;

    close(archivoEmpleados);
    close(archivoTXT);
end;


procedure menuOpcion3 (var archivoEmpleados: archivoRegistro);
var 
    opcion: integer;
    nombreFisico: string;

begin
    writeln;
    writeln('1. Exportar a .txt toda la información');
    writeln('2. Exportar a .txt empleados sin DNI');
    write('Ingrese un numero: ');
    readln(opcion);

    write('Ingrese el nombre del archivo a exportar: ');
    readln(nombreFisico);
    assign(archivoEmpleados, nombreFisico); 
    writeln; 

    if (opcion = 1) then 
    begin
        generarTXTcompleto(archivoEmpleados);
    end
    else if (opcion = 2) then 
    begin 
        generarTXTsinDNI(archivoEmpleados);
    end
    else    
        writeln('ERROR');
end;


procedure menuOpcion1 (var archivoEmpleados: archivoRegistro);
var 
    opcion: integer;
    nombreFisico: string;

begin
    writeln();
    writeln('1. Crear nuevo archivo');
    writeln('2. Modificar un archivo ya existente');
    write('Ingrese un numero: ');
    readln(opcion);

    if (opcion = 1) then 
    begin
        write('Ingrese el nombre del archivo: ');
        readln(nombreFisico);
        assign(archivoEmpleados, nombreFisico);
        writeln; 
        crearArchivo(archivoEmpleados);
    end
    else if (opcion = 2) then 
        submenuOpcion2(archivoEmpleados)
    else 
        writeln('ERROR');
end;


procedure eliminarEmpleado(var archivo: archivoRegistro; nro: string);
var 
    e: empleado;
    i: integer;

begin
    reset(archivo);
    
    read(archivo, e);
    while ((not EOF(archivo)) and (e.num <> nro)) do
    begin
        read(archivo, e);
        if (e.num = nro) then 
        begin
            i := filePos(archivo) - 1; 
            seek(archivo, fileSize(archivo) -1);
            read(archivo, e);
            

            seek(archivo, i);
            write(archivo, e);


            seek(archivo, fileSize(archivo) - 1);
            truncate(archivo);
            writeln('Empleado ', nro, ' eliminado correctamente');
        end;
    end;

    if (e.num <> nro) then
        writeln('No se encontró al empleado nro ', nro);
    
    close(archivo);
end;


procedure ejecutarOpcionElegida (respuesta: integer; var archivoEmpleados: archivoRegistro);
var 
    nombreFisico: string;
    nro: string;
begin
    case respuesta of
        1: menuOpcion1(archivoEmpleados);
        
        2:  begin 
                write('Ingrese el nombre del archivo: ');
                readln(nombreFisico);
                assign(archivoEmpleados, nombreFisico);
                writeln;  
                imprimirInfo(archivoEmpleados);
            end;

        3: menuOpcion3(archivoEmpleados);

        4:  begin 
                write('Ingrese el nombre del archivo: ');
                readln(nombreFisico);
                assign(archivoEmpleados, nombreFisico);
                write('Ingrese el numero del empleado a eliminar: ');
                readln(nro);
                eliminarEmpleado(archivoEmpleados, nro);
            end;

        else writeln('ERROR');
    end;
end;



{ Programa principal }
var 
    archivoEmpleados: archivoRegistro;
    respuesta: integer;

begin 
    mostrarOpciones(respuesta);
    if (respuesta <> 5) then
        ejecutarOpcionElegida(respuesta, archivoEmpleados);
end.