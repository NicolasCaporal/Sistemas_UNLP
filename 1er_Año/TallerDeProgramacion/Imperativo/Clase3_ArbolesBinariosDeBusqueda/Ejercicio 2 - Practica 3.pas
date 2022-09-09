{2.	Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de producto 0. Un producto puede estar en 
más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo del árbol debe contener el código de producto y la cantidad total vendida. Nota: El módulo debe retornar los dos árboles.
b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.
c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.}

program ejercicio2_practica3;

type

	fecha = record
		dia: integer;
		mes: integer;
		anio: integer;
	end;
	
	venta = record
		code: integer;
		f: fecha;
		cant: integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: venta;
		hi: arbol;
		hd: arbol;
	end;
	
	producto = record
		code: integer;
		cant: integer;
	end;
	
	arbol2 = ^nodo2;
	nodo2 = record
		dato: producto;
		hi: arbol2;
		hd: arbol2;
	end;
	
	
{MODULOS}

{a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de producto 0. Un producto puede estar en más de una venta.}
procedure leerFecha (var f: fecha);
begin
	write('Ingrese dia: ');
	readln(f.dia);
	write('Ingrese mes: ');
	readln(f.mes);
	write('Ingrese anio: ');
	readln(f.anio);
end;

procedure leerVenta (var v: venta);
begin
	write('Ingrese codigo: ');
	readln(v.code);
	if  (v.code <> 0) then
	begin
		leerFecha(v.f);
		write('Ingrese cantidad: ');
		readln(v.cant);
	end;
	writeln;
end;

{i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto.}
procedure crearNodo (var a: arbol; v: venta);
begin
	if (a = nil) then
	begin
		new(a);
		a^.dato := v;
		a^.hi := nil;
		a^.hd := nil;
	end
	else
	begin
		if (v.code < a^.dato.code) then
			crearNodo (a^.hi, v)
		else
			crearNodo (a^.hd, v);
	end;
end;

{ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo del árbol debe contener el código de producto y la cantidad total vendida. 
Nota: El módulo debe retornar los dos árboles.}
procedure crearNodo2 (var a: arbol2; v: venta);
begin
	if (a = nil) then 
	begin
		new(a);
		a^.dato.code := v.code;
		a^.dato.cant := v.cant;
		a^.hi := nil;
		a^.hd := nil;
	end
	
	else if (a^.dato.code = v.code) then
	begin
		a^.dato.cant := a^.dato.cant + v.cant;
	end
	
	else
	begin
		if (v.code < a^.dato.code) then
			crearNodo2 (a^.hi, v)
		else
			crearNodo2 (a^.hd, v);
	end;
end;

procedure crearArboles (var a: arbol; var a2: arbol2);
var
	v: venta;
begin
	leerVenta(v);
	while (v.code <> 0) do
	begin
		crearNodo(a, v);
		crearNodo2(a2, v);
		leerVenta(v);
	end;
end;


procedure imprimirVenta(v: venta);
begin
	writeln('Code: ', v.code);
	writeln('Fecha: ', v.f.dia, '/', v.f.mes , '/', v.f.anio);
	writeln('Cantidad vendidos: ', v.cant);
	writeln;
end;

procedure imprimirArbol (a: arbol);
begin
	if (a <> nil) then
	begin
		imprimirArbol(a^.hi);
		imprimirVenta(a^.dato);
		imprimirArbol(a^.hd);
	end;
end;

procedure imprimirProducto(p: producto);
begin
	writeln('Codigo de producto: ', p.code);
	writeln('Cantidad vendida: ', p.cant);
	writeln;
end;

procedure imprimirArbol2 (a: arbol2);
begin
	if (a <> nil) then
	begin
		imprimirArbol2(a^.hi);
		imprimirProducto(a^.dato);
		imprimirArbol2(a^.hd);
	end;
end;

{b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.}
procedure contarCant (var suma: integer; a: arbol; code: integer);
begin
	if (a <> nil) then
	begin
		//writeln('Paso por: ', a^.dato.code);
		if (a^.dato.code < code) then
			contarCant(suma, a^.hd, code)
		else if (a^.dato.code > code) then
			contarCant(suma, a^.hi, code)
		else
		begin
			suma := suma + a^.dato.cant;
			//writeln('Suma: ', suma);
			contarCant(suma, a^.hi, code);
			contarCant(suma, a^.hd, code);
		end;
	end;
end; 


{c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.}
function devolverCant (a: arbol2; code: integer): integer;
begin
	if (a <> nil) then
	begin
		if (a^.dato.code < code) then
			devolverCant(a^.hd, code)
		else if (a^.dato.code > code) then
			devolverCant(a^.hi, code);
	end;
	
			
	if ((a <> nil) and (a^.dato.code = code)) then
		devolverCant := a^.dato.cant
	else
		devolverCant := 0; 
end;

{PROGRAMA PRINCIPAL}
var
	a: arbol;
	a2: arbol2;
	
	suma: integer;
	codeAContar: integer;
begin
	a:=nil;
	a2:=nil;
	
	crearArboles(a, a2);
	
	writeln('IMPRIMIENDO ARBOL: ');
	imprimirArbol(a);
	
	writeln('IMPRIMIENDO ARBOL 2: ');
	imprimirArbol2(a2);
	
	suma := 0;
	write('Ingrese el codigo del que desea contar la cantidad de productos vendidos: ');
	readln(codeAContar);
	contarCant(suma, a, codeAContar);
	writeln('RTA: ', suma);
	
	
	writeln('Ingrese el codigo del que desea buscar la cantidad de productos vendidos: ');
	readln(codeAContar);
	writeln('RTA: ', devolverCant(a2, codeAContar));
end.
