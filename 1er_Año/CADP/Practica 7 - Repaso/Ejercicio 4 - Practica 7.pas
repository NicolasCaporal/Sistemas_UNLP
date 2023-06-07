{4. Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y
peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un
programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.}

program Ejercicio4_Practica7;

const
    limiteEmb = 42;

type 
    
    tablaPeso = array [1..limiteEmb] of real;

    paciente = record
        nombre: string;
        apellido: string;
        semanas: integer;
        peso: tablaPeso;
    end;
    
    lista = ^nodo;
    nodo = record
        dato: paciente;
        sig: lista;
    end;
    


procedure agregarAlFinal (var l, ult: lista; p: paciente);
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


procedure cargarPeso (var peso: tablaPeso; dl: integer);
var
    i: integer;

begin
    for i:= 1 to dl do
    begin
        write('Ingrese peso en la semana ', i, ': ');
        readln(peso[i]);
    end;
end;


procedure leerPaciente (var p: paciente);
var
    peso: tablaPeso;

begin
    write('Ingrese nombre: ');
    readln(p.nombre);
    write('Ingrese apellido: ');
    readln(p.apellido);
    write('Ingrese la cantidad de semanas totales del embarazo: ');
    readln(p.semanas);
    cargarPeso(peso, p.semanas);
    p.peso := peso;
end;


procedure cargarLista (var l: lista);
var
    p: paciente;
    ult: lista;
    contador: integer;

begin
    contador := 1;
    writeln('PACIENTE ', contador);
    leerPaciente(p); 
    writeln;
    writeln;
    while (P.nombre <> '-1') do 
    begin
        agregarAlFinal(l, ult, p);
        contador := contador + 1;
        writeln('PACIENTE ', contador);
        leerPaciente(p);
        writeln;
        writeln;
    end;
end;


{a. Para cada embarazada, la semana con mayor aumento de peso.}
procedure actualizarMaximoAumento (a: real; i: integer; var maxAum: real; var maxSem: integer);
begin
    if (a > maxAum) then
    begin
        maxAum := a;
        maxSem := i;
    end;
end;


{b. El aumento de peso total de cada embarazada durante el embarazo.}
procedure actualizarPesoMaximoTotal (var pesoMax: real; pesoAct: real);  //para el b)
begin
    if ( pesoAct > pesoMax) then
        pesoMax := pesoAct;
end;


procedure maximos (p: paciente);
var
    aumento: real;
    maxAum: real;
    maxSem: integer;
    pesoMax: real;
    i: integer;

begin
    maxAum := -1;
    for i:= 2 to p.semanas do 
    begin
        aumento := p.peso[i] - p.peso[i-1];
        actualizarMaximoAumento (aumento, i, maxAum, maxSem);
        actualizarPesoMaximoTotal (pesoMax, p.peso[i]);
    end;
    writeln('La paciente ', p.nombre, ' ', p.apellido, ' tuvo su maximo aumento de peso en la semana ', maxSem, ' de ', maxAum:2:2, ' kgs');
    writeln('Y aumentó ', pesoMax-p.peso[1]:2:2, ' kgs');
end;


procedure imprimirLista (l: lista);
var
    i: integer;

begin
    writeln('IMPRIMIENDO LISTA E INFORMANDO COSAS: ');
    while (l <> nil) do 
    begin
        writeln('Nombre: ', l^.dato.nombre);
        writeln('Apellido: ', l^.dato.apellido);
        for i := 1 to l^.dato.semanas do 
        begin
            writeln('Semana ', i ,': ', l^.dato.peso[i]:2:2);
        end;
        writeln;
        maximos (l^.dato);
        writeln;
        writeln;
        l := l^.sig;
    end;
end;



{PROGRAMA PRINCIPAL}
var
    l: lista;

begin
    l := nil;
    cargarLista(l);
    imprimirLista(l);
end.
