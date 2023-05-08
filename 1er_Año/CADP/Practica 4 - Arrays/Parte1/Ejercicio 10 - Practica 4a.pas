{10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector. Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}

program Practica4a_Ejercicio10;
const 
    df=30;

type
    salarios = array [1..df] of real;

procedure leerSalarios (var salarios: salarios; var dL: integer);
begin

    dL := 1; 
    write(dl, ': ');
    readln(salarios[dL]);

    while (salarios[dL] <> 0) and (dL < dF) do
    begin
        dL := dL + 1; 
        write(dl, ': ');
        readln(salarios[dL]); 
    end;

    if (salarios[dL] = 0) then 
    begin
        dL := dL - 1; 
        writeln();
    end;

end;

procedure incrementarSalarios (var salarios: salarios; dL: integer; X: real);
var
    i: integer;

begin

    writeln('Incrementando salarios...');
    for i:= 1 to dL do
    begin
        write(i, ': ');
        salarios[i] := salarios[i] * X ;
        writeln(salarios[i]:2:2);
    end;
    writeln();

end;

function sumarSalarios (salarios: salarios; dL: integer): real;
var
    i: integer;
    sumaTotal: real;

begin

    sumaTotal:=0;
    writeln('Sumando salarios...');
    for i := 1 to dL do
        sumaTotal := sumaTotal + salarios[i];
        
    sumarSalarios := sumaTotal;

end;

procedure imprimirPromedio (salarios: salarios; dL: integer);
var
    promedio: real;

begin

    writeln('Calculando promedio...');
    if (dL > 0) then
        promedio := sumarSalarios(salarios, dL) / dL  
    else
        writeln(' No se pudo calcular el promedio');

    writeln();
    writeln('El salario promedio de los empleados es ', promedio:2:2);

end;


// Programa principal
var
    salariosP: salarios;
    dL: integer;
    
begin
    leerSalarios(salariosP, dL);
    incrementarSalarios(salariosP, dL, 1.15);
    imprimirPromedio(salariosP, dL);
end.
