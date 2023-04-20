{ 6- Se desea modelar la información necesaria para un sistema de recuentos de casos de
covid para el ministerio de salud de la provincia de buenos aires.
Diariamente se reciben archivos provenientes de los distintos municipios, la información
contenida en los mismos es la siguiente: código de localidad, código cepa, cantidad casos
activos, cantidad de casos nuevos, cantidad de casos recuperados, cantidad de casos
fallecidos.
El ministerio cuenta con un archivo maestro con la siguiente información: código localidad,
nombre localidad, código cepa, nombre cepa, cantidad casos activos, cantidad casos
nuevos, cantidad recuperados y cantidad de fallecidos.
Se debe realizar el procedimiento que permita actualizar el maestro con los detalles
recibidos, se reciben 10 detalles. Todos los archivos están ordenados por código de
localidad y código de cepa.
Para la actualización se debe proceder de la siguiente manera:
1. Al número de fallecidos se le suman el valor de fallecidos recibido del detalle.
2. Idem anterior para los recuperados.
3. Los casos activos se actualizan con el valor recibido en el detalle.
4. Idem anterior para los casos nuevos hallados.
Realice las declaraciones necesarias, el programa principal y los procedimientos que
requiera para la actualización solicitada e informe cantidad de localidades con más de 50
casos activos (las localidades pueden o no haber sido actualizadas). } 

program ejercicio6_practica2;

const 
    cantDetalles = 4;
    valorEspecial = 9999;

type 

    informacion_localidad = record 
        codigoL: integer;
        codigoC: integer; 
        casosActivos: integer;
        casosNuevos: integer;
        recuperados: integer;
        fallecidos: integer;
    end;

    maestro = record
        info: informacion_localidad;
        nombreL: string;
        nombreC: string;
    end;

    archivoInfo = file of informacion_localidad;
    archivoMaestro = file of maestro;

    arrayInformacion = array[1..cantDetalles] of archivoInfo;
    arrayRegistrosInfo = array[1..cantDetalles] of informacion_localidad;

procedure leerDetalle(var a: archivoInfo; var d: informacion_localidad);
begin
    //writeln('LeerDetalle');
    if (not (EOF(a))) then 
        read(a, d)
    else 
    begin
        d.codigoL := valorEspecial;
        //writeln('LLEGO AL FIN DE UN ARCHIVOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO');
    end;
end;

function buscarMinimoDetalle(arreglo: arrayInformacion): integer;
var 
    i: integer;
    iMin: integer;
    minL: integer;
    minC: integer;
    r: informacion_localidad;

begin
    //writeln('BuscarMinimoDetalle -----------');
    minL := 32766;
    minC := 32766;

    for i := 1 to cantDetalles do 
    begin
        leerDetalle(arreglo[i], r);
        //writeln('REVISA SI ', r.codigoL, ' (cepa:', r.codigoC, ') del archivo ', i, ' ES MINIMO');
        //writeln('if (', r.codigoL ,' < ', minL, ') or ((', r.codigoL, ' = ', minL, ') and (', r.codigoC ,' < ', minC, '))) then ');
        if ((r.codigoL < minL) or ((r.codigoL = minL) and (r.codigoC < minC))) then
        begin
            minL := r.codigoL;
            //writeln('minimo actual: ', minL);
            minC := r.codigoC;
            iMin := i;
        end; 

        if (r.codigoL <> valorEspecial) then 
            seek(arreglo[i], filePos(arreglo[i]) - 1);

    end;
    
    //writeln('El minimo fue ', minL, ' en la posicion ', iMin, '  del arreglo');
    buscarMinimoDetalle := iMin;
end;

procedure actualizarMaestro(var archivoM: archivoMaestro; infoDetalle: arrayInformacion);
var 
    i: integer;
    indiceMinimo: integer;
    registroM: maestro;
    registroD: informacion_localidad;
    localidadActual: integer;
    cepaActual: integer;
    maestroAuxiliar: maestro;

