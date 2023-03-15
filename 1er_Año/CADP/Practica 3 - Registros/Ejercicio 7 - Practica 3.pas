{7. Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y
la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios}

program Practica3_Ejercicio7;
type
    tipoCentro = record
        nom: string;
        uni: string;
        cantInv: integer;
        cantBec: integer;
    end;

procedure leerCentro (var centro: tipoCentro);
begin
    write('Nombre del centro: ');
    readln(centro.nom);
    write('Universidad: ');
    readln(centro.uni);
    write('Cantdad de investigadores: ');
    readln(centro.cantInv);
    if (centro.cantInv <> 0)then
    begin
        write('Cantidad becarios: ');
        readln(centro.cantBec);
    end;
    writeln;
end;

procedure mayorCantidadInvestigadores {Por cada universidad} (universidad: string; contadorTotalInvestigadores: integer; var MaxInvestigadores: integer; var nombreMax: string);
begin
    if (contadorTotalInvestigadores > MaxInvestigadores) then
    begin
        MaxInvestigadores := contadorTotalInvestigadores;
        nombreMax := universidad;
    end;
end;

procedure dosConMenosBecarios {Analizar por cada centro!!!!} (centro: tipoCentro; var nombreCentroMenoB1, nombreCentroMenoB2: string; var cantMenosB1, cantMenosB2: integer);
begin
    if (centro.cantBec < cantMenosB1) then
    begin
        cantMenosB2 := cantMenosB1;
        nombreCentroMenoB2 := nombreCentroMenoB1;
        cantMenosB1 := centro.cantBec;
        nombreCentroMenoB1 := centro.nom;
    end
    else if (centro.cantBec < cantMenosB2) then
    begin
        cantMenosB2 := centro.cantBec;
        nombreCentroMenoB2 := centro.nom;
    end;
end;

{Programa Principal}
var 
    maxInv: integer;
    contadorInv: integer;
    nombreMax: string;
    universidadActual: string;
    centro: tipoCentro;
    contadorCentros: integer;
    nombreCentroMenoB1, nombreCentroMenoB2: string;
    cantMenosB1, cantMenosB2: integer;
    
begin
    maxInv := -1;
    cantMenosB1 := 9999;
    
    leerCentro(centro);
    while (centro.cantInv <> 0) do
    begin
        contadorInv := 0;
        contadorCentros := 0;
        universidadActual := centro.uni;
        while (centro.uni = universidadActual) do
        begin
            contadorCentros := contadorCentros + 1;
            contadorInv := contadorInv + centro.cantInv;
            dosConMenosBecarios(centro, nombreCentroMenoB1, nombreCentroMenoB2, cantMenosB1, cantMenosB2);
            leerCentro(centro);
        end;
        writeln('La universidad ', universidadActual, ' tiene ', contadorCentros, ' centros de investigación');
        writeln;
        mayorCantidadInvestigadores(universidadActual, contadorInv, maxInv, nombreMax);
    end; 
    
    writeln('La universidad con mayor cantidad de investigadores es ', nombreMax, ' con un total de ', contadorInv);
    writeln('Los dos centros con menos becarios son ', nombreCentroMenoB1, ' con ', cantMenosB1, ' y ', nombreCentroMenoB2, ' con ', cantMenosB2);
    
end.


