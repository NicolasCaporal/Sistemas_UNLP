{5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa
el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.}

program Practica6_Ejercicio5;

type
    producto = record
        code: integer;
        desc: string;
        stockA: integer;
        stockM: integer;
        precio: real;
    end;
    
    lista = ^nodo;
    nodo = record
        dato: producto;
        sig: lista;
    end;



procedure agregarAlFinal (var L: lista; var ult: lista; prod: producto);
var
    nue: lista;

begin
    new(nue);
    nue^.dato := prod;
    if (L = nil) then
        L := nue
    else
        ult^.sig := nue;
    ult := nue;
end;


procedure cargarProducto (var prod: producto);
begin
    write('Ingrese codigo: ');
    readln(prod.code);
    if (prod.code <> -1) then
    begin
        write('Ingrese descripción: ');
        readln(prod.desc);
        write('Ingrese stock actual: ');
        readln(prod.stockA);
        write('Ingrese stock minimo: ');
        readln(prod.stockM);
        write('Ingrese precio: $');
        readln(prod.precio);
        writeln;
    end;
    writeln;
end;


procedure imprimirProducto (prod: producto);
begin
    write('Codigo: ');
    writeln(prod.code);
    write('Descripcion: ');
    writeln(prod.desc);
    write('Stock actual: ');
    writeln(prod.stockA);
    write('Stock minimo: ');
    writeln(prod.stockM);
    write('Precio: $');
    writeln(prod.precio:2:2);
end;


procedure cargarProductos (var L: lista);
var
    p: producto;
    ult: lista;

begin
    cargarProducto(p);
    while (p.code <> -1) do
    begin
        writeln('ENTRÓ AL WHILE DE CARGAR PRODUCTOS!!!');
        agregarAlFinal(L, ult, p);
        cargarProducto(p);
    end;
end;


function descomponerEnDigitos (l: lista): boolean; {B}
var
    contador: integer;
    num: integer;

begin
    contador := 0;
    num := l^.dato.code;
    while (num <> 0) do
    begin
        if (num MOD 2 = 0) then
            contador := contador+1;
        num := num div 10;
    end;
    
    descomponerEnDigitos := (contador >= 3);
end;


procedure dosMasBaratos (l: lista; var m1, m2: real; var c1, c2: integer); {C}
begin
    m1 := 9999;

    if ((m1 > l^.dato.precio) and (l^.dato.code <> -1)) then
    begin
        m2 := m1;
        c2 := c1;
        m1 := l^.dato.precio;
        c1 := l^.dato.code;
    end
    else if (m2 > l^.dato.precio) then
    begin
        m2 := l^.dato.precio;
        c2 := l^.dato.code;
    end;
    WRITELN('M1 = ', m1, 'M2 = ', m2);
end;


procedure recorrerLista (l: lista; var par: lista; var contTotalProd, contMenorAqM: integer; var m1, m2: real; var c1, c2: integer);
var
    ult: lista;

begin
    contTotalProd := 0;
    contMenorAqM := 0;
    writeln();

    writeln('================================================================== Imprimiendo lista ================================================================== ');
    while (L <> nil) do
    begin
        imprimirProducto(L^.dato); {Imprime lista}
        
        contTotalProd := contTotalProd+1; {Cuenta total}
        
        if (L^.dato.stockA < L^.dato.stockM) then {Cuenta inciso A}
            contMenorAqM := contMenorAqM+1;
        
        if (descomponerEnDigitos(l)) then {Cuenta inciso B}
        begin
            agregarAlFinal(par, ult, L^.dato); {Creo una lista solo con los productos que cumplen la condicion}
        end;
        
        dosMasBaratos(l, m1, m2, c1, c2); {Compara si es barato}
        
        L := L^.sig; {Pasa al siguiente nodo}
        writeln;
    end;
end;


function calcularPorcentaje(cT, cM: integer): real; {Calcula inciso A}
begin
    calcularPorcentaje := (cM*100)/cT;
end;


procedure imprimirDescripcion (l: lista);
begin
    while (l <> nil) do
    begin
        writeln(l^.dato.desc);
        l:=l^.sig;
    end;
end;


{Programa Principal}
var
    l: lista;
    pares: lista;
    cT, cM, c1, c2: integer;
    m1, m2: real;

begin
    l : =nil;
    pares := nil;
    cargarProductos(l);
    recorrerLista (l, pares, cT, cM, m1, m2, c1, c2);

    writeln('El porcentaje de productos con stock actual menor a stock minimo es de ', calcularPorcentaje(cT, cM):2:2, '%'); {A}
    writeln ('Los productos que tienen al menos 3 digitos pares en su codigo, son: '); {B}
    imprimirDescripcion(pares); {B}
    writeln('Los dos productos mas economicos fueron los de codigo ', c1, ' y ', c2); {C}
end.


