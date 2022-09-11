{3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción, 2: aventura, 
3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. 
Implementar un programa modularizado que:
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código de género, en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de la película -1. 
b. Una vez almacenada la información, genere un vector que guarde, para cada género, el código de película con mayor puntaje obtenido entre todas las críticas.
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos métodos vistos en la teoría. 
d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el código de película con menor puntaje.}

program ejercicio3_practica1;

type
	codeGenero = 1..8;

	pelicula = record
		code: integer;
		genero: codeGenero;
		puntaje: real;
	end;

	lista = ^nodo;
	nodo = record
		dato: pelicula;
		sig: lista;
	end;
	
	vectorListas = array [codeGenero] of lista;

	vectorMax = array [codeGenero] of pelicula;
{MODULOS}

{a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código de género, en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de la película -1. }
procedure cargarPelicula (var p: pelicula);
begin
	write('Codigo: ');
	p.code := random (20)-1;;
	writeln(p.code);
	
	if (p.code <> -1) then
	begin
		write('Genero: ');
		p.genero := random(8)+1; //Para que no sea 0, ni 9.
		writeln(p.genero);
		
		write('Puntaje: ');
		p.puntaje := random(10);
		writeln(p.puntaje:0:2);
	end;
	
	writeln;
end;

procedure inicializarListasEnNil (var v: vectorListas);
var
	i: integer;
begin
	for i := 1 to 8 do
	begin
		v[i] := nil;
	end;
end;

procedure insertarAlFinal (var l: lista; var ult: lista; p: pelicula);
var
	nue: lista;
begin
	new(nue);
	nue^.dato := p;
	
	if (l = nil) then
		l := nue
	else
		ult^.sig := nue;
	ult := nue;
end;

procedure cargarVectorPeliculas (var v: vectorListas);
var
	peli: pelicula;
	vecUlt: vectorListas;
begin
	cargarPelicula(peli);
	while (peli.code <> -1) do
	begin
		insertarAlFinal ( v[peli.genero], vecUlt[peli.genero], peli);
		cargarPelicula(peli);
	end;
end;


procedure imprimirPelicula(p: pelicula);
begin
	writeln('Codigo: ', p.code);
	writeln('Genero: ', p.genero);
	writeln('Puntaje: ', p.puntaje:0:2);
	writeln;
end;

procedure imprimirLista (l: lista);
begin
	while (l <> nil) do
	begin
		imprimirPelicula(l^.dato);
		writeln;
		l := l^.sig;
	end;
end;

procedure imprimirPeliculasPorGenero (v: vectorListas);
var
	i: integer;
begin
	writeln('IMPRIMIENDO PELICULAS...');
	for i := 1 to 8 do
	begin
		writeln('PELICULAS DE GENERO ', i);
		imprimirLista(v[i]);
		writeln;
	end;
end;

{b. Una vez almacenada la información, genere un vector que guarde, para cada género, el código de película con mayor puntaje obtenido entre todas las críticas.}
procedure maxLista (var p: pelicula; puntajeMax: real; l: lista);
begin
	while (l <> nil) do
	begin
		if (l^.dato.puntaje > puntajeMax) then
		begin
			puntajeMax := l^.dato.puntaje;
			p := l^.dato;
		end;
		l:=l^.sig;
	end;
end;

procedure calcularMaximo (var v: vectorListas; var vMax: vectorMax);
var
	PuntajeMax: real;
	i: integer;
begin
	for i := 1 to 8 do
	begin
		//writeln('Codigo : ', i);
		puntajeMax := -1;
		maxLista(vMax[i], puntajeMax, v[i]);
		//vMax[i] := codeMax;	
	end;
end;

procedure imprimirVectorMaximos(v: vectorMax);
var
	i: integer;
begin
	for i := 1 to 8 do
	begin
		imprimirPelicula(v[i]);
	end;
end;


{c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos métodos vistos en la teoría.}


procedure ordenarVector (var v: vectorMax);
var
	i, j, p: integer;
	aux: pelicula;
begin
	for i:= 1 to 7 do
	begin
		p := i;
		for j := i+1 to 8 do
		begin
			if (v[p].puntaje > v[j].puntaje) then
				p := j;
		end;
		
		aux := v[p];
		v[p]:= v[i];
		v[i] := aux;
		
		writeln('PASO ', I);
		imprimirVectorMaximos(v);
		writeln;
		
	end;
end;

{d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el código de película con menor puntaje.}
procedure informarMejorYPeorPeli (v: vectorMax);
begin
	writeln('El codigo de pelicula de menor puntaje es: ', v[1].code);
	writeln('El codigo de pelicula de mayor puntaje es: ', v[8].code);
end;

{PROGRAMA PRINCIPAL}
var 
	v: vectorListas;
	vMax: vectorMax;
begin
	randomize;

	inicializarListasEnNil(v);
	cargarVectorPeliculas(v);
	writeln('--------------------------------------------------------');
	writeln; 
	imprimirPeliculasPorGenero(v);
	
	calcularMaximo(v, vMax);
	writeln('IMPRIMIENDO MAXIMO POR GENERO...');
	imprimirVectorMaximos(vMax);
	writeln;
	
	ordenarVector (vMax);	
	writeln('IMPRIMIENDO VECTOR ORDENADO...');
	imprimirVectorMaximos(vMax);
	
	informarMejorYPeorPeli(vMax);
end.
