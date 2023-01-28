{ Consigna:
10. Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega
el número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos
pares y la cantidad de dígitos impares que posee. }


program Practica2b_Ejercicio10;

function esPar (digito: integer): boolean;
begin
    esPar := (digito mod 2 = 0);
end;

procedure analizarNumero (numero: integer; var suma, cantI: integer);
var
    digito: integer;

begin

    suma := 0;
    cantI := 0;
    
    while (numero <> 0) do
    begin
        digito := numero mod 10;
        
        if (esPar(digito)) then
            suma := suma + digito
        else
            cantI := cantI + 1;
        
        numero := numero div 10;
    end;
    
end;

{Programa Principal}
var
    num, sumaP, cantidadI: integer;

begin

    write('Ingrese un numero: ');
    readln(num);
    while (num <> 12345) do                     {Pascal en numeros enteros, solo puede representar hasta el 32767, el 123456 que pide el ejercicio está fuera de rango, si usamos ese numero, el programa se rompe, por lo que usé como numero de corte el 12345}
    begin
        analizarNumero(num, sumaP, cantidadI);
        writeln('La suma de sus digitos pares es ', sumaP);
        writeln('Tiene ', cantidadI, ' digitos impares');
        writeln('__________________________________________');
        writeln();
        write('Ingrese un numero: ');
        readln(num);
    end;
    
end.