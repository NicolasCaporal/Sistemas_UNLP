{ 4. Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído) }

program Practica1_Ejercicio4;
var 
    numero, numeroDos: real;

begin

    readln(numero);
    
    repeat
        begin
            readln(numeroDos);
        end
    until ( (numero * 2) = numeroDos );

end.