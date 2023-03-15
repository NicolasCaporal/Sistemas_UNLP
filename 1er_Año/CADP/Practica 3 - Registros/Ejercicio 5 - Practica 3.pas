{ 5. Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro. }

program Practica3_Ejercicio5;

type
    tipoAuto = record
        marca: string;
        modelo: string;
        precio: real;
    end;

procedure leerAuto(var auto: tipoAuto);
begin
    write('Ingrese la marca: ');
    readln(auto.marca);
    if (auto.marca <> 'zzz') then
    begin
        write('Ingrese el modelo: ');
        readln(auto.modelo);
        write('Ingrese el precio: ');
        readln(auto.precio);
    end;
    writeln('_______________________________________________________________________________________');
    writeln;
end;

function promedio(sumaPrecios: real; cantAutosL: integer): real;
begin
    promedio := sumaPrecios / cantAutosL;
end;

procedure actualizarMax(marca: string; modelo: string; precio: real; var MarMax, ModMax: string; var PreMax: real);
begin
    if (precio > PreMax)then
    begin
        PreMax := precio;
        ModMax := modelo;
        MarMax := marca;
    end;
end;

{Programa Principal}
var
    auto: tipoAuto;
    sumaPM: real;
    modeloMax: string;
    marcaMax: string;
    precioMax: real;
    marcaActual: string;
    cantA: integer;
begin
    precioMax := -9999;
    leerAuto(auto);
    
    while (auto.marca <> 'zzz') do
    begin
        marcaActual := auto.Marca;
        sumaPM := 0;
        cantA := 0;
        
        while (marcaActual = auto.marca) do
        begin
            cantA := cantA + 1;
            sumaPM := sumaPM + auto.precio;
            actualizarMax(auto.marca, auto.modelo, auto.precio, marcaMax, modeloMax, precioMax);
            leerAuto(auto);
        end;
        
        writeln('El precio promedio de la marca ', marcaActual, ' fue ', promedio(sumaPM, cantA):2:2);
        writeln;
        writeln('_______________________________________________________________________________________');
        writeln;
    end;
    
    writeln('El auto más caro ingresado fue ', modeloMax, ' de ', marcaMax);
end.