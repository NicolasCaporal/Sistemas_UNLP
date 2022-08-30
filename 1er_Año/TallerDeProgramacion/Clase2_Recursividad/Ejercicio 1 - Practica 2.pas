{1.- Implementar un programa que invoque a los siguientes módulos.

a. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y los almacene en un vector con dimensión física igual a 10.

b. Implementar un módulo que imprima el contenido del vector.

c. Implementar un módulo recursivo que imprima el contenido del vector.

d. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne la cantidad de caracteres leídos. 
El programa debe informar el valor retornado.

e. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne una lista con los caracteres leídos.
 
f. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en el mismo orden que están almacenados.

g. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en orden inverso al que están almacenados.}

program Practica2_Ejercicio1;

type
	vectorDeChars = array [1..10] of char;

	lista = ^nodo;
	nodo = record
		dato: char;
		sig: lista;
	end;

{a. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y los almacene en un vector con dimensión física igual a 10.}
procedure leerCaracteres (var vec: vectorDeChars; var dl: integer; c: char);
begin
	if ((dl < 10) and (c <> '.')) then 
	begin
		dl := dl + 1;
		vec[dl] := c;
		write('Ingrese otro caracter: ');
		readln(c);
		leerCaracteres(vec, dl, c);
	end;
end;

{b. Implementar un módulo que imprima el contenido del vector.}
procedure imprimirVectorDeCharsITERATIVA (vec: vectorDeChars);
var
	i: integer;
begin
	writeln('IMPRIMIENDO VECTOR, ITERATIVO:');
	for i := 1 to 10 do
	begin
		writeln(vec[i]);
	end;
end;


{c. Implementar un módulo recursivo que imprima el contenido del vector.}
procedure imprimirVectorDeCharsRECURSIVA (n: integer; dl: integer; vec: vectorDeChars);
begin
	if (n <= dl) then
	begin
		writeln(vec[n]);
		n := n+1;
		imprimirVectorDeCharsRECURSIVA(n, dl, vec); 
	end;
end;

{d. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne la cantidad de caracteres leídos. El programa debe informar el valor retornado.}
function leerSecuenciaYRetornarCant (var contador: integer): integer;
var
	c: char;
begin
	readln(c);
	if (c = '.') then
		leerSecuenciaYRetornarCant := contador
	else
	begin
		contador := contador+1;
		leerSecuenciaYRetornarCant(contador);
	end;
end;

{e. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne una lista con los caracteres leídos.}
procedure leerCharsYCrearLista (c: char; var l: lista);
var

	nue: lista;

begin
	new(nue);
	nue^.dato := c;

	if (c <> '.') then
	begin
		if (l = nil) then
		begin
			l := nue;
			readln(c);
			leerCharsYCrearLista(c, l);
		end
		else
		begin
			nue^.sig := l;
			l := nue;
			readln(c);
			leerCharsYCrearLista(c, l);
		end;
	end;		
end;


{f. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en el mismo orden que están almacenados.}
procedure imprimirListaEnOrden (l: lista); 
begin
	if (l <> nil) then
	begin
		writeln(l^.dato);
		l := l^.sig;
		imprimirListaEnOrden(l);
	end;
end;

{g. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en orden inverso al que están almacenados.}
procedure imprimirListAlReves (c: char; l: lista; aux: lista);

begin
	if (l <> nil) then
	begin
		c := l^.dato;
		aux := l;
		l := l^.sig;
		imprimirListAlReves(c, l, aux);
	end;
	writeln(c);
end;

{PROGRAMA PRINCIPAL}
var
	c: char;
	dl: integer;
	vec: vectorDeChars;
	n: integer;
	contador: integer;
	l: lista;
	aux: lista;
	
begin
	writeln('PUNTO A: Implementar un modulo recursivo que permita leer una secuencia de caracteres terminada en punto y los almacene en un vector con dimension fisica igual a 10.');
	n:= 1;
	dl := 0;
	write('Ingrese un caracter :');
	readln(c);
	leerCaracteres(vec, dl, c);
	
	writeln;
	writeln('PUNTO B: b. Implementar un modulo que imprima el contenido del vector.');
	imprimirVectorDeCharsITERATIVA(vec);
	
	writeln;
	writeln('PUNTO C: Implementar un modulo recursivo que imprima el contenido del vector.');
	writeln('IMPRIMIENDO VECTOR, RECURSIVO: ');
	imprimirVectorDeCharsRECURSIVA(n, dl, vec);

	writeln;
	writeln('PUNTO D: Implementar un modulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne la cantidad de caracteres leidos. El programa debe informar el valor retornado.');
	contador := 0;
	writeln('LEER SECUENCIA DE CARACTERES, INFORMA LA CANTIDAD: ');
	leerSecuenciaYRetornarCant (contador);
	writeln('SE LEYERON: ', contador, ' CARACTERES');
	
	writeln;
	writeln('PUNTO E: Implementar un modulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne una lista con los caracteres leidos.');
	l :=  nil;
	readln(c);
	leerCharsYCrearLista (c, l);
	
	writeln;
	writeln('PUNTO F: Implemente un modulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en el mismo orden que estan almacenados.');
	imprimirListaEnOrden(l);
	
	writeln;
	writeln('PUNTO G: Implemente un modulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en orden inverso al que estan almacenados.');
	aux := l;
	imprimirListAlReves (c, l, aux);
end.
