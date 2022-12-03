{ 5. Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo
cantidades iguales entre todos los clientes. Los que le sobren se los quedará para él.

b. Imprima en pantalla el dinero que deberá cobrar el kiosquero si cada caramelo
tiene un valor de $1.60, }

program Practica0_Ejercicio5b;
var 
    caramelos: integer;
    precio: real;
    
begin
  write('¿Cuantos caramelos vendio? ');
  readln(caramelos);
  
  precio := caramelos * 1.60;
  writeln('Deberá cobrar ', precio:5:2);
end.