{3.- Un supermercado requiere el procesamiento de sus productos. De cada producto se conoce código, rubro (1..10), stock y precio unitario. Se pide:
a)	Generar una estructura adecuada que permita agrupar los productos por rubro. A su vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo más eficiente posible. La lectura finaliza con el código de producto igual a -1..
b)	Implementar un módulo que reciba la estructura generada en a), un rubro y un código de producto y retorne si dicho código existe o no para ese rubro.
c)	Implementar un módulo que reciba la estructura generada en a), y retorne, para cada rubro, el código y stock del producto con mayor código.
d)	Implementar un módulo que reciba la estructura generada en a), dos códigos y retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores ingresados.}

program ejercicio3_practica4;

const
	dimF = 10;

type
	rangoRubro = 1..dimF;

	producto = record
		codigo: integer;
		rubro: rangoRubro;
		stock: integer;
		precio: real;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: producto;
		hi: arbol;
		hd: arbol;
	end;
	
	vector = array [rangoRubro] of arbol;


	codYStock = record
		c: integer;
		s: integer;
	end;
	
	vectorMax = array [rangoRubro] of codYStock;
	vectorCont = array [rangoRubro] of integer;

{MODULOS}

{a)	Generar una estructura adecuada que permita agrupar los productos por rubro. A su vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo más eficiente posible. La lectura finaliza con el código de producto igual a -1..}
procedure leerProducto (var p: producto);
begin
	write('Ingrese codigo: ');
	p.codigo:= random(30)-1;
	if (p.codigo <> -1) then
	begin
		writeln(p.codigo);
		write('Ingrese rubro: ');
		p.rubro := random(10)+1;
		write('Ingrese stock: ');
		p.stock := random(25);
		writeln(p.stock);
		write('Ingrese precio: ');
		p.precio := random (500);
		writeln(p.precio:2:2);
	end;
	writeln;
end;

procedure crearNodo (var a: arbol; p: producto);
begin
	if (a <> nil) then
	begin
		if (p.codigo > a^.dato.codigo) then
			crearNodo(a^.hd, p)
		else
			crearNodo(a^.hi, p);
	end
	else
	begin
		new(a);
		a^.dato := p;
		a^.hi := nil;
		a^.hd := nil;
	end;
end;

procedure inicializarVectorEnNil (var v: vector);
var
	i: integer;
begin
	for i := 1 to dimF do
		v[i] := nil;
end;

procedure cargarVector (var v: vector);
var
	p: producto;
begin
	leerProducto(p);
	while (p.codigo <> -1) do
	begin
		crearNodo(v[p.rubro], p);
		leerProducto(p);
	end;
end;

procedure imprimirProducto (p: producto);
begin
	writeln('Codigo: ', p.codigo);
	writeln('Rubro: ', p.rubro);
	writeln('Stock: ', p.stock);
	writeln('Precio: ', p.precio:2:2);
	writeln;
end;

procedure imprimirArbol (a: arbol);
begin
	if (a <> nil) then
	begin
		imprimirArbol(a^.hi);
		imprimirProducto(a^.dato);
		imprimirArbol(a^.hd);
	end;
end;

procedure imprimirVector (v: vector);
var
	i: integer;
begin
	for i := 1 to dimF do
	begin
		writeln('PRODUCTOS DE RUBRO ', i);
		imprimirArbol(v[i]);
	end;
end;


{b)	Implementar un módulo que reciba la estructura generada en a), un rubro y un código de producto y retorne si dicho código existe o no para ese rubro.}
function buscarEnArbol (a: arbol; code: integer): boolean;
begin
	if (a <> nil) then
	begin
		if (a^.dato.codigo < code) then
			buscarEnArbol := buscarEnArbol(a^.hd, code)
		else if (a^.dato.codigo > code) then
			buscarEnArbol:= buscarEnArbol(a^.hi, code)
		else if (code = a^.dato.codigo) then
			buscarEnArbol := true;
	end
	else
		buscarEnArbol:=false;
end;

function buscarVector (v: vector; rubro: rangoRubro; codigo: integer): boolean;
begin
	buscarVector := buscarEnArbol(v[rubro], codigo);
end;

{c)	Implementar un módulo que reciba la estructura generada en a), y retorne, para cada rubro, el código y stock del producto con mayor código.}
procedure maximoArbol (var max: codYStock; a: arbol);
begin
	if (a <> nil) then
	begin
		if (a^.dato.codigo > max.c) then
		begin
			max.c := a^.dato.codigo;
			max.s := a^.dato.stock;
		end;
		maximoArbol(max, a^.hd);
	end;
end;

procedure maximoVector (v: vector; var vMax: vectorMax);
var
	i: integer;
	max: codYStock;
begin

	for i := 1 to dimF do
	begin
		max.c := -1;
		max.s := -1;
		maximoArbol(max, v[i]);
		vMax[i] := max;
	end;
end;

procedure imprimirCodigoYStock (c: codYStock);
begin
	writeln('Codigo: ', c.c);
	writeln('Stock: ', c.s);
	writeln;
end;

procedure imprimirVector (v: vectorMax; i: integer);
begin
	if (i < dimF) then
	begin
		writeln('Maximo para el rubro ', i);
		imprimirCodigoYStock(v[i]);
		imprimirVector(v, i+1);
	end;
end;

{d)	Implementar un módulo que reciba la estructura generada en a), dos códigos y retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores ingresados.}
function contarEnRango (a: arbol; limInf, limSup: integer): integer;
var
	suma: integer;
begin
	suma := 0;
	if (a <> nil) then
	begin
		if (a^.dato.codigo < limInf) then
			suma := contarEnRango(a^.hd, limInf, limSup)
		else if (a^.dato.codigo > limSup) then
			suma := contarEnRango(a^.hi, limInf, limSup)
		else
		begin
			suma := 1;
			suma := suma + contarEnRango(a^.hi, limInf, limSup);
			suma := suma +contarEnRango(a^.hd, limInf, limSup);
		end;
	end;
	
	contarEnRango := suma;
end;

procedure contarVector (v: vector; limInf, limSup: integer; var vC: vectorCont);
var
	i: integer;
begin
	for i := 1 to dimF do
	begin
		vC[i] := (contarEnRango(v[i], limInf, limSup));
	end;
end;

procedure imprimirVectorInteger (v: vectorCont);
var
	i: integer;
begin
	for i := 1 to dimF do
	begin
		writeln('Cantidad en el rango para el rubro: ', i , ': ', v[i]);
	end;
end;

{PROGRAMA PRINCIPAL}
var
	v: vector;
	rubroB: rangoRubro;
	codigoB: integer;
	vMax: vectorMax;
	vCont: vectorCont;
	limSup, limInf: integer;
begin
	randomize;
	
	
	inicializarVectorEnNil(v);
	cargarVector(v);
	imprimirVector(v);
	
	write('Ingrese el rubro en el que desea buscar: ');
	readln(rubroB);
	write('Ingrese codigo a buscar: ');
	readln(codigoB);
	writeln(buscarVector(v, rubroB, codigoB));
	writeln;
	
	
	maximoVector(v, vMax);
	imprimirVector(vMax, 1);
	writeln;
	
	write('LimSup: ');
	readln(limsup);
	write('LimInf: ');
	readln(limInf);
	contarVector(v, limInf, limSup, vCont);
	imprimirVectorInteger(vCont);
end.
