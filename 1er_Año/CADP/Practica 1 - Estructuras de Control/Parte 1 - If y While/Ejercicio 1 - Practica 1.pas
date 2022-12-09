{ 1. Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los
dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los números leídos
son iguales” }

program Practica1_Ejercicio1;
var
    numUno, numDos: integer;

begin
    readln(numUno);
    readln(numDos);
    
    if (numUno = numDos) then
        writeln('Los numeros son iguales')
        
    else
        if (numUno > numDos) then
            writeln(numUno, ' es mayor que ', numDos)
        else
            writeln(numDos, ' es mayor que ', numUno);
end.