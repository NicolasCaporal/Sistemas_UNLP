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
    cantProvincias = 4;
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
        nombreLoc: integer;
        cantVCL: integer;
        cantVC: integer;
        cantVCA: integer;
        cantVCG: integer;
        cantES: integer;
    end;

    detalle = file of informacionProv;
    arregloDetalles = array[1..cantProvincias] of detalle;
    arregloRegistros = array[1..cantProvincias] of informacionProv;



procedure leerDetalle (var a: detelle; var r: informacionProv);
begin
    if (not EOF(a)) then 
        read(a, r);
    else 
        r.codigoPcia := valorEspecial;
end;


procedure buscarMinimo (var aArchivos: arregloDetalles; var aRegistros: arregloRegistros; var minimo: informacionProv; var indiceMinimo: integer);
var 
    i: integer;
    registro: informacionProv;

begin
    minimoCodigoPcia := valorEspecial;

    for i := 1 to cantProvincias do 
    begin
        registro := aRegistros[i];
        if ((registros.codigoPcia < minimo.codigoPcia) or ((registro.codigoPcia = minimo.codigoPcia) and (registro.codigoLoc < minimo.codigoLoc))) then 
        begin 
            minimo := registro[i];
            indiceMinimo := i;
        end
    end;

    if (minimo.codigoPcia <> valorEspecial) then 
        leerDetalle(arregloArchivos[indiceMinimo], aRegistros[indiceMinimo]);

end;


procedure actualizarMaestro (var archivoM: maestro; aDetalles: arregloDetalles);
var 
    i: integer;
    registroDetalleActual: informacionProv;

    aRegistrosD: arregloRegistros;
    indiceActual: integer;

    registroM: integer;

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
        read(archivoM, registroMaestro);
        while((registroMaestro.codigoPcia <> provinciaActual) and (registroMaestro.codigoLoc <> registroDetalleActual.codigoLoc)) do 
        begin
            read(archivoM, registroMaestro);
        end;
        seek(archivoMaestro, filePos(archivoMaestro) - 1);


        codigoLoc := registroDetalleActual.codigoLoc;
        while ((registroDetalleActual.codigoPcia = provinciaActual) and (registroDetalleActual.codigoLoc = localidadActual)) do
        begin
            registroMaestro.cantVSL := archivoM.cantVSL - registroDetalleActual.VCL;
            registroMaestro.cantVSG := archivoM.cantVSG - registroDetalleActual.VCG;
            registroMaestro.cantVDC := archivoM.cantVDC - registroDetalleActual.cantVC;
            registroMaestro.cantVSA := archivoM.cantVSA - registroDetalleActual.cantVCA;
            registroMaestro.cantVSS := archivoM.cantVSS - registroDetalleActual.cantES;

            leerDetalle(aDetalles[indiceActual], registroDetalleActual);
        end;
        write(archivoM, registroMaestro);


        if (registroDetalleActual.codigoPcia <> valorEspecial) then 
        begin
            seek(aDetalles[indiceActual], filePos(aDetalles[indiceActual]) - 1);
            aRegistrosD[indiceActual] := registroDetalleActual;
        end;

        buscarMinimo(aDetalles, aRegistrosD, registroDetalleActual, indiceActual);
    end;
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
        assign(aDetalles[i], 'detalle', iStr, '.dat'); 
    end;

end.
