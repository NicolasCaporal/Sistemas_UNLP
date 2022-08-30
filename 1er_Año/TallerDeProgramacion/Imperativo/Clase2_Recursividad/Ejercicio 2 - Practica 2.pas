{Realizar un programa que lea números hasta leer el valor 0 en imprima, para cada número leído, sus dígitos en el orden en que aparecen en el número.
Debe implementarse un módulo recursivo que reciba el número e imprima lo pedido, Ejemplo: si se lee el valor 256 debe imprimir 2 5 6}

program ejercicio2_practica2;

procedure imprimirDigitos (n: integer);
var
	dig: integer;
begin
	dig := n mod 10;
	if (dig <> 0) then
	begin
		n := n div 10;
		imprimirDigitos(n);
		write(dig, ' ');
	end;
end;



{PROGRAMA PRINCIPAL}
var
	n: integer;
begin
	readln(n);
	while (n <> 0) do
	begin
		imprimirDigitos(n);
		writeln;
		readln(n);
	end;
end.
