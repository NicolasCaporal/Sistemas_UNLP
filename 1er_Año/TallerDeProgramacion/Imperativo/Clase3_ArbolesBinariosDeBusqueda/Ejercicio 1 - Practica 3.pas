{1.	Escribir un programa que:
a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como parámetro y que : 
i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que retorne dicho valor.
ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo recursivo que retorne dicho socio.
iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que retorne dicho valor.
iv. Aumente en 1 la edad de todos los socios.
v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.
viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo número de socio se encuentra entre los dos valores ingresados. Debe invocar a un módulo recursivo que reciba los dos valores leídos y retorne dicha cantidad.
x. Informe los números de socio en orden creciente. 
xi. Informe los números de socio pares en orden decreciente}

program Ejercicio1_Practica3;
type

	socio = record
		nro: integer;
		nombre: string;
		edad: integer;
	end;

	arbol = ^nodo;
	nodo = record
		dato: socio;
		HI: arbol;
		HD: arbol;
	end;

{MODULOS}

{a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza con el número de socio 0 y el árbol debe quedar ordenado por número de socio.}
procedure crearNodo (var a: arbol; s: socio);
begin
	if (a = nil) then
	begin
		new(a);
		a^.dato := s ;
		a^.hi := nil;
		a^.hd := nil;
	end
	else
	begin
		if (s.nro < a^.dato.nro) then
			crearNodo(a^.HI, s)
		else
			crearNodo(a^.HD, s);
	end;
end;

procedure leerSocio (var s: socio);
begin
	write('Ingrese Nro de socio: ');
	readln(s.nro);
	if (s.nro <> 0) then
	begin
		write('Ingrese nombre: ');
		readln(s.nombre);
		write('Ingrese edad: ');
		readln(s.edad);
	end;
	writeln
end;

procedure cargarArbol (var a: arbol);
var
	s: socio;
begin
	
	leerSocio(s);
	while (s.nro <> 0) do
	begin
		crearNodo(a, s);
		leerSocio(s);
	end;
end;

procedure imprimirSocio(s: socio);
begin
	writeln('Nro de socio: ', s.nro);
	writeln('Nombre: ', s.nombre);
	writeln('Edad: ', s.edad);
	writeln;
end;

{b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como parámetro y que :}
{i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que retorne dicho valor.}
procedure informarNroMaximo (a: arbol; var max: integer);
begin
	if (a <> nil) then
	begin
		if (a^.dato.nro > max) then
			max := a^.dato.nro;
		informarNroMaximo(a^.hd, max);
	end
	else
		writeln('EL NRO DE SOCIO MAS GRANDE ES: ', max);
end; 

{ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo recursivo que retorne dicho socio.}
procedure informarSocioMinimo (a: arbol; var min: integer; var socioMin: socio); //¿Tengo que almacenar el registro entero como minimo, o solo almacenar el minimo y luego buscar?
begin
	if (a <> nil) then
	begin
		if (a^.dato.nro < min) then
		begin
			min := a^.dato.nro;
			socioMin := a^.dato;
		end;
		informarSocioMinimo(a^.hi, min, socioMin);
	end
	else
	begin
		writeln('DATOS DE LA PERSONA CON NRO DE SOCIO MAS CHICO: ');
		imprimirSocio(socioMin);
	end;
end;


{iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que retorne dicho valor.}

procedure informarEdadMaximo (a: arbol; var maxE: integer; var maxNro: integer);
begin
	if ((a <> nil) and (a^.dato.edad > maxE)) then
	begin
		maxE := a^.dato.edad;
		maxNro := a^.dato.nro;
	end;
	if (a <> nil) then
	begin
		informarEdadMaximo(a^.hi, maxE, maxNro);
		informarEdadMaximo(a^.hd, maxE, maxNro);
	end;
end;

{iv. Aumente en 1 la edad de todos los socios.}
procedure sumarUnoA1aEdad (a: arbol);
begin
	if (a <> nil) then
	begin
		sumarUnoA1aEdad(a^.hi);
		a^.dato.edad := a^.dato.edad + 1;
		sumarUnoA1aEdad(a^.hd);
	end;
end;

{v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un módulo recursivo que reciba el valor leído y retorne verdadero o falso.}
function existeSocio (a: arbol; n: integer): boolean;
begin
	if (a <> nil) then
	begin
		if (a^.dato.nro = n) then
			existeSocio := true
		else
			existeSocio := (existeSocio(a^.hi, n) or existeSocio(a^.hd, n));
	end
	else
		existeSocio := false;
end;

{vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.}
function existeNombre (a: arbol; nom: string): boolean;
begin
	if (a <> nil) then
	begin
		if (a^.dato.nombre = nom) then
			existeNombre := true
		else
			existeNombre := (existeNombre(a^.hi, nom) or existeNombre(a^.hd, nom));
	end
	else 
		existeNombre:= false;
