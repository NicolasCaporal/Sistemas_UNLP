{4.- Una librería requiere el procesamiento de la información de sus productos. De cada producto se conoce el código del producto, código de rubro (del 1 al 8) y precio. 

Implementar un programa modularizado que:

a. Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos 
finaliza cuando se lee el precio 0.

b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
 
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos 
del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto. 

d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos métodos vistos en la teoría. 

e. Muestre los precios del vector ordenado.}

program ejercicio4_practica1;

const
	dimF = 8;
	cantProd = 5;
	
type

	codeRubro = 1..dimF;
	
	producto = record
		code: integer;
		rubro: codeRubro;
		precio: real;
	end;
	
	arbol= ^nodo;
	nodo = record
		dato: producto;
		hi: arbol;
		hd: arbol;
	end;
	
	vectorDeArboles = array [codeRubro] of arbol;
	
	vectorProdRubro3 = array [1..cantProd] of producto;
	
{MODULOS}

{a. Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos 
finaliza cuando se lee el precio 0.}

procedure leerProducto (var p: producto);
begin
	write('Ingrese codigo: ');
	readln(p.code);
	write('Ingrese codigo de rubro: ');
	readln(p.rubro);
	write('Ingrese precio: ');
	readln(p.precio);
	writeln;
end;

procedure crearNodo (var a: arbol; p: producto);
begin
	if (a = nil) then
	begin
		new(a);
		a^.dato := p;
		a^.hi := nil;
		a^.hd := nil;
	end
	else
	begin
		if (a^.dato.code > p.code) then
			crearNodo(a^.hi, p)
		else
			crearNodo(a^.hd, p);
	end;
end;

procedure cargarVector (var v: vectorDeArboles);
var
	p: producto;
begin
	leerProducto (p);
	while (p.precio <> 0) do
	begin
		crearNodo(v[p.rubro], p);
		leerProducto(P);
	end;
end;

procedure inicializarArbolesEnNil (var v: vectorDeArboles);
var
	i: integer;
begin
	for i := 1 to dimF do 
		v[i] := nil;
end;


{b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.} 
procedure informarProducto (p: producto);
begin
	writeln('Codigo: ', p.code); //Yo muestro todo para chequear que ande todo bien, pero hay que mostrar solo codigos
	writeln('Rubro: ', p.rubro);
	writeln('Precio: ', p.precio:2:2);
	writeln;
end;


procedure imprimirArbol (a: arbol);
begin
	if (a <> nil) then
	begin
		imprimirArbol(a^.hi);
		informarProducto(a^.dato);
		imprimirArbol(a^.hd);
	end;
end;


procedure imprimirVector (v: vectorDeArboles);
var
	i: integer;
begin
	for i := 1 to dimF do
	begin
		writeln('PRODUCTOS DE RUBRO ', i);
		imprimirArbol(v[i]);
		writeln;
	end;
end;


{c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos 
del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto. }

procedure cargarVectorProductos (var v: vectorProdRubro3; var dl: integer; a: arbol);
begin
	if ((a <> nil) and (dl < cantProd)) then
	begin
		cargarVectorProductos(v, dl, a^.hi);
		if (dl < cantProd) then
		begin
			dl:= dl + 1;
			v[dl] := a^.dato;
		end;
		cargarVectorProductos(v, dl, a^.hd);	
	end
end;

procedure imprimirVectorProductos(v: vectorProdRubro3; dl: integer);
var
	i: integer;
begin
	for i := 1 to cantProd do
	begin
		informarProducto(v[i]);
	end;
end;


{d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos métodos vistos en la teoría. }
procedure ordenarVectorProductos (var v: vectorProdRubro3; dl: integer);
var
	i, j, p: integer;
	aux: producto;
begin
	for i := 1 to dl - 1 do
	begin
		p := i;
		for j := i + 1 to dl do
			if (v[p].precio > v[j].precio) then
				p := j;
				
		aux := v[p];
		v[p] := v[i];
		v[i]:= aux;
	end;
end;


{e. Muestre los precios del vector ordenado.}
procedure mostrarPrecio (v: vectorProdRubro3; dl: integer);
var
	i: integer;
begin
	for i := 1 to dl do
	begin
		//informarProducto(v[i]);
		writeln('Precio producto codigo ', v[i].code, ': ', v[i].precio:2:2);
	end;
end;

{PROGRAMA PRINCIPAL}
var
	v: vectorDeArboles;
	vecProd: vectorProdRubro3;
	dl: integer;
	
begin
	inicializarArbolesEnNil(v);
	cargarVector (v);
	imprimirVector(v);
	
	dl := 0;
	cargarVectorProductos(vecProd, dl, v[3]);
	writeln('Dimension logica: ', dl);
	WRITELN('Imprimiendo vector de productos ordenado por codigo');
	imprimirVectorProductos (vecProd, dl);
	
	ordenarVectorProductos(vecProd, dl);
	writeln('Imprmiendo vector ordenado por precio');
	mostrarPrecio (vecProd, dl);
end.
