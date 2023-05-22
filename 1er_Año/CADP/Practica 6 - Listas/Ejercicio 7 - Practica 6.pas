{7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar
proyectos de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se
han determinado los siguientes criterios:
- sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la
superficie terrestre con grandes antenas.
A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar
un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los
nuevos criterios H2020.
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y
retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no
los cumplen.
c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el
costo total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello,
utilice el módulo realizado en b}

program Practica6_Ejercicio7;

type
    RE = 1..7;
    
    sonda = record
        nombre: string[30];
        durE: real;
        costC: real;
        costMM: real;
        rango: RE;
    end;
    
    
    lista = ^nodo;
    nodo = record
        dato: sonda;
        sig: lista;
    end;



procedure agregarAtras (var L, Ult: lista; S: sonda);
var
    nue: lista;

begin
    new(nue);
    nue^.dato := S;
    
    if ( L = nil) then
        L := nue
    else 
        ult^.sig := nue;
    ult := nue;
end;


procedure cargarSonda (var s: sonda);
begin
    write('Ingrese nombre: ');
    readln(s.nombre);
    write('Ingrese duracion estimanda: ');
    readln(s.durE);
    write('Ingrese costo de construcción: ');
    readln(s.costC);
    write('Ingrese costo mensual de mantenimiento: ');
    readln(s.costMM);
    write('Ingrese rango: ');
    readln(s.rango);
    writeln;
end;


procedure cargarSondas (var L: lista);
var
    ult: lista; s: sonda;

begin
    repeat
        cargarSonda(s);
        AgregarAtras(L, Ult, S);
    until (s.nombre = 'GAIA');
end;


procedure imprimirSonda (s: sonda);
begin
    write('Nombre: ');
    writeln(s.nombre);
    write('Duracion estimanda: ');
    writeln(s.durE:2:2);
    write('Costo de construcción: ');
    writeln(s.costC:2:2);
    write('Costo mensual de mantenimiento: ');
    writeln(s.costMM:2:2);
    write('Rango: ');
    writeln(s.rango);
    writeln;
end;


procedure imprimirLista (l: lista);     
begin
    WRITEln('Imprimiendo lista...');
    while (L <> nil) do
    begin
        imprimirSonda(l^.dato);
        L := L^.sig;
    end;
end;


{Todo lo anterior, casi idem al ejercicio 6, a partir de este punto, resuelvo los incisos de este ejercicio}

function cumple (s: sonda): boolean; {Inciso A}
begin
    if ((s.costMM > s.costC) or (s.rango = 1)) then
        cumple := false
    else
        cumple := true;
end;


procedure crearListados (L: lista; var LCumple, LNoCumple: lista); {Inciso B}
var
    ultC, ultNC: lista;

begin
    while (L <> nil) do 
    begin
        if (cumple(l^.dato)) then
            agregarAtras(LCumple, ultC, L^.dato)
        else
            agregarAtras(LNoCumple, ultNC, L^.dato);
        l := L^.sig;
    end;
end;


procedure InfNoCumplen (LNoCumple: lista); {Inciso C}
var
    costoT: real;
    cant: integer;
    
begin
    cant := 0;
    costoT := 0;
    
    while (LNoCumple <> nil) do
    begin
        costoT:=LNoCumple^.dato.costC + (LNoCumple^.dato.costMM * LNoCumple^.dato.durE) + costoT;
        
        cant := cant + 1;
        
        LNoCumple := LNoCumple^.sig;
    end;
    
    writeln ('Hay ', cant, ' sondas que no cumplen las condiciones');
    writeln('El costo total es de $', costoT:2:2);
end;


{PROGRAMA PRINCIPAL}
var
    L: lista;
    LC: lista;
    LNC: lista;

begin
    l := nil;
    lc := nil;
    lnc := nil;
    
    cargarSondas(L);
    imprimirLista(L);
    
    crearListados (L, LC, LNC); {Inciso A y B}
    writeln;
    
    writeln('LISTADO DE SONDAS QUE SI CUMPLEN CONDICIONES');
    imprimirLista(LC);
    
    writeln('LISTADO DE SONDAS QUE NO CUMPLEN CONDICIONES');
    imprimirLista(LNC);
    
    InfNoCumplen (LNC); {Inciso C}
end.

