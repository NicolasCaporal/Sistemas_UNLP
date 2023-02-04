{ b. ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la
provincia de Buenos Aires. De cada campo se lee: localidad, cantidad de hectáreas sembradas y el tipo de zona
(1, 2 ó 3). La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse. El precio
de la soja es de U$S320 por tn. Informar:
● La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000.
● La localidad del campo con mayor rendimiento económico esperado.
● La localidad del campo con menor rendimiento económico esperado.
● El rendimiento económico promedio. }

program Practica2b_Ejercicio14b;

const
    precioSoja = 320;

type
    zona = 1..3;

procedure leerCampo (var localidad: string; var cantHa: real; var tipoZona: zona);
begin
    write('Ingrese la localidad: ');
    readln(localidad);
    write('Ingrese cantidad de hectáreas: ');
    readln(cantHa);
    write('Ingrese tipo de zona: ');
    readln(tipoZona);
end;

function calcRendimiento(tipoZona: zona; cantHa: real): real;
begin
    case (tipoZona) of
        1: calcRendimiento := cantHa * 6 * precioSoja;
        2: calcRendimiento := cantHa * 2.6 * precioSoja;
        3: calcRendimiento := cantHa * 1.4 * precioSoja;
    end;
end;

procedure analisisTdF(var contTdF: integer; localidad: string; rendimiento: real);
begin
    if ((localidad = 'Tres de Febrero') and (rendimiento>10000)) then
        contTdF := contTdF+1;
end;

procedure mayorYMenorRend (localidad: string; rendimiento: real; RMayor, Rmenor: real; var LMayor, LMenor:string);
begin
    if (rendimiento > Rmayor)then
    begin
        RMayor := rendimiento;
        LMayor := localidad;
    end;
    If (rendimiento < RMenor)then
    begin
        Rmenor := rendimiento;
        LMenor := localidad;
    end;
end;

function CPromedio (cantCampos: integer; sumaRend: real): real;
begin
    Cpromedio := sumaRend / cantCampos;
end;

{Programa Principal}
var
    localidad: string;
    cantHa: real;
    tipoZona: zona;
    contTdF: integer;
    rendimiento: real;
    RMayor, RMenor: real;
    LMayor, LMenor: string;
    contCampos: integer;
    sumaTotalRendimientos:real;
    promedio: real;

begin
    contTdF := 0;
    RMayor := -9999;
    RMenor := 9999;
    contCampos := 0;
    sumaTotalRendimientos := 0;
    
    repeat
        leerCampo(localidad, cantHa, tipoZona);
        writeln('___________________________________________');
        contCampos := contCampos+1;
        rendimiento := (calcRendimiento(tipoZona, cantHa));
        analisisTdF (contTdF, localidad, rendimiento);
        mayorYMenorRend (localidad, rendimiento, RMayor, RMenor, LMayor, LMenor);
        sumaTotalRendimientos := sumaTotalRendimientos + rendimiento;
        writeln();
    until ((cantHa = 900) and (localidad ='Saladillo'));
    
    writeln('Hay ', contTdF, ' campos en Tres de Febrero con cotización estimada mayor a 10000');
    writeln('El campo con mayor rendimiento está en la localidad de ', LMayor);
    writeln('El campo con menor rendimiento está en la localidad de ', LMenor);
    promedio:=(Cpromedio (contCampos, sumaTotalRendimientos) );
    writeln('El rendimiento promedio fue ', promedio:2:2);
end.