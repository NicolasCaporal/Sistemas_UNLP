{ 1. Una empresa posee un archivo con información de los ingresos percibidos por diferentes
empleados en concepto de comisión, de cada uno de ellos se conoce: código de empleado,
nombre y monto de la comisión. La información del archivo se encuentra ordenada por
código de empleado y cada empleado puede aparecer más de una vez en el archivo de
comisiones.

Realice un procedimiento que reciba el archivo anteriormente descripto y lo compacte. En
consecuencia, deberá generar un nuevo archivo en el cual, cada empleado aparezca una
única vez con el valor total de sus comisiones.

NOTA: No se conoce a priori la cantidad de empleados. Además, el archivo debe ser
recorrido una única vez. }

program ejercicio1_practica2;
const valor_alto = 32000;
type 
    empleado = record 
        code: integer;
        nombre: string;
        monto: real;
    end;

    archivoEmpleados = file of empleado;

procedure leer (var archivoBinario: archivoEmpleados; var e: empleado);
begin
    if (not EOF(archivoBinario)) then 
    begin
        read(archivoBinario, e);
    end
    else 
        e.code := valor_alto;
end;


{ Programa principal }
var 
    archivoComisiones: archivoEmpleados;
    archivoComisionesPorEmpleado: archivoEmpleados;
    e: empleado;
    eActual: empleado;
    suma: real;

begin
    assign(archivoComisiones, 'comisiones.dat');
    assign(archivoComisionesPorEmpleado, 'comisionesPorEmpleado.dat');

    reset(archivoComisiones);
    rewrite(archivoComisionesPorEmpleado);

    leer(archivoComisiones, e);
    while (e.code <> valor_alto) do
    begin
        write(e.code);
        suma := 0;
        eActual := e;
        while (eActual.code = e.code) do
        begin
            suma := suma + e.monto;
            leer(archivoComisiones, e);
        end;

        eActual.monto := suma;
        write('Suma: ', eActual.monto);
        write(archivoComisionesPorEmpleado, eActual);
  
    end;
end.