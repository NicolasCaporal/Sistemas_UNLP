{ 4. Implemente un programa que lea el diámetro D de un círculo e imprima:
b. El área del círculo }

program Practica0_Ejercicio4B;
const
    pi = 3.1415;
    
var
    diametro, radio, area: real;
    
begin
    readln(Diametro);
    radio := diametro / 2;
    area := pi * radio * radio;
    write ('El area del circulo es ', area:4:2);
end.