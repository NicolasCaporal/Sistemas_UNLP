{ 4. Implemente un programa que lea el diámetro D de un círculo e imprima:
c. El perímetro del círculo. }

program Practica0_Ejercicio4c;
const
    pi = 3.1415;
    
var
    diametro, radio, perimetro: real;
    
begin
    readln(diametro);
    radio := diametro / 2;
    perimetro := 2 * pi * radio;
    write ('El perimetro del circulo es ', perimetro:5:2);
end.