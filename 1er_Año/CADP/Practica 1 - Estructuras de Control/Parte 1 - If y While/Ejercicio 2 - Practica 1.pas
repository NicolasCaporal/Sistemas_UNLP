{ 2. Realizar un programa que lea un número real e imprima su valor absoluto }

program Practica1_Ejercicio2;
var
    numero:real;
    
begin
    readln(numero);
  
    if (numero >= 0) then
        write('El valor absoluto es ', numero:5:2)
    else
        write('El valor absoluto es ', numero * (-1):5:2);
end.