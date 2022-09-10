{Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y almacene en una estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior 
al 2010. De cada alumno se lee legajo, DNI y año de ingreso. La estructura generada debe ser eficiente para la búsqueda por número de legajo. 
b. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro. 
c. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo esté comprendido entre dos valores que se reciben 
como parámetro. 
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar.}

program ejercicio3_practica3;

type
	alumno = record
		legajo: integer;
		DNI: longint;
		anio: integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: alumno;
		hi: arbol;
		hd: arbol;
	end;
	
//MODULOS
{a. Un módulo que lea información de alumnos de Taller de Programación y almacene en una estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior 
al 2010. De cada alumno se lee legajo, DNI y año de ingreso. La estructura generada debe ser eficiente para la búsqueda por número de legajo. }
procedure crearNodo (var a: arbol; alu: alumno);
begin
	if (a = nil) then
	begin
		new(a);
		a^.dato := alu;
		a^.hi := nil;
		a^.hd := nil;
	end
	else
	begin
		if (a^.dato.legajo < alu.legajo) then
			crearNodo(a^.hd, alu)
		else
			crearNodo(a^.hi, alu);
	end;
end;

procedure leerAlumno (var a: alumno);
begin
	write('Ingrese legajo: ');
	readln(a.legajo);
	if (a.legajo <> 0) then
	begin
		write('Ingrese DNI: ');
		readln(a.DNI);
		write('Ingrese anio de ingreso: ');
		readln(a.anio);
	end;
	writeln;
end;

procedure crearArbol (var a: arbol);
var
	alu: alumno;
begin
	leerAlumno(alu);
	while (alu.legajo <> 0) do
	begin
		if (alu.anio > 2010)then
			crearNodo(a, alu);
		leerAlumno(alu);
	end;
end;

procedure informarAlumno (a: alumno);
begin
	writeln('Legajo: ', a.legajo);
	writeln('DNI: ', a.dni);
	writeln('Anio: ', a.anio);
	writeln;
end;

procedure imprimirArbol (a: arbol);
begin
	if (a <> nil) then
	begin
		imprimirArbol(a^.hi);
		informarAlumno(a^.dato);
		imprimirArbol(a^.hd);
	end;
end;

{b. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.}
procedure InformarAlumnosLegajoChico (a: arbol; legajo: integer);
begin
	if (a <> nil) then
	begin
		if (a^.dato.legajo < legajo) then
		begin
			writeln('DNI: ', a^.dato.dni);
			writeln('Anio: ', a^.dato.anio);
			writeln;
			InformarAlumnosLegajoChico(a^.hi, legajo);
			InformarAlumnosLegajoChico(a^.hd, legajo);
		end
		else
		begin
			informarAlumnosLegajoChico(a^.hi, legajo);
		end;
	end;
end;


{c. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo esté comprendido entre dos valores que se reciben 
como parámetro.}
procedure InformarAlumnosRango (a: arbol; limInf: integer; limSup: integer);
begin
	if (a <> nil) then
	begin
		if (a^.dato.legajo < limInf) then
			InformarAlumnosRango(a^.hd, limInf, limSup)
		else if (a^.dato.legajo > limSup) then
			InformarAlumnosRango(a^.hi, limInf, LimSup)
		else
		begin
			writeln('DNI: ', a^.dato.dni);
			writeln('Anio: ' , a^.dato.anio);
			writeln;
			InformarAlumnosRango(a^.hi, limInf, limSup);
			InformarAlumnosRango(a^.hd, limInf, limSup);
		end;
	end;
end;


{d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.}
procedure masGrande (var max: integer; a: arbol);
begin
	if (a <> nil) then
	begin
		masGrande(max, a^.hi);
		if (a^.dato.dni > max) then
			max := a^.dato.dni;
		masGrande(max, a^.hd);
	end;
end;

{e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar.}
function cantAlumnosLegajoImpar (a: arbol): integer;
var
	suma: integer;
begin
	suma := 0;
	if (a <> nil) then
	begin
		if ((a^.dato.legajo MOD 2) <> 0) then
			suma := 1;
		suma := suma + cantAlumnosLegajoImpar(a^.hi);
		suma := suma + cantAlumnosLegajoImpar(a^.hd);
	end;

	cantAlumnosLegajoImpar := suma;
	
end;

//PROGRAMA PRINCIPAL
var
	a: arbol;
	leg: integer;
	limInf, limSup: integer;
	max: integer;
begin
	a:=nil;
	writeln('Recuerde, los que hayan ingresado antes del 2010, no se tendran en cuenta');
	crearArbol(A);
	
	writeln('IMPRIMIENDO ARBOL...');
	imprimirArbol(a);
	
	write('Ingrese legajo limite superior: ');
	readln(leg);
	InformarAlumnosLegajoChico(a, leg);
	
	writeln('Ingrese otro legajo como limite superior: ');
	readln(limSup);
	write('Ingrese legajo como limite inferior: ');
	readln(limInf);
	InformarAlumnosRango(a, limInf, LimSup);
	
	max := - 1;
	masGrande(max, a);
	writeln('El maximo es: ', max);
	
	writeln('Cantidad de alumnos con legajo impar: ', cantAlumnosLegajoImpar(a));
end.
