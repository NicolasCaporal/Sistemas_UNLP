{ 11. A partir de información sobre la alfabetización en la Argentina, se necesita actualizar un
archivo que contiene los siguientes datos: nombre de provincia, cantidad de personas
alfabetizadas y total de encuestados. Se reciben dos archivos detalle provenientes de dos
agencias de censo diferentes, dichos archivos contienen: nombre de la provincia, código de
localidad, cantidad de alfabetizados y cantidad de encuestados. Se pide realizar los módulos
necesarios para actualizar el archivo maestro a partir de los dos archivos detalle.
NOTA: Los archivos están ordenados por nombre de provincia y en los archivos detalle
pueden venir 0, 1 ó más registros por cada provincia. }

program ejercicio11_practica2; 

const 
    valorEspecial = '~~~~~';

type 
    provincia = record 
        nombre: string;
        cantAlfabetizados: integer;
        cantEncuestados: integer;
    end;

    maestro = file of provincia;

    dato = record 
        provincia: string;
        localidad: string;
        cantAlfabetizados: integer;
        cantEncuestados: integer;
    end;

    detalle = file of dato;



procedure leerDetalle(var a: detalle; var r: dato);
begin
    if (not EOF(a)) then 
        read(a, r)
    else 
        r.provincia := valorEspecial;
end;


function encontrarMinimo (var a1, a2: detalle): dato;
var 
    r1, r2: dato;
    min: dato;

begin
    leerDetalle(a1, r1);
    leerDetalle(a2, r2);

    if (r1.provincia <= r2.provincia) then 
    begin
        min := r1;
        if (r2.provincia <> valorEspecial) then
            seek(a2, filePos(a2) - 1);
    end
    else 
    begin
        min := r2; 
        if (r1.provincia <> valorEspecial) then
            seek(a1, filePos(a1) - 1);
    end;

    encontrarMinimo := min;
end;


function buscarDetalleActualEnMaestro (var archivoMaestro: maestro; provincia: string): provincia;
var 
    r: provincia;

begin 
    read(archivoMaestro, r);

    while (r.nombre <> provincia) do
    begin
        read(archivoMaestro, r);
    end; 

    buscarDetalleActualEnMaestro := r;
end;


procedure actualizarMaestro (var archivoMaestro: maestro; var archivoD1, archivoD2: detalle);
var 
    registroMaestro: provincia;
    registroDetalle: dato;
    provinciaActual: string;
    
begin
    reset(archivoMaestro);
    reset(archivoD1);
    reset(archivoD2);

    registroDetalle := encontrarMinimo(archivoD1, archivoD2);
    
    while (registroDetalle.provincia <> valorEspecial) do 
    begin

        provinciaActual := registroDetalle.provincia;

        registroMaestro := buscarDetalleActualEnMaestro(archivoMaestro, provinciaActual);
        seek(archivoMaestro, filePos(archivoMaestro) - 1);
        
        while(provinciaActual = registroDetalle.provincia) do
        begin
            
            registroMaestro.cantAlfabetizados := registroMaestro.cantAlfabetizados + registroDetalle.cantAlfabetizados;
            registroMaestro.cantEncuestados := registroMaestro.cantEncuestados + registroDetalle.cantEncuestados;

            registroDetalle := encontrarMinimo(archivoD1, archivoD2);
        end;

        write(archivoMaestro, registroMaestro);

    end;

    close(archivoMaestro);
    close(archivoD1);
    close(archivoD2);

    writeln('Archivo actualizado correctamente.');
end;



{ Programa principal }
var 
    archivoMaestro: maestro;
    archivoAgencia1: detalle;
    archivoAgencia2: detalle;

begin

    assign(archivoMaestro, 'maestro.dat');
    assign(archivoAgencia1, 'detalle1.dat');
    assign(archivoAgencia2, 'detalle2.dat');

    actualizarMaestro(archivoMaestro, archivoAgencia1, archivoAgencia2);

end.