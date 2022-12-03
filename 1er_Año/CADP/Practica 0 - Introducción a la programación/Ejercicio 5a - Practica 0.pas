{ 5. Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo
cantidades iguales entre todos los clientes. Los que le sobren se los quedará para él.

a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X),
la cantidad de clientes (Y), e imprima en pantalla un mensaje informando la
cantidad de caramelos que le corresponderá a cada cliente, y la cantidad de
caramelos que se quedará para sí mismo. }

program Practica0_Ejercicio5a;
var
    caramelos,clientes:integer;
    
begin
  readln(caramelos);
  readln(clientes);
  
  writeln('Le corresponden ', caramelos DIV clientes, ' a cada uno');
  writeln('El kiosquero se queda con ', caramelos MOD clientes, ' caramelos');
end.