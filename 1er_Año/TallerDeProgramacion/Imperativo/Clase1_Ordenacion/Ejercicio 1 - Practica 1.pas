{1.- Implementar un programa que procese la información de las ventas de productos de un comercio (como máximo 20). 
De cada venta se conoce código del producto (entre 1 y 15) y cantidad vendida (como máximo 99 unidades).  El ingreso de las ventas finaliza con el código 0 (no se procesa).
a. Almacenar la información de las ventas en un vector. El código debe generarse automáticamente (random) y la cantidad se debe leer. 
b. Mostrar el contenido del vector resultante.
c. Ordenar el vector de ventas por código.
d. Mostrar el contenido del vector resultante.
e. Eliminar del vector ordenado las ventas con código de producto entre dos valores que se ingresan como parámetros. 
f. Mostrar el contenido del vector resultante.
g. Generar una lista ordenada por código de producto de menor a mayor a partir del vector resultante del inciso e., sólo para los códigos pares.
h. Mostrar la lista resultante.}

program ejercicio1_practica1;

const
	dimF = 20;
type
	{id = 1..15;
	can = 0..99;}
	range = 0..dimF;
	
	venta = record
		code: integer;
		cant: integer;
	end;

	ventas = array [1..dimF] of venta;
	
	lista = ^nodo;
	nodo = record
		dato: venta;
		sig: lista;
	end;
	
	
{MODULOS}
{a. Almacenar la información de las ventas en un vector. El código debe generarse automáticamente (random) y la cantidad se debe leer. / El ingreso de las ventas finaliza con el código 0 (no se procesa).}
procedure cargarVenta(var v: venta);
begin
	write('Codigo: ');
	v.code := random(15);
	writeln(v.code);
	if (v.code <> 0) then
	begin
		write ('Ingrese cantidad vendida: ');
		readln(v.cant);
	end;
	writeln;
end;

procedure cargarInformacion (var v: ventas; var dimL: integer);
var
	ven: venta;
begin
	dimL:=0;
	cargarVenta(ven);
	while (ven.code <> 0) and (dimL < dimF) do
	begin
		dimL := dimL + 1;
		v[dimL] := ven;
		cargarVenta(ven);
	end;
end;

{b. Mostrar el contenido del vector resultante.}
procedure imprimirVenta (v: venta);
begin
	writeln('Codigo: ', v.code);
	writeln('Cantidad vendida: ', v.cant);
	writeln;
end;

procedure imprimirVector (v: ventas; dimL: integer);
var
	i: integer;
begin
	for i := 1 to dimL do
	begin
		imprimirVenta(v[i]);
	end;
end;


{c. Ordenar el vector de ventas por código.}
procedure ordenarVector (var v: ventas; dimL: integer);
var
	i, j, p: integer;
	item: venta;
begin
	for i:= 1 to dimL-1 do
	begin
		p := i;
		for j := i+1 to dimL do
		begin
			 if (v[j].code < v[p].code) then
				p:= j;
		end;
		item := v[p];
		v[p]:= v[i];
		v[i] := item;
	end;
end;

{e. Eliminar del vector ordenado las ventas con código de producto entre dos valores que se ingresan como parámetros. }
procedure eliminar (var v: ventas; var dimL: integer; limiteSup, limiteInf: integer);
	
	function buscarPosicionInf (v: ventas; dimL: integer; elemABuscar: integer): integer;
	var
		pos: integer;
	begin
		pos := 1;
		while ((pos <= dimL) and (elemABuscar > v[pos].code)) do
			pos := pos + 1;
		if (pos > dimL) then
			buscarPosicionInf := 0
		else
			buscarPosicionInf := pos;
	end;
	
	function buscarPosicionSup (v: ventas; dimL, pos: integer; elemABuscar: integer): integer;
	begin
		while ((pos <= dimL) and (v[pos].code <= elemABuscar)) do
			pos := pos + 1;
		if (pos > dimL) then
			buscarPosicionSup := dimL
		else
			buscarPosicionSup := pos-1;
		
	end;

var
	posInf, posSup, salto, i: integer;
begin
	posInf := buscarPosicionInf(v, dimL, limiteInf);
	if (posInf <> 0) then
	begin
		posSup := buscarPosicionSup(v, dimL, posInf, limiteSup);
			
		//writeln('PosInf: ' , posInf);
		//writeln('Posup: ', posSup);
		
		{Escribir el código correspondiente para hacer el corrimiento y disminuir la dimensión lógica}	
		salto:= posSup - posInf + 1;
		dimL := diml - salto;
		for i:= posInf to dimL do
				v[i] := v[i + salto];
				
	end;
end;

{g. Generar una lista ordenada por código de producto de menor a mayor a partir del vector resultante del inciso e., sólo para los códigos pares.}
procedure agregarAlFinal (var l: lista; var ult: lista; d: venta);
var
	nue: lista;
begin
	if (d.code MOD 2 = 0) then
	begin
		new(nue);
		nue^.dato := d;
		nue^.sig:=nil;
	
		if (l = nil) then
			l := nue
		else
			ult^.sig := nue;
		ult := nue;
	end;
end;

procedure CrearLista (var l: lista; vector: ventas; dimL: integer);
var
	ult: lista;
	i: integer;
begin
	for i := 1 to dimL do
	begin
		agregarAlFinal(l, ult, vector[i]);
	end;
end;

procedure imprimirLista (l: lista);
begin
	writeln('Imprimiendo...');
	while (l <> nil) do
	begin
		imprimirVenta(l^.dato);
		l := l^.sig;
	end;
end;

{PROGRAMA PRINCIPAL}
var
	v: ventas;
	dimL: integer;
	limSup, limInf: integer;
	l: lista;
	
begin
	
	randomize;
	cargarInformacion(v, dimL);
	imprimirVector(v, dimL);
	
	ordenarVector (v, dimL);
	writeln('VECTOR ORDENADO: ');
	imprimirVector (v, dimL);
	
	write('Ingrese num inf: ');
	readln(limInf);
	write('Ingrese num sup: ');
	readln(limSup);
	eliminar(v, dimL, limSup, limInf);
	
	writeln('IMPRIMIENDO VECTOR ELIMINADO: ');
	imprimirVector(v, dimL);
	//writeln('DL: ', dimL);
	
	l := nil;
	writeln('CREANDO LISTA DE CODIGOS PARES... ');
	CrearLista(l, v, dimL);
	imprimirLista(l);
end.
