{2.	Un cine posee la lista de películas que proyectará durante el mes de octubre. De cada película se conoce: código de película, código de género 
(1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. 

Implementar un programa que contenga:

a.	Un módulo que lea los datos de películas y los almacene ordenados por código de película y agrupados por código de género, en una estructura de 
datos adecuada. La lectura finaliza cuando se lee el código de película -1. 

b.	Un módulo que reciba la estructura generada en el punto a y retorne una estructura de datos donde estén todas las películas almacenadas ordenadas 
 por código de película.}
 
 program ejercicio3_practica4;
 const
	dimF = 8;
 type
	genero = 1..dimF;
 
	pelicula = record
		code: integer;
		codeG: genero;
		puntaje: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: pelicula;
		sig: lista;
	end;
	
	vector = array [genero] of lista;
	
{MODULOS}

{a.	Un módulo que lea los datos de películas y los almacene ordenados por código de película y agrupados por código de género, en una estructura de 
datos adecuada. La lectura finaliza cuando se lee el código de película -1. }

procedure inicializarListasEnNil (var v: vector);
var
	i: integer;
begin
	for i := 1 to dimF do
	begin
		v[i] := nil;
	end;
end;

procedure insertarOrdenado (var l: lista; p: pelicula);
var
	ant, act: lista;
	nue: lista;
begin
	new(nue);
	nue^.dato := p;
	
	if (l = nil) then
	begin
		l := nue;
		l^.sig := nil;
	end
	else
	begin
		act := l;
		ant := l;
		
		while ((act <> nil) and (act^.dato.code < p.code)) do
		begin
			ant := act;
			act := act^.sig;
		end;
		
		if (ant = act) then
		begin
			nue^.sig := l;
			l := nue;
		end
		else if (act <> nil) then
		begin
			ant^.sig := nue;
			nue^.sig := act;
		end
		else
		begin
			ant^.sig := nue;
			nue^.sig := nil;
		end;
	end;
end;

procedure generarPelicula (var p: pelicula);
begin
	write('Codigo: ');
	p.code := random(10)-1;
	writeln(p.code);
	if (p.code <> -1) then
	begin
		write('Genero: ');
		p.codeG := random(8)+1;
		writeln(p.codeG);
		write('Puntaje: ');
		p.puntaje := random(11);
		writeln(p.puntaje:2:2);
	end;
	writeln;
end;

procedure leerPelicula(var p: pelicula);
begin
	write('Ingese codigo: ');
	readln(p.code);
	if (p.code <> -1) then
	begin
		write('Ingrese codigo de genero: ');
		readln(p.codeG);
		write('Ingrese puntaje: ');
		readln(p.puntaje);
	end;
	writeln;
end;

procedure cargarListas (var v: vector);
var
	p: pelicula;
begin
	//leerPelicula(p);
	generarPelicula(p);
	while (p.code <> -1) do
	begin
		insertarOrdenado(v[p.codeG], p);
		//leerPelicula(p);
		generarPelicula(p);
	end;
end;

{Para imprimir el vector anterior}
procedure imprimirPelicula (p: pelicula);
begin
	writeln('Codigo: ', p.code);
	writeln('Genero: ', p.codeG);
	writeln('Puntaje: ', p.puntaje:2:2);
	writeln;
end;

procedure imprimirLista (l: lista);
begin
	while (l <> nil) do
	begin
		imprimirPelicula(l^.dato);
		l := l^.sig;
	end;
end;

procedure imprimirVector (v: vector);
var
	i: integer;
begin
	for i := 1 to dimF do
	begin
		writeln('PELICULAS DE GENERO ', i);
		imprimirLista(v[i]);
	end;
end;

{b.	Un módulo que reciba la estructura generada en el punto a y retorne una estructura de datos donde estén todas las películas almacenadas ordenadas 
 por código de película.}
 procedure minimo (var v: vector; var min: pelicula);
 var
	i: integer;
	indiceMin: integer;
 begin
	min.code := 9999;
	for i := 1 to dimF do
	begin
		if (v[i] <> nil) and (v[i]^.dato.code < min.code) then
		begin
			min := v[i]^.dato;
			indiceMin := i; 
		end;
	end;
	if (min.code <> 9999) then
		v[indiceMin] := v[indiceMin]^.sig;
 end;

procedure agregarAlFinal (var l: lista; var ult: lista; p: pelicula);
var
	nue: lista;
begin
	new (nue);
	nue^.dato := p;
	if (l = nil) then
		l := nue
	else
		ult^.sig:=nue;
	ult := nue;
	
end;

procedure merge (v: vector; var l: lista);
var
	min: pelicula;
	ult: lista;
begin
	minimo(v, min);
	while (min.code <> 9999) do
	begin
		agregarAlFinal(l, ult, min); // ACAAA Te quiero licha <3
		minimo(v, min);
	end;
end;



{PROGRAMA PRINCIPAL}
var
	v: vector;
	l: lista;
begin
	randomize;

	inicializarListasEnNil(v);
	cargarListas(v);
	imprimirVector(v);
	
	merge(v, l);
	writeln('IMPRIMIENDO LISTA MERGE: ');
	imprimirLista(l);
end.