begin
    for i := 1 to cantDetalles do 
    begin
        reset(infoDetalle[i]);
    end;
    
    reset(archivoM);

    indiceMinimo := buscarMinimoDetalle(infoDetalle);
    leerDetalle(infoDetalle[indiceMinimo], registroD);    
    while (registroD.codigoL <> valorEspecial) do 
    begin
        writeln('Buscando ', registroD.codigoL, ' ', registroD.codigoC, ' en el maestro...');
        read(archivoM, registroM);
        while ((registroM.info.codigoC <> registroD.codigoC) and (registroM.info.codigoL <> registroD.codigoL)) do 
        begin
            read(archivoM, registroM);
        end;
        writeln('Encontró --> ', registroM.info.codigoL, ' ', registroM.info.codigoC);
        seek(archivoM, filePos(archivoM) - 1);

        maestroAuxiliar := registroM;

        localidadActual := registroD.codigoL;
        writeln('PreWhile: ', registroD.codigoL, ' ', registroD.codigoC);
        WRITELN;
        WRITELN('------- While localidad ------------');
        CepaActual := registroD.codigoC;
        while (( registroD.codigoL = localidadActual  ) and (registroD.codigoC = cepaActual) and (registroD.codigoL <> valorEspecial)) do 
        begin
            
                writeln('F: ', registroM.info.fallecidos, ' + ', registroD.fallecidos);
                registroM.info.fallecidos := registroM.info.fallecidos + registroD.fallecidos;
                writeln('F2: ', registroM.info.fallecidos);
                registroM.info.recuperados := registroM.info.recuperados + registroD.recuperados;
                registroM.info.casosActivos := registroD.casosActivos;
                registroM.info.casosNuevos := registroD.casosNuevos;
                writeln('Ya proceso: ', registroD.codigoL, ' ', registroD.codigoC);

                leerDetalle(infoDetalle[indiceMinimo], registroD);
                writeln('Saco ', registroD.codigoL, ' ',registroD.codigoC, ' del archivo ', indiceMinimo);

            write(archivoM, registroM);
        end;
        WRITELN('------------ Salio while localidad -----------------');
        WRITELN;
        
        if (registroD.codigoL <> valorEspecial) then 
            seek(infoDetalle[indiceMinimo], (filePos(infoDetalle[indiceMinimo]) -1 ));
        
        writeln('Ahora y antes');
        writeln(registroM.info.codigoL, ' ', registroM.info.codigoC, ' ', registroM.info.casosActivos, ' ', registroM.info.casosNuevos, ' ', registroM.info.recuperados, ' ', registroM.info.fallecidos, ' ', registroM.nombreC, ' ', registroM.nombreL);
        writeln(maestroAuxiliar.info.codigoL, ' ', maestroAuxiliar.info.codigoC, ' ', maestroAuxiliar.info.casosActivos, ' ', registroM.info.casosNuevos, ' ', maestroAuxiliar.info.recuperados, ' ', maestroAuxiliar.info.fallecidos, ' ', maestroAuxiliar.nombreC, ' ', maestroAuxiliar.nombreL);
        writeln('Actualizo: ', registroM.info.fallecidos <> maestroAuxiliar.info.fallecidos);
        writeln('Detalle: ',registroD.codigoL, ' ', registroD.codigoC);
        writeln;
        
        //write(archivoM, registroM);

        writeln('Busca nuevo minimo');
        indiceMinimo := buscarMinimoDetalle(infoDetalle);
        leerDetalle(infoDetalle[indiceMinimo], registroD);
        writeln('Encontro minimo ', registroD.codigoL, ' ', registroD.codigoC);
        
    end;
    writeln('SALIO DEL WHILE PRINCIPAL, ', registroD.codigoL , ' = ', valorEspecial);

    for i := 1 to cantDetalles do 
    begin
        close(infoDetalle[i]);
    end;

end;

function masDe50Activos (var a: archivoMaestro): integer;
var 
    localidadActual: integer;
    r: maestro;
    contador: integer;
    casosL: integer;
begin
    contador := 0;
    reset(a);
    read(a, r);
    while (not eof(a)) do 
    begin
        casosL := 0;
        localidadActual:= r.info.codigoL;
        writeln('LOCALIDAD ACTUAL: ', localidadActual);
        writeln(r.nombreL);
        while (localidadActual = r.info.codigoL) do 
        begin
            casosL := casosL + r.info.casosActivos;
            writeln('casosL :', casosL, ' DE ', r.nombreL);
            read(a, r);
        end;
        //writeln(r.nombreL, ' = ', casosL);
        if (casosL > 50) then 
        begin 
            writeln('Tiene ', casosL ,' casos activos.');
            contador := contador + 1;
            writeln('CONTADOR = ', contador);
        end;
        //read(a, r);
        writeln('____________');
    end;

    masDe50Activos := contador;

end;

{Programa principal}
var 
    maes: archivoMaestro;
    a: arrayInformacion;
    i: integer;
    iStr: string;

begin
    
    for i := 1 to cantDetalles do 
    begin
        str(i, iStr);
        assign(a[i], 'detalle' + iStr + '.dat');
    end;

    assign(maes,'maestro.dat');
    reset(maes);

    actualizarMaestro(maes, a);
    writeln;

    writeln(masDe50Activos(maes));

    WRITELN('FIN VERSION 2');
end.