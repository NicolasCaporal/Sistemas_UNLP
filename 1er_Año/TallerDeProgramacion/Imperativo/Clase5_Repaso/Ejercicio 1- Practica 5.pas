{1.- El administrador de un edificio de oficinas, cuenta en papel, con la información del pago de las expensas de dichas oficinas. 
Implementar un programa que:
a)	Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa código de identificación, DNI del propietario y valor de la expensa. 
La lectura finaliza cuando llega el código de identificación -1.
b)	Ordene el vector, aplicando uno de los métodos vistos en la cursada, para obtener el vector ordenado por código de identificación de la oficina.
c)	Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de identificación de oficina y retorne si dicho código está en el vector. En el caso de encontrarlo, se debe informar el DNI del propietario y en caso contrario informar que el código buscado no existe.
d)	Tenga un módulo recursivo que retorne el monto total de las expensas.}

program ejercicio1_practica5;
const
	dimF = 300;
type

	oficina = record
		code: integer;
		dni: longint;
		valor: real;
	end;
	
	vector = array [1..dimF] of oficina;
	
{MODULOS}

{a)	Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa código de identificación, DNI del propietario y valor de la expensa. La lectura finaliza cuando llega el código de identificación -1.}
procedure cargarOficina (var o: oficina);
begin
	write('Codigo: ');
	o.code := random(3)-1;
	writeln(o.code);
	if (o.code <> -1) then
	begin
		o.dni := random(50000);
		writeln('DNI: ', o.dni);
		o.valor := random(10000);
		writeln('Valor: ', o.valor:2:2);
	end;
	writeln;
end;

procedure cargarVector (var v: vector; var dimL: integer);
var
	o: oficina;
begin
	dimL := 0;
	cargarOficina(o);
	while ((dimL < dimF) and (o.code <> -1)) do
	begin
		dimL := dimL + 1;
		v[dimL] := o;
		cargarOficina(o);
	end;
end;

{b)	Ordene el vector, aplicando uno de los métodos vistos en la cursada, para obtener el vector ordenado por código de identificación de la oficina.}
procedure ordenarVector (var v: vector; dimL: integer);
var
	i, j, p: integer;
	aux: oficina;
begin
	for i := 1 to dimL - 1 do
	begin
		p := i;
		for j := i+1 to dimL do
		begin
			if (v[j].code < v[p].code) then
				p := j;
		end;
		
	aux := v[p];
	v[p]:=v[i];
	v[i] := aux;
		
	end;
end;

procedure imprimirOficina (o: oficina);
begin
	writeln('Codigo: ', o.code);
	writeln('DNI: ', o.dni);
	writeln('Valor: ', o.valor:2:2);
	writeln;
end;

procedure imprimirVectorRecursivo (v: vector; dimL: integer; i: integer);
begin
	if (i <= dimL) then
	begin
		imprimirOficina(v[i]);
		imprimirVectorRecursivo(v, dimL, i+1);
	end;
end;

{c)	Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de identificación de oficina y retorne si dicho código está en el vector. 
En el caso de encontrarlo, se debe informar el DNI del propietario y en caso contrario informar que el código buscado no existe.}
procedure busquedaDicotomica (v: vector; ini, fin: integer; var pos: integer; codigo: integer);
begin
	if ((ini <> fin) and (fin > ini)) then
	begin
		if (v[pos].code = codigo) then
		begin
			ini := pos;
			fin := pos;
		end
		else if (v[pos].code > codigo) then
			fin := pos - 1
		else
			ini := pos + 1;
		pos := (ini + fin) DIV 2;
		
		busquedaDicotomica(v, ini, fin, pos, codigo);
	end
	else
		if (v[pos].code <> codigo) then
			pos := -1;
end;

procedure buscarDNI (V: vector; dl: integer; c: integer);
var
	ini, fin: integer;
	pos: integer;
begin
	ini := 1;
	fin := dL;
	pos := dl DIV 2;
	busquedaDicotomica(v, ini, fin, pos, c);
	if (pos = -1) then
		writeln('No se encontro')
	else
		writeln('DNI DEL PROPIETARIO: ', V[pos].dni);
end;


{d)	Tenga un módulo recursivo que retorne el monto total de las expensas.}
procedure totalExpensas (v: vector; dL: integer; i: integer; var suma: real);
begin
	if (i <= dL) then
	begin
		suma := suma + v[i].valor;
		totalExpensas(v, dL, i+1, suma);
	end;
end;

{PROGRAMA PRINCIPAL}
var
	v: vector;
	dL: integer;
	c: integer;
	i: integer;
	suma: real;
	
begin
	randomize;
	
	cargarVector(v, dL);
	writeln('IMPRIMIENDO VECTOR...');
	imprimirVectorRecursivo(v, dl, 1);
	
	ordenarVector(v, dL);
	writeln('IMPRIMIENDO VECTOR ORDENADO...');
	imprimirVectorRecursivo(v, dl, 1);
	
	writeln('Ingrese codigo a buscar: ');
	readln(c);
	buscarDNI(v, dl, c);
	
	suma:=0;
	i := 1;
	totalExpensas (v, dL, i, suma);
	writeln('SUMA TOTAL EXPENSAS: ', suma:2:2);
	
end.

		
