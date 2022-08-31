{3.- Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y menores a 100. Finalizar con el número 0.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista. 
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista. 
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario. }

program ejercicio1_Practica2;

type
	lista = ^nodo;
	nodo = record
		dato: integer;
		sig: lista;
	end;

procedure agregarAtras (var l: lista; var ult: lista; num: integer);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= num;
	if (l = nil) then
		l := nue
	else
		ult^.sig := nue;
	ult := nue;
	
end;

{a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y menores a 100. Finalizar con el número 0.}
procedure generarNumAleatorio(var l: lista; var ult: lista);
var
	n: integer;
begin
	n := Random(10);
	if (n <> 0) then
	begin
		agregarAtras(l, ult, n);
		generarNumAleatorio(l, ult);
	end;
end;

procedure imprimirLista (l: lista);
begin
	writeln('IMPRIMIENDO LISTA...');
	while (l <> nil) do
	begin
		writeln(l^.dato);
		l := l^.sig;
	end;
end;

{b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista. }
function buscarMinimo(min: integer; l: lista): integer;
begin
	if (l <> nil) then
	begin
		if (l^.dato < min) then
			min := l^.dato;
		buscarMinimo(min, l^.sig);
	end;
end;

{c. Implemente un módulo recursivo que devuelva el máximo valor de la lista. }
function buscarMaximo (max: integer; l: lista): integer;
begin
	if (l <> nil) then
	begin
		if (l^.dato > max) then
			max := l^.dato;
		buscarMaximo(max, l^.sig);
	end;
end;

{d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario. }
function buscarN (var aux: boolean; n: integer; l: lista): boolean;
begin
	if (l <> nil) then
	begin
		//writeln('ENTRO A LA FUNCION: N ES ', N, ' Y EL ACTUAL ES ', L^.DATO);
		if (n = l^.dato)then
		begin
			//writeln('SON IGUALES');
			aux:= true;
			//writeln('AUX: ', aux);
		end
		else
		begin
			//WRITELN('NO SON IGUALES');
			aux := false;
			buscarN(aux, n, l^.sig);
			//writeln('AUX: ', aux);
		end;
	end;
	buscarN := aux;
end;

var
	l, ult: lista;
	min, max: integer;
	n: integer;
	aux: boolean;
begin
	randomize;
	l:=nil;
	generarNumAleatorio(l, ult);
	
	imprimirLista(l); 
	
	min := l^.dato;
	max := l^.dato;
	writeln('EL MINIMO ES: ', buscarMinimo(min, l));
	writeln('EL MAXIMO ES: ', buscarMaximo(max, l));
	
	aux := false;
	write('INGRESE EL VALOR A BUSCAR: ');
	readln(n);
	writeln(BuscarN(aux, n, l));
end. 
