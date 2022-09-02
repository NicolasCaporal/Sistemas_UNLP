{6- Realizar un programa que lea números y que utilice un procedimiento recursivo que escriba el equivalente en binario de un número decimal. 
El programa termina cuando el usuario ingresa el número 0 (cero). 

Ayuda:  Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2. 
¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.}

program ejercicio6_practica2;

procedure pasarABinario (n: integer);
begin
	if (n > 0) then
	begin
		pasarABinario( n div 2);
		write(n mod 2);
	end;
end;



var
	n: integer;
begin
	write('DECIMAL: ');
	readln(n);
	while (n <> 0) do
	begin
		write('BINARIO: ');
		pasarABinario(n);
		writeln;
		write('DECIMAL: ');
		readln(n);
	end;
end.

