{12. En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a) la cantidad de galaxias de cada tipo.
b) la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}

program Practica4a_Ejercicio12;
const
    df = 10; // Debería ser 53
type
    tipo  = 1..4;
    
    galaxia = record
        nombre: string;
        tipo: tipo;
        masa: real;
        distancia: real;
    end;

    galaxias = array [1..df] of galaxia;
    cantTipo = array [tipo] of integer;
   

procedure leerGalaxia (var galaxia: galaxia);
begin
    write('Nombre: ');
    readln(galaxia.nombre);
    
    write('Tipo: ');
    readln(galaxia.tipo);
    
    write('Masa: ');
    readln(galaxia.masa);
    
    write('Distancia: ');
    readln(galaxia.distancia);
    
    writeln();
end;

procedure cargarGalaxias(var galaxias: galaxias);
var
    i: integer;

begin  
    for i := 1 to df do
        leerGalaxia(galaxias[i]);
end;

procedure inicializar0ContadorTipos (var cantTipo: cantTipo); //Problema a)
var 
    i: tipo;

begin
    for i:= 1 to 4 do
        cantTipo[i] := 0;
end;

procedure cantidadDeTipo (var cantTipo: cantTipo; galaxias: galaxias);
var
    i: integer;

begin
    for i := 1 to df do
    begin
        cantTipo[galaxias[i].tipo] := cantTipo[galaxias[i].tipo] + 1;
    end;
end;

procedure sumaMasas (galaxias: galaxias; var sumaMasasPrincipales, sumaMasasTotal: real); //Problema b)
var
    i: integer;
begin
    sumaMasasPrincipales := 0;
    sumaMasasTotal := 0;

    for i:= 1 to df do
    begin
        sumaMasasTotal := sumaMasasTotal + galaxias[i].masa;
        if ((galaxias[i].nombre = 'Vía Láctea') or (galaxias[i].nombre = 'Andrómeda') or (galaxias[i].nombre = 'Triángulo')) then
            sumaMasasPrincipales:=sumaMasasPrincipales+galaxias[i].masa;
    end;
end;

function porcentajeMasImportantes (sumaMasasPrincipales, sumaMasasTotal: real): real;
begin
    porcentajeMasImportantes := (sumaMasasPrincipales*100 / sumaMasasTotal);
end;

function contadorNoIrregu1000pc (galaxias: galaxias): integer; // Problema c)
var
    i: integer;
    cont: integer;

begin
    cont := 0;

    for i := 1 to df do
    begin
        if ((galaxias[i].distancia < 1000) and (galaxias[i].tipo <> 4)) then
            cont:=cont+1;
    end;

    contadorNoIrregu1000pc := cont;
end;

procedure maxymin (galaxias: galaxias; var nombreMax1, nombreMax2, nombreMin1, nombreMin2: string); // Problema d) (ಠ ʖ̯ ಠ) Harto de calcular máximos y mínimos
var
    i: integer;
    max1, max2, min1, min2: real;

begin

    max1 := -9999;
    min1 := 9999;

    for i := 1 to df do
    begin
        if (galaxias[i].masa > max1) then
        begin
            max2 := max1;
            nombreMax2 := nombreMax1;
            max1 := galaxias[i].masa;
            nombreMax1 := galaxias[i].nombre;
        end
        else if (galaxias[i].masa > max2) then
        begin
            max2 := galaxias[i].masa;
            nombreMax2 := galaxias[i].nombre;
        end;
        
        if (galaxias[i].masa < min1) then
        begin
            min2 := min1;
            nombreMin2 := nombreMin1;
            min1 := galaxias[i].masa;
            nombreMin1 := galaxias[i].nombre;
        end
        else if (galaxias[i].masa < min2) then
        begin
            min2 := galaxias[i].masa;
            nombreMin2 := galaxias[i].nombre;
        end;
    end;

end;

// Programa Principal
var
    galaxiasp:galaxias;
    cantTipoP: cantTipo;
    sumaMP, sumaMT: real;
    porcentajeMI: real;
    contadorMenos1000:integer;
    nMax1, nMax2, nMin1, nMin2: string;
    i: integer;

begin

    cargarGalaxias(galaxiasp);
    
    //La cantidad de galaxias de cada tipo.
    inicializar0ContadorTipos(cantTipoP); 
    cantidadDeTipo(cantTipoP, galaxiasp);
    
    //Suma de masas de todas las galaxias y de las 3 principales. Y el porcentaje de estas últimas.
    sumaMasas(galaxiasp, sumaMP, sumaMT);
    porcentajeMI:= porcentajeMasImportantes (sumaMP, sumaMT);
    
    //Galaxias NO irregulares, a menos de 100parsecs
    contadorMenos1000:= contadorNoIrregu1000pc(galaxiasP);
    
    //Las dos galaxias con mas y menos masa
    maxymin (galaxiasP, nMax1, nMax2, nMin1, nMin2);
    
    //Informar
    writeln();
    
    for i:= 1 to 4 do begin
        writeln('Se ingresaron ', cantTipoP[i], ' galaxias de tipo ', i);
    end; 

    writeln('Las 3 galaxias principales tienen una masa de ', sumaMP:2:2 , ' lo que representa un ', porcentajeMI:2:2 ,'% del total');
    
    writeln('Se ingresó un total de ' , contadorMenos1000 , ' galaxias NO irregulares, que estuvieran a menos de 1000 parsecs');
    
    writeln('Las galaxia con más masa es ', nMax1, ' seguida de ', nMax2);
    writeln('La galaxia con menos masa es ', nMin1, ' seguida de ', nMin2);
    
end.




