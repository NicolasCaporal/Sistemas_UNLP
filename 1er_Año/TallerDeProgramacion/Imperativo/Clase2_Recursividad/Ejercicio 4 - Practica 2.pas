{4.- Escribir un programa que:
a. Implemente un módulo recursivo que genere un vector de 20 números enteros “random” mayores a 0 y menores a 100. 
b. Implemente un módulo recursivo que devuelva el máximo valor del vector. 
c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos en el vector.}

program Ejercicio4_practica2;

const
	dimF = 20;
type
	vector = array [1..dimF] of integer;

{MODULOS}
{a. Implemente un módulo recursivo que genere un vector de 20 números enteros “random” mayores a 0 y menores a 100. }
procedure cargarVectorRecursivo (var v: vector; dL: integer);
begin
	if (dl <= dimF) then
	begin
		v[dl] := random(100);
		cargarVectorRecursivo(v, dL+1);
	end;
end;

procedure imprimirVector (v: vector);
var
	i: integer;
begin
	for i := 1 to dimF do
	begin
		if (i < 10) then
			write(0, i, ': ')
		else 
			write(i, ': ');
		writeln(v[i]);
	end;
end;

{b. Implemente un módulo recursivo que devuelva el máximo valor del vector.}
procedure maximoRecursivo (v: vector; i: integer; var max: integer);
begin
	if (i <= dimF) then
	begin
		if (v[i] > max) then
			max := v[i];
		maximoRecursivo(v, i+1, max)
	end;
end;

{c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos en el vector.}
procedure sumaVecRecursiva (v: vector; i: integer; var suma: integer);
begin
	if (i <= dimF) then
	begin
		suma := suma + v[i];
		sumaVecRecursiva(v, i+1, suma);
	end;
end;


{PROGRAMA PRINCIPAL}
var
	v: vector;
	max: integer;
	suma: integer;
begin
	randomize;
	cargarVectorRecursivo(v, 1);
	imprimirVector(v);
	
	writeln;
	max := -999;
	writeln('MAXIMO: ', maximoRecursivo(v, 1, max));
	
	writeln;
	suma := 0;
	write('SUMA: ');
	sumaVecRecursiva(v, 1, suma);
	write(suma);
end.
