{ 1. Implemente un programa que lea por teclado dos números enteros e imprima en pantalla los
valores leídos en orden inverso. Por ejemplo, si se ingresan los números 4 y 8, debe mostrar el
mensaje: Se ingresaron los valores 8 y 4 }

program Practica0_Ejercicio1;
var
    num1, num2: integer;
begin
    read(num1,num2);
    writeln ('Se ingresaron los valores ', num2, ' y ', num1);
end.