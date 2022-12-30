{ a) Modifique el ejercicio anterior para que además informe el día en el que se realizó la
mayor cantidad de ventas. }

program Practica1b_Ejercicio8a ;

var 
    montoVenta: real;
    totalVentas: real;
    contadorVentas: integer;
    i: integer;
    maxCantVentas: integer;
    diaConMasVentas: integer;
begin
    totalVentas := 0;
    maxCantVentas := -1;
    diaConMasVentas := -1;
    

    for i := 1 to 5 do 
    begin
        contadorVentas := 0;

        write('Ingrese monto de la venta: ');
        readln(montoVenta);
        
        while (montoVenta <> 0) do 
        begin
            totalVentas := totalVentas + montoVenta;
            contadorVentas := contadorVentas + 1;
            write('Ingrese monto de la venta: ');
            readln(montoVenta);
        end;
        
        if (contadorVentas > maxCantVentas) then
        begin 
            maxCantVentas := contadorVentas;
            diaConMasVentas := i;
        end;

        writeln('El día ', i, ' se hicieron ', contadorVentas, ' ventas');
        writeln;
    end;

    writeln('El monto total acumulado es fue de ', totalVentas:2:2);
    writeln('El día con mayor cantidad de ventas fue el día nro ', diaConMasVentas);

end.