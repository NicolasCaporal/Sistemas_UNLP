{5.- Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el siguiente encabezado:
   	Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice); 

Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra en el vector.}

program Practica2_Ejercicio5;

const
	dimF = 10;
type
	indice = integer;
	
	vector = array [1..dimF] of integer;
	
{MODULOS}

procedure cargarVector (var v: vector);
var
	i: integer;
begin
	for i := 1 to dimF do
	begin
		v[i] := random(100);
	end;
end;

procedure imprimirVector (v: vector);
var 
	i: integer;
begin
	for i := 1 to dimF do
	begin
		if (i < 10) then
			write('0', i, ': ')
		else
			write(i, ': ');
		writeln(v[i]);
	end;
	writeln;
end;

procedure ordenarVector(var v: vector);
var
	i, j, p, num: integer;
begin
	for i := 1 to dimF-1 do //En P queda las pos del más chiquito.
	begin
		p := i;
		for j := i+1 to dimF do
			if v[j] < v[p] then
				p := j;
				
		num := v[p];
		v[p] := v[i];
		v[i] := num;
	end;
end; 

Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice); 
begin
	//writeln('POS: ', POS, ' INI: ', INI, ' FIN: ', FIN);
	if ((ini <> fin)and(ini < fin)) then
	begin
		if (v[pos] = dato) then
		begin
			ini := pos;
			fin := pos;
		end
		else if (v[pos] < dato) then
		begin
			ini := pos + 1;
		end
		else
			fin := pos - 1;
		pos := (ini + fin) DIV 2;
		
		busquedaDicotomica(v, ini, fin, dato, pos);		
	end
	else
		if (v[pos] <> dato) then
			pos := -1;
end;

{procedure ordenarVector (var v: vector);
var
	i: integer;
	i2: integer;
begin
	
end;}

{PROGRAMA PRINCIPAL}
var
	v: vector;
	ini, fin: indice;
	dato: integer;
	pos: indice;
begin
	randomize;

	cargarVector(v);
	//imprimirVector(v);
	ordenarVector(v);
	imprimirVector(v);
	
	ini :=1;
	fin := dimF;
	pos := fin div 2;
	write('Ingrese el numero que desea buscar: ');
	readln(dato);
	busquedaDicotomica(v, ini, fin, dato, pos);
	writeln('ESE DATO ESTA EN LA POSICION: ', pos);
end.
	
