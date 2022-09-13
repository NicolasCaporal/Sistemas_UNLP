{Un comercio necesita el procesamiento de las compras realizadas por sus clientes durante el mes
de julio de 2022. De cada compra se conoce el código de cliente, día, cantidad de productos y monto pagado.

a) Implementar un módulo que lea compras, genere y retorne una estructura adecuada para la busqueda
por codigo de cliente, donde para cada código de cliente se almacenan todas juntas sus compras
(día, cantidad de productos y monto) que realizó. La lectura finaliza con cantidad de productos 0.

b) Implementar un módulo que reciba la estructura que retorna el inciso b) y retorne todas las compras
de dicho cliente

c) Realizar un módulo recursivo que reciba la estructura que retorna el inciso b) y retorne el monto
de la compra con mayor cantidad de productos.}

program simulacroParcial;

type
	compra = record
		codigo: integer;
		dia: integer;
		cantidad: integer;
		monto: real;
	end;
		
		lista = ^nodoB;
		nodoB = record
			dato: compra;
			sig: lista;
		end;
		
		arbol =^nodo;
		nodo = record
			dato: lista;
			hi: arbol;
			hd: arbol;
		end;
		

		
{MODULOS}

{a ) Implementar  un módulo que lea compras , genere y retorne una estructura adecuada para la búsqueda por código
del cliente, donde para cada código de cliente se almacenan juntas todas sus compras (dia, cantidad de productos y
monto) que realizó.
La lectura finaliza con cantidad de productos 0. Se sugiere utilizar el modulo leerRegistro.}

procedure leerCompra (var c: compra);
begin
	Write('Codigo: ');
	c.codigo := random(20);
	writeln(c.codigo);
	write('Dia: ');
	c.dia := random(30)+1;
	writeln(c.dia);
	write('Cantidad: ');
	c.cantidad := random (50);
	writeln(c.cantidad);
	if (c.cantidad <> 0) then
	begin
		write('Monto: ');
		c.monto := random(1000);
		writeln(c.monto:2:2);
	end;
	writeln;
end;

procedure agregarAdelante (var l: lista; c: compra);
var
	nue: lista;
begin
	new(nue);
	nue^.dato := c;
	if (l = nil) then
	begin
		l := nue;
	end
	else
	begin
		nue^.sig := l;
		l := nue;
	end;
end;

procedure crearNodo (var a: arbol; c: compra);
begin
	if (a <> nil) then
	begin
		if (a^.dato^.dato.codigo = c.codigo) then
		begin
			agregarAdelante(a^.dato, c)
		end
		
		else if (a^.dato^.dato.codigo < c.codigo) then
		begin
			crearNodo(a^.hd, c)
		end
		
		else
			crearNodo(a^.hi, c)
	end
	else
	begin
		new(a);
		a^.dato:= nil;
		a^.hi := nil;
		a^.hd := nil;
		agregarAdelante(a^.dato, c)
	end;
end;

procedure crearArbol (var a: arbol);
var
	c: compra;
begin
	leerCompra(c);
	while (c.cantidad <> 0) do
	begin
		crearNodo(a, c);
		leerCompra(C);
	end;
end;

procedure imprimirCompra (c: compra);
begin
	writeln('Codigo: ', c.codigo);
	writeln('Dia: ', c.dia);
	writeln('Cantidad: ', c.cantidad);
	writeln('Monto: ', c.monto:2:2);
	writeln;
end;

procedure imprimirLista (l: lista);
begin
	while (l <> nil) do
	begin
		imprimirCompra(l^.dato);
		l := l^.sig;
	end;
end;

procedure imprimirArbol (a: arbol);
begin
	if (a <> nil) then
	begin
		imprimirArbol(a^.hi);
		imprimirLista(a^.dato);
		imprimirArbol(a^.hd);
	end;
end;

{b ) Implementar  un módulo que reciba la estructura generada en a ) y un código de cliente y retorne todas las compras
de dicho cliente.}

procedure buscarClienteArbol (a: arbol; code: integer; var l: lista);
begin
	if (a <> nil) then
	begin
		if (a^.dato^.dato.codigo = code) then
			l := a^.dato
		else if (a^.dato^.dato.codigo < code) then
			buscarClienteArbol(a^.hd, code, l)
		else
			buscarClienteArbol(a^.hi, code, l);
	end
	else
		l := nil;
end;


{c ) Realizar un módulo recursivo que reciba la estructura que retorna el inciso b ) retorne el monto de la compra con mayor cantidad de productos.}
procedure maximoLista (l: lista; var montoMax: real; var cantMax: integer);
begin
	if (l <> nil) then
	begin
		if (l^.dato.cantidad > cantMax) then
		begin
			cantMax := l^.dato.cantidad;
			montoMax := l^.dato.monto;
		maximoLista(l^.sig, montoMax, cantMax);
		end;
	end;
end;

{PROGRAMA PRINCIPAL}
var
	a: arbol;
	l: lista;
	code: integer;
	max: real;
	cantMax: integer;
begin	
	randomize;

	a := nil;
	writeln('INGRESANDO DATOS...');
	crearArbol(A);
	
	writeln('IMPRIMIENDO ARBOL');
	imprimirArbol(a);
	
	write('Ingrese codigo de cliente a buscar: ');
	readln(code);
	buscarClienteArbol(a, code, l);
	Writeln('Imprimiendo lista cliente de codigo ', code);
	imprimirLista(l);
	
	max := -9999;
	cantMax := -9999;
	maximoLista(l, max, cantMax);
	writeln('MONTO DE LA COMPRA DE MAYOR CANTIDAD: ', max:2:2);
end.
