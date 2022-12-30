{ 8. Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
total acumulado en ventas de todo el mes. }

program Practica1b_Ejercicio8 ;

var 
    montoVenta: real;
    totalVentas: real;
    contadorVentas: integer;
    i: integer;

begin
    totalVentas := 0;

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

        writeln('El día ', i, ' se hicieron ', contadorVentas, ' ventas');
        writeln;
    end;

    writeln('El monto total acumulado es fue de ', totalVentas:2:2);

end.