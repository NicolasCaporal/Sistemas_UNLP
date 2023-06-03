{ 15. Se desea modelar la información de una ONG dedicada a la asistencia de personas con
carencias habitacionales. La ONG cuenta con un archivo maestro conteniendo información
como se indica a continuación: Código pcia, nombre provincia, código de localidad, nombre
de localidad, #viviendas sin luz, #viviendas sin gas, #viviendas de chapa, #viviendas sin
agua,# viviendas sin sanitarios.
Mensualmente reciben detalles de las diferentes provincias indicando avances en las obras
de ayuda en la edificación y equipamientos de viviendas en cada provincia. La información
de los detalles es la siguiente: Código pcia, código localidad, #viviendas con luz, #viviendas
construidas, #viviendas con agua, #viviendas con gas, #entrega sanitarios.
Se debe realizar el procedimiento que permita actualizar el maestro con los detalles
recibidos, se reciben 10 detalles. Todos los archivos están ordenados por código de
provincia y código de localidad.
Para la actualización se debe proceder de la siguiente manera:
1. Al valor de vivienda con luz se le resta el valor recibido en el detalle.
2. Idem para viviendas con agua, gas y entrega de sanitarios.
3. A las viviendas de chapa se le resta el valor recibido de viviendas construidas
La misma combinación de provincia y localidad aparecen a lo sumo una única vez.
Realice las declaraciones necesarias, el programa principal y los procedimientos que
requiera para la actualización solicitada e informe cantidad de localidades sin viviendas de
chapa (las localidades pueden o no haber sido actualizadas). }

program ejercicio15_practica2;

const 
    cantProvincias = 3;
    valorEspecial = 9999;

type 
    informacionONG = record 
        codigoPcia: integer;
        nombrePcia: string;
        codigoLoc: integer;
        nombreLoc: string;
        cantVSL: integer;
        cantVSG: integer;
        cantVDC: integer;
        cantVSA: integer;
        cantVSS: integer;
    end;

    maestro = file of informacionONG;

    informacionProv = record 
        codigoPcia: integer;
        codigoLoc: integer;
        cantVCL: integer;
        cantVC: integer;
        cantVCA: integer;
        cantVCG: integer;
        cantES: integer;
    end;

    detalle = file of informacionProv;
    arregloDetalles = array[1..cantProvincias] of detalle;
    arregloRegistros = array[1..cantProvincias] of informacionProv;



procedure leerDetalle (var a: detalle; var r: informacionProv);
begin
    if (not EOF(a)) then 
        read(a, r)
    else 
        r.codigoPcia := valorEspecial;
end;


procedure buscarMinimo (var aArchivos: arregloDetalles; var aRegistros: arregloRegistros; var minimo: informacionProv; var indiceMinimo: integer);
var 
    i: integer;
    registro: informacionProv;

begin

    minimo.CodigoPcia := valorEspecial;
    indiceMinimo := valorEspecial;

    for i := 1 to cantProvincias do 
    begin
        registro := aRegistros[i];
        if ((registro.codigoPcia < minimo.codigoPcia) or ((registro.codigoPcia = minimo.codigoPcia) and (registro.codigoLoc < minimo.codigoLoc))) then 
        begin 
            minimo := registro;
            indiceMinimo := i;
        end;
    end;

    if (indiceMinimo <> valorEspecial) then 
    begin
        leerDetalle(aArchivos[indiceMinimo], aRegistros[indiceMinimo]); 
    end;

end;


procedure actualizarMaestro (var archivoM: maestro; aDetalles: arregloDetalles);
var 
    i: integer;
    registroDetalleActual: informacionProv;

    aRegistrosD: arregloRegistros;
    indiceActual: integer;

    registroM: informacionONG;

    provinciaActual: integer;
    localidadActual: integer;

begin
    reset(archivoM);
    for i :=  1 to cantProvincias do 
    begin
        reset(aDetalles[i]);
        leerDetalle(aDetalles[i], aRegistrosD[i]);
    end;

    buscarMinimo(aDetalles, aRegistrosD, registroDetalleActual, indiceActual);
    while (registroDetalleActual.codigoPcia <> valorEspecial) do 
    begin

        provinciaActual := registroDetalleActual.codigoPcia;
        localidadActual := registroDetalleActual.codigoLoc;

        read(archivoM, registroM);
        while((registroM.codigoPcia <> provinciaActual) or (registroM.codigoLoc <> localidadActual)) do 
        begin
            read(archivoM, registroM);
        end;
        seek(archivoM, filePos(archivoM) - 1);


        while ((registroDetalleActual.codigoPcia = provinciaActual) and (registroDetalleActual.codigoLoc = localidadActual)) do
        begin
            registroM.cantVSL := registroM.cantVSL - registroDetalleActual.cantVCL;
            registroM.cantVSG := registroM.cantVSG - registroDetalleActual.cantVCG;
            registroM.cantVDC := registroM.cantVDC - registroDetalleActual.cantVC;
            registroM.cantVSA := registroM.cantVSA - registroDetalleActual.cantVCA;
            registroM.cantVSS := registroM.cantVSS - registroDetalleActual.cantES;

            leerDetalle(aDetalles[indiceActual], registroDetalleActual);
        end;

        if (registroDetalleActual.codigoPcia <> valorEspecial) then
            seek(aDetalles[indiceActual], filePos(aDetalles[indiceActual]) - 1);

        write(archivoM, registroM);
        
        buscarMinimo(aDetalles, aRegistrosD, registroDetalleActual, indiceActual);
    end;

    for i := 1 to cantProvincias do 
    begin
        close(aDetalles[i]); 
    end;
    close(archivoM);
end;



{ Programa principal }
var 
    archivoMaestro: maestro;
    aDetalles: arregloDetalles;
    i: integer;
    iStr: string;

begin
    assign(archivoMaestro, 'maestro.dat');
    for i := 1 to cantProvincias do 
    begin
        str(i, iStr);
        assign(aDetalles[i], 'detalle' + iStr + '.dat'); 
    end;

    actualizarMaestro(archivoMaestro, aDetalles);
end.
