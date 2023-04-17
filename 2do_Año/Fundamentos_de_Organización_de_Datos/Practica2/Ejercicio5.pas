{ 5. A partir de un siniestro ocurrido se perdieron las actas de nacimiento y fallecimientos de
toda la provincia de buenos aires de los últimos diez años. En pos de recuperar dicha
información, se deberá procesar 2 archivos por cada una de las 50 delegaciones distribuidas
en la provincia, un archivo de nacimientos y otro de fallecimientos y crear el archivo maestro
reuniendo dicha información.
Los archivos detalles con nacimientos, contendrán la siguiente información: nro partida
nacimiento, nombre, apellido, dirección detallada (calle,nro, piso, depto, ciudad), matrícula
del médico, nombre y apellido de la madre, DNI madre, nombre y apellido del padre, DNI del
padre.
En cambio, los 50 archivos de fallecimientos tendrán: nro partida nacimiento, DNI, nombre y
apellido del fallecido, matrícula del médico que firma el deceso, fecha y hora del deceso y
lugar.
Realizar un programa que cree el archivo maestro a partir de toda la información de los
archivos detalles. Se debe almacenar en el maestro: nro partida nacimiento, nombre,
apellido, dirección detallada (calle,nro, piso, depto, ciudad), matrícula del médico, nombre y
apellido de la madre, DNI madre, nombre y apellido del padre, DNI del padre y si falleció,
además matrícula del médico que firma el deceso, fecha y hora del deceso y lugar. Se
deberá, además, listar en un archivo de texto la información recolectada de cada persona. 

Nota: Todos los archivos están ordenados por nro partida de nacimiento que es única.
Tenga en cuenta que no necesariamente va a fallecer en el distrito donde nació la persona y
además puede no haber fallecido. }

program ejercicio5_practica2;

const 
    cantDelegaciones = 50;
    valorEspecial = 32766;

type 

    actaNacimiento = record 
        nroPartida: integer;
        nombre: string;
        apellido: string; 
        direccion: string;
        matriculaMedico: integer;
        madre: string;
        DniMadre: string;
        padre: string;
        DniPadre: string;
    end;

    actaDefuncion = record 
        nroPartida: integer;
        dni: string;
        nombre: string;
        apellido: string; 
        matriculaMedico: integer;
        fechaDeceso: string;
        horaDeceso: string;
        lugarDeceso: string;
    end;

    regMaestro = record
        partidaNacimiento: actaNacimiento;
        fallecio: boolean;
        matriculaMedicoDefuncion: integer;
        fechaDeceso: string;
        horaDeceso: string;
        lugarDeceso: string;
    end;


    archivoNacimientos = file of actaNacimiento;
    archivoFallecimientos = file of actaDefuncion;
    
    arregloNacimientos = array[1..cantDelegaciones] of archivoNacimientos;
    arregloFallecimientos = array[1..cantDelegaciones] of archivoFallecimientos;


    maestro = file of regMaestro;


procedure leerNacimiento (var archivo: archivoNacimientos; var registro: actaNacimiento);
begin
    if (not EOF(archivo)) then 
        read(archivo, registro)
    else 
        registro.nroPartida := valorEspecial;
end;

function indiceMinimoNacimiento (a: arregloNacimientos): integer;
var 
    min: integer;
    iMin: integer;
    i: integer;
    r: actaNacimiento;

begin
    min := valorEspecial;
    iMin := 1;

    for i := 1 to cantDelegaciones do 
    begin
        leerNacimiento(a[i], r);

        if (r.nroPartida < min) then 
        begin
            min := r.nroPartida;
            iMin := i;
        end;
        
        if (r.nroPartida <> valorEspecial) then
            seek(a[i], filePos(a[i]) - 1);

    end;

    indiceMinimoNacimiento := iMin;
end;


procedure leerFallecimiento(var archivo: archivoFallecimientos; var registro: actaDefuncion);
begin
    if (not EOF(archivo)) then 
        read(archivo, registro)
    else 
        registro.nroPartida := valorEspecial;
end;


function buscarActaDefuncion(arregloFalle: arregloFallecimientos; partidaABuscar: integer): integer;
var 
    f: actaDefuncion;
    i: integer;
    actaEncontrada: integer;

begin
    i := 0;
    actaEncontrada := -1;
    f.nroPartida := -1;

    while ((i < cantDelegaciones) and (f.nroPartida <> partidaABuscar)) do 
    begin
        i := i + 1;
        seek(arregloFalle[i], 0);

        leerFallecimiento(arregloFalle[i], f);
        while ((f.nroPartida <> valorEspecial) and (f.nroPartida <> partidaABuscar)) do 
        begin
            leerFallecimiento(arregloFalle[i], f);
        end;

    end;

    if (f.nroPartida = partidaABuscar) then
    begin
        actaEncontrada := i;
        seek(arregloFalle[actaEncontrada], filePos(arregloFalle[actaEncontrada]) - 1);
    end;

    buscarActaDefuncion := actaEncontrada;
