{2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de dichas oficinas. 
Implementar un programa modularizado que:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina}

program ejericio2_practica1;

const
	dimF = 30;
type
	oficina = record
		code: integer;
		dni: longint;
		valor: real;
	end;
	
	infoOficinas = array [1..dimF] of oficina;
	
{MODULOS}

{a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa el código de identificación, DNI del propietario y valor de la expensa. 
La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.}
procedure cargarOficina (var o: oficina);
begin
	o.code := random(30)-1 ;
	if (o.code <> -1) then
	begin
		o.dni := random(5000) + 10000;
		o.valor := random (5000) + 10000;
	end;
end;

procedure cargarInfoVector (var v: infoOficinas; var dimL: integer);
var
	ofi: oficina;
begin
	dimL := 0;
	cargarOficina(ofi);
	while (ofi.code <> -1) do
	begin
		dimL := dimL + 1;
		v[dimL] := ofi;
		cargarOficina(ofi);
	end;
end;

procedure imprimirOficina (o: oficina);
begin
	write(o.code, ' | ');
	write(o.dni,  ' | ');
	writeln(o.valor:2:2, ' | ');
	writeln('----------------------');
end;

procedure imprimirVector (v: infoOficinas; dimL: integer);
var
	i: integer;
begin 
	for i := 1 to dimL do
	begin
		imprimirOficina(v[i]);
		
	end;
end;


{b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina.}
procedure ordenarPorInsercion (var v: infoOficinas; dimL: integer);
var
	i, j: integer;
	actual: oficina;
begin
	for i :=  2 to dimL do
	begin
		actual := v[i];
		j := i-1;
		
		while ((j > 0) and (v[j].code > actual.code)) do
		begin
			v[j+1]:= v[j];
			j := j-1;
		end;
		v[j+1] := actual;
	end;
end;


{c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina}
procedure ordenarPorSeleccion (var v: infoOficinas; dimL: integer);
var
	i, j, p: integer; 
	aux: oficina;
begin
	for i:= 1 to dimL-1 do
	begin
		p := i;
		for j := i + 1 to dimL do
			if (v[j].code < v[p].code) then
				p := j;
	
	aux := v[p];
	v[p]:= v[i];
	v[i] := aux;
	end;
end;

{PROGRAMA PRINCIPAL}
var
	v, copia: infoOficinas;
	dimL: integer;

begin
	randomize;
	cargarInfoVector(v, dimL);
	copia := v;
	imprimirVector(v, dimL);
	writeln;
	writeln;
	
	ordenarPorInsercion(v, dimL);
	writeln('IMPRIMIENDO VECTOR ORDENADO POR INSERCION');
	imprimirVector(v, dimL);
	writeln;
	writeln;
	
	ordenarPorSeleccion(copia, dimL);
	writeln('IMPRIMIENDO VECTOR ORDENADO POR SELECCION');
	imprimirVector(copia, dimL);
	
	
end.