end;

{vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.}
function contarCantSocios (a: arbol): integer;
var
	contador: integer;
begin
	contador := 0;
	if (a <> nil) then
	begin
		contador := contador + 1;
		contador:= contador + contarCantSocios(a^.hi);
		contador := contador + contarCantSocios(a^.hd);
	end;
	
	contarCantSocios := contador;
end;

{viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.}
function sumarEdades (a: arbol): integer;
var
	suma: integer;
begin
	suma := 0;
	if (a <> nil) then
	begin
		suma := a^.dato.edad;
		suma := suma + sumarEdades(a^.hi);
		suma := suma + sumarEdades(a^.hd);
	end;
	
	sumarEdades := suma;
end;

function promedioDeEdad (a: arbol): real;
begin
	promedioDeEdad := (sumarEdades(a) / contarCantSocios(a));
end;

{ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo número de socio se encuentra entre los dos valores ingresados. Debe invocar a un módulo recursivo que reciba los dos valores leídos y retorne dicha cantidad.}
function cantEntreLimInfyLimSup (LimInf: integer; LimSup: integer; a: arbol): integer;
var
	suma: integer;
begin
	suma:= 0;
	if (a <> nil) then
	begin
		writeln('PASO POR: ' , a^.dato.nro);
		if(a^.dato.nro < LimInf) then
		begin
			suma := cantEntreLimInfyLimSup(LimInf, LimSup, a^.HD);
		end
		else if(a^.dato.nro > LimSup) then
		begin
			suma := cantEntreLimInfyLimSup(LimInf, LimSup, a^.HI);
		end
		else 
		begin
			suma := 1;
			suma := suma + cantEntreLimInfyLimSup(LimInf, LimSup, a^.HI);
			suma := suma + cantEntreLimInfyLimSup(LimInf, LimSup, a^.HD);
		end;
	end;
	
	cantEntreLimInfyLimSup := suma;
end;

{x. Informe los números de socio en orden creciente. }
procedure imprimirArbol (a: arbol);
begin
	if (a <> nil) then
	begin
		imprimirArbol(a^.hi);
		imprimirSocio(a^.dato);
		imprimirArbol(a^.hd);
	end
end;

{xi. Informe los números de socio pares en orden decreciente}
procedure imprimirParesMayorAMenor (a: arbol);
begin
	if (a <> nil) then
	begin
		imprimirParesMayorAMenor(a^.hd);
		if (a^.dato.nro mod 2 = 0) then
			writeln(a^.dato.nro);
		imprimirParesMayorAMenor(a^.hi);
	end;
end;

{PROGRAMA PRINCIPAL}
var
	a: arbol;
	
	max: integer;
	
	min: integer;
	socioMin: socio;
	
	maxEdad: integer;
	maxNroE: integer;
	
	n: integer;
	
	nom: string;
	
	limInf: integer;
	limSup: integer;
	
begin
	a := nil;
	cargarArbol(a);
	writeln('IMPRIMIENDO ARBOL...');
	imprimirArbol(a);
	
	max := -9999;
	informarNroMaximo(a, max);
	writeln;
	
	min := 9999;
	informarSocioMinimo(a, min, socioMin);
	writeln;
	
	MaxEdad := -1;
	informarEdadMaximo(a, maxEdad, maxNroE);
	writeln('CODIGO DEL SOCIO DE MAYOR EDAD: ', maxNroE);
	writeln;
	
	sumarUnoA1aEdad(a);
	writeln('IMPRIMIENDO ARBOL...');
	imprimirArbol(a);
	writeln;
	
	writeln('Ingrese numero de socio a buscar: ');
	readln(n);
	writeln(existeSocio(a, n));
	writeln;
	
	writeln('Ingrese nombre de socio a buscar: ');
	readln(nom);
	writeln(existeNombre(a, nom));
	writeln;
	
	writeln('Hay en total: ', contarCantSocios(a), ' socios');
	writeln;
	
	writeln('El promedio de edad es de: ', promedioDeEdad(a):2:2);
	writeln;
	
	writeln('Contar cantidad de socios entre dos valores');
	write('Ingrese limite inferior: ');
	readln(limInf);
	write('Ingrese limite superior: ');
	readln(limSup);
	write('La cantidad es: ', cantEntreLimInfyLimSup(limInf, limSup, a));
	writeln;
	
	writeln('IMPRIMIENDO ARBOL...');
	imprimirArbol(a);
	writeln;
	

	writeln('IMPRIMIENDO ARBOL PARES EN ORDEN DECRECIENTE...');
	imprimirParesMayorAMenor(a);
	writeln;
end.