end;


procedure copiarDatosFallecimiento(falle: actaDefuncion; var dato: regMaestro);
begin
    dato.matriculaMedicoDefuncion := falle.matriculaMedico;
    dato.fechaDeceso := falle.fechaDeceso;
    dato.horaDeceso := falle.horaDeceso;
    dato.lugarDeceso := falle.lugarDeceso;
end;

procedure crearArchivoMaestro (arregloNaci: arregloNacimientos; arregloFalle: arregloFallecimientos; var archivoMaestro: maestro);
var 
    regNacimiento: actaNacimiento;
    regFalleciemiento: actaDefuncion;
    dato: regMaestro;
    nroPartidaActual: integer;
    i: integer;
    indice: integer;

begin
    assign(archivoMaestro, 'maestro.dat');
    rewrite(archivoMaestro);

    for i := 1 to cantDelegaciones do 
    begin 
        reset(arregloNaci[i]);
        reset(arregloFalle[i]);
    end;

    indice := indiceMinimoNacimiento(arregloNaci);
    leerNacimiento(arregloNaci[indice], regNacimiento);
    dato.partidaNacimiento := regNacimiento;        
    
    while (dato.partidaNacimiento.nroPartida <> valorEspecial) do
    begin
        nroPartidaActual := dato.partidaNacimiento.nroPartida;

        indice := buscarActaDefuncion(arregloFalle, nroPartidaActual);
        if (indice = -1) then 
            dato.fallecio := false
        else 
        begin 
            dato.fallecio := true;
            read(arregloFalle[indice], regFalleciemiento);
            copiarDatosFallecimiento(regFalleciemiento, dato); // dato por referencia pasalo
        end;
        
        if (dato.partidaNacimiento.nroPartida <> valorEspecial) then
            write(archivoMaestro, dato);

        indice := indiceMinimoNacimiento(arregloNaci); 
        leerNacimiento(arregloNaci[indice], regNacimiento);
        dato.partidaNacimiento := regNacimiento;
    end;


    for i := 1 to cantDelegaciones do 
    begin
        close(arregloFalle[i]);
        close(arregloNaci[i]); 
    end;

    close(archivoMaestro);

end;


procedure generarTxtDelMaestro (var archivoMaestro: maestro);
var 
    r: regMaestro;
    lista: text;
    nString: string;

begin
    reset(archivoMaestro);

    assign(lista, 'archivoMaestro.txt');
    rewrite(lista);

    while (not EOF(archivoMaestro)) do 
    begin 
        read(archivoMaestro, r);
        str(r.partidaNacimiento.nroPartida, nString);
        writeln(lista, 'NRO PARTIDA DE NACIMIENTO: ' + nString);
        writeln(lista, 'NOMBRE: ' + r.partidaNacimiento.nombre + ' ' + r.partidaNacimiento.apellido);
        writeln(lista, 'DIRECCION: ' + r.partidaNacimiento.direccion);
        str(r.partidaNacimiento.matriculaMedico, nString);
        writeln(lista, 'MATRICULA MEDICO: ' + nString);
        writeln(lista, 'MADRE: ' + r.partidaNacimiento.madre + ' ' + r.partidaNacimiento.DniMadre);
        writeln(lista, 'PADRE: ' + r.partidaNacimiento.padre + ' ' + r.partidaNacimiento.DniPadre);
        if (r.fallecio) then 
        begin 
            writeln(lista, 'FALLECIO: SI');
            str(r.matriculaMedicoDefuncion, nString);
            writeln(lista, 'MATRICULA MEDICO: ' + nString);
            writeln(lista, 'FECHA DE DECESO: ' + r.fechaDeceso);
            writeln(lista, 'HORA DECESO: ' + r.horaDeceso);
            writeln(lista, 'LUGAR DE DECESO: ' + r.lugarDeceso);
        end 
        else 
            writeln(lista, 'FALLECIO: NO');
        writeln(lista, '-----------------------------------------');
    end;
end;


{ PROGRAMA PRINCIPAL }
var 
    i: integer;
    indiceStr: string;
    arregloNaci: arregloNacimientos;
    arregloFalle: arregloFallecimientos;
    archivoMaestro: maestro;

begin 
    for i := 1 to cantDelegaciones do 
    begin
        str(i, indiceStr);
        assign(arregloNaci[i], 'nacimiento' + indiceStr + '.dat');
        assign(arregloFalle[i], 'defuncion' + indiceStr + '.dat');
    end;

    crearArchivoMaestro(arregloNaci, arregloFalle, archivoMaestro);
    writeln('Archivo maestro creado.');
    generarTxtDelMaestro(archivoMaestro);
    writeln('Txt generado :)');
end.
