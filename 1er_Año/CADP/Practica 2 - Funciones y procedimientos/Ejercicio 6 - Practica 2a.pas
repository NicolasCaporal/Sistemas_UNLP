{ 6. a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la
lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
b. Implemente un programa que invoque al módulo del inciso a. }

program Practica2_Ejercicio6b;

function ParMasAlto: integer;
var
    numero:integer;
    max: integer;
    
begin
    max := -9999;

    repeat
        readln(numero);
        if (numero MOD 2 = 0) and (numero>max) then
            max:=numero;
    until (numero<0);

    if (max <>-9999)then
        writeln('El par mas alto fue ', max)
    else writeln('No hubo');
        ParMasAlto:=max;
end;

begin
    ParMasAlto;
end.