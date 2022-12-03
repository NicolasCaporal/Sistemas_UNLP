{ 4. Implemente un programa que lea el diámetro D de un círculo e imprima:
a. El radio (R) del círculo (la mitad del diámetro) }

program Practica0_Ejercicio4a;
var
    diametro, radio: real;
    
begin
    readln(diametro);
    radio := diametro / 2;
    write ('El radio del circulo es ', radio:2:2);
end.