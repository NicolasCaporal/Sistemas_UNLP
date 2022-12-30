{ 7. Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos }

program Practica1b_Ejercicio7;

var 
    piloto, min1piloto, min2piloto, max1piloto, max2piloto: string;
    tiempo: real;
    min1, min2, max1, max2: real;
    i: integer;

begin
    min1 := 9999;
    max1 := -9999;

    for i := 1 to 100 do 
    begin
        write('Ingrese nombre del piloto ', i, ': ');
        readln(piloto);
        write('Ingrese su tiempo: ');
        readln(tiempo); 
        writeln;

        if (tiempo < min1) then 
        begin
            min2 := min1;
            min2piloto := min1piloto;
            min1 := tiempo;
            min1piloto := piloto;
        end
        else if (tiempo < min2) then 
        begin
            min2 := tiempo;
            min2piloto := piloto;
        end;

        if (tiempo > max1) then
        begin
            max2 := max1;
            max2piloto := max1piloto;
            max1 := tiempo;
            max1piloto := piloto;
        end
        else if (max2 > tiempo) then 
        begin
            max2 := tiempo;
            max2piloto := piloto;
        end;
    end;

    writeln('Puesto 1: ', min1piloto, ' con un tiempo de ', min1:2:2);
    writeln('Puesto 2: ', min2piloto, ' con un tiempo de ', min2:2:2);
    writeln('Puesto 99: ', max1piloto, ' con un tiempo de ', max1:2:2);
    writeln('Puesto 100: ', max2piloto, ' con un tiempo de ', max2:2:2);
end.