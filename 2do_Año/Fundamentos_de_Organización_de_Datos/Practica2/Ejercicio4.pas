{ 4. Suponga que trabaja en una oficina donde está montada una LAN (red local). La misma
fue construida sobre una topología de red que conecta 5 máquinas entre sí y todas las
máquinas se conectan con un servidor central. Semanalmente cada máquina genera un
archivo de logs informando las sesiones abiertas por cada usuario en cada terminal y por
cuánto tiempo estuvo abierta. Cada archivo detalle contiene los siguientes campos:
cod_usuario, fecha, tiempo_sesion. Debe realizar un procedimiento que reciba los archivos
detalle y genere un archivo maestro con los siguientes datos: cod_usuario, fecha,
tiempo_total_de_sesiones_abiertas.
Notas:
- Cada archivo detalle está ordenado por cod_usuario y fecha.
- Un usuario puede iniciar más de una sesión el mismo día en la misma o en diferentes
máquinas.
- El archivo maestro debe crearse en la siguiente ubicación física: /var/log. }

program ejercicio4_practica2;

const 
    df = 3;
    valorEspecial = 9999;

type
    r_fecha = record 
        dia: integer;
        mes: integer;
        anio: integer;
    end;

    sesion = record
        codigo: integer;
        fecha: r_fecha;
        tiempoSesion: real;
    end;

    archivoDatos = file of sesion;
    maquinas = array[1..df] of archivoDatos;
    logs = array[1..df] of sesion;


procedure leerDato(var archivoServidor: archivoDatos; var v: sesion);
begin
    if (not EOF(archivoServidor)) then 
        read(archivoServidor, v)
    else 
        v.codigo := valorEspecial;
end;


function masAntiguo(f1, f2: r_fecha): boolean;
begin
    if (f1.anio = f2.anio) then 
    begin
        if (f1.mes = f2.mes) then 
            masAntiguo := f1.dia < f2.dia
        else 
            masAntiguo := f1.dia < f2.dia;
    end
    else 
        masAntiguo := f1.anio < f2.anio;
end;


function indiceMinimo (a: logs): integer;
var 
    iMin: integer;
    i: integer;
begin
    iMin := 1;

    for i := 2 to df do 
    begin 
        if (a[i].codigo < a[iMin].codigo) or ((a[i].codigo = a[iMin].codigo) and (masAntiguo(a[i].fecha, a[iMin].fecha))) then 
            iMin := i;
    end;

    indiceMinimo := iMin;
end;


procedure generarMaestro (arregloArchivos: maquinas; var archivoServidor: archivoDatos);
var 
    i: integer;
    arregloDatos: logs;
    d: sesion;
    actual: sesion;

begin

    for i := 1 to df do 
    begin
        reset(arregloArchivos[i]);
        leerDato(arregloArchivos[i], arregloDatos[i]);
    end;

    assign(archivoServidor, 'servidor.dat');
    rewrite(archivoServidor);

    i := indiceMinimo(arregloDatos);
    d := arregloDatos[i];

    while (d.codigo <> valorEspecial) do
    begin
        actual := d;
        while (d.codigo = actual.codigo) do
        begin  
            actual.tiempoSesion := d.tiempoSesion + actual.tiempoSesion;

            i := indiceMinimo(arregloDatos);
            d := arregloDatos[i];
            leerDato(arregloArchivos[i], arregloDatos[i]);
        end;

        write(archivoServidor, actual);

        if (d.codigo = valorEspecial) then 
        begin
            i := indiceMinimo(arregloDatos);
            d := arregloDatos[i];
        end;
    end;

    close(archivoServidor);
    for i := 1 to df do 
        close(arregloArchivos[i]);

    write('Archivo generado exitosamente.');
end;


{PROGRAMA PRINCIPAL}
var 
    i: integer;
    indiceStr: string;
    arreglo: maquinas;
    servidor: archivoDatos;
begin 

    for i := 1 to df do 
    begin
        str(i, indiceStr);
        assign(arreglo[i], 'detalle'+indiceStr+'.dat');
    end;


    generarMaestro(arreglo, servidor);

end.
