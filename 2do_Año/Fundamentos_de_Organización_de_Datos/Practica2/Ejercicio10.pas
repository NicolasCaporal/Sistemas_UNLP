{ 10. Se tiene información en un archivo de las horas extras realizadas por los empleados de
una empresa en un mes. Para cada empleado se tiene la siguiente información:
departamento, división, número de empleado, categoría y cantidad de horas extras
realizadas por el empleado. Se sabe que el archivo se encuentra ordenado por
departamento, luego por división, y por último, por número de empleados. Presentar en
pantalla un listado con el siguiente formato: 
Departamento
División
Número de Empleado      Total de Hs.    Importe a cobrar
......                  ..........      .........
......                  ..........      .........

Total de horas división: ____
Monto total por división: ____


División
.................
Total horas departamento: ____
Monto total departamento: ____


Para obtener el valor de la hora se debe cargar un arreglo desde un archivo de texto al
iniciar el programa con el valor de la hora extra para cada categoría. La categoría varía
de 1 a 15. En el archivo de texto debe haber una línea para cada categoría con el número
de categoría y el valor de la hora, pero el arreglo debe ser de valores de horas, con la
posición del valor coincidente con el número de categoría. }

program ejercicio10_practica2;

const 
    cantCategorias = 15;
    valorEspecial = 9999;

type 
    empleado = record 
        departamento: integer;
        division: integer;
        nroEmpleado: integer;
        categoria: 1..cantCategorias;
        cantHorasExtra: real;
    end;

    archivo = file of empleado;

    arregloReales = array[1..cantCategorias] of real;



procedure cargarArregloValorHorasExtra (var valorHoraPorCategoria: arregloReales);
var 
    a: text;
    i: integer;
    valor: real;
begin
    assign(a, 'valorHoraPorCategoria.txt');
    reset(a);

    while (not EOF(a)) do 
    begin
        readln(a, i, valor);
        valorHoraPorCategoria[i] := valor;
    end;
end;


procedure leerEmpleado (var a: archivo; var r: empleado);
begin
    if (not EOF(a)) then 
        read(a, r)
    else 
        r.departamento := valorEspecial;
end;


procedure mostrarListado (var a: archivo; valorHora: arregloReales);
var 
    empleadoActual: empleado;
    departamentoActual: integer;
    divisionActual: integer;

    horas: real;
    cobra : real;
    categoria: integer;

    totalHorasDivision: real;
    montoTotalDivision: real;
    totalHorasDepartamento: real;
    montoTotalDepartamento: real;

begin
    reset(a);

    leerEmpleado(a, empleadoActual);

    while (empleadoActual.departamento <> valorEspecial) do 
    begin

        departamentoActual := empleadoActual.departamento;
        totalHorasDepartamento := 0;
        montoTotalDepartamento := 0;

        writeln('DEPARTEMENTO ', departamentoActual);
        while (departamentoActual = empleadoActual.departamento) do 
        begin 

            divisionActual := empleadoActual.division;
            totalHorasDivision := 0;
            montoTotalDivision := 0;

            writeln('DIVISION ', divisionActual);
            while ((divisionActual = empleadoActual.division) and (departamentoActual = empleadoActual.departamento))do
            begin
                horas := empleadoActual.cantHorasExtra;
                categoria := empleadoActual.categoria;
                cobra := horas * valorHora[categoria];

                writeln('Numero de Empleado: ', empleadoActual.nroEmpleado, ' Total de Hs: ', horas:2:2, ' Importe a cobrar: ', cobra:2:2);
                
                totalHorasDivision := totalHorasDivision + horas;
                montoTotalDivision := montoTotalDivision + cobra;

                leerEmpleado(a, empleadoActual);
            end;

            totalHorasDepartamento := totalHorasDepartamento + totalHorasDivision;
            montoTotalDepartamento := montoTotalDepartamento + montoTotalDivision;

            writeln;
            writeln('Total de horas división: ',  totalHorasDivision:2:2);
            writeln('Monto total divison: ', montoTotalDivision:2:2);
            writeln;

        end;

        writeln;
        writeln('Total de horas departemento: ',  totalHorasDepartamento:2:2);
        writeln('Monto total departamento: ', montoTotalDepartamento:2:2);
        writeln;
        writeln('____________________________________________');
        writeln;
    end;

end;

{ Programa principal }
var 
    valorHoraPorCategoria: arregloReales;
    archivoHE: archivo;
    
begin
    cargarArregloValorHorasExtra(valorHoraPorCategoria);

    assign(archivoHE, 'horasExtra.dat');
    mostrarListado(archivoHE, valorHoraPorCategoria);
end.
