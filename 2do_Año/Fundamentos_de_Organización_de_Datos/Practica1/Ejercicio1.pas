{ 1. Realizar un algoritmo que cree un archivo de números enteros no ordenados y permita
incorporar datos al archivo. Los números son ingresados desde teclado. El nombre del
archivo debe ser proporcionado por el usuario desde teclado. La carga finaliza cuando
se ingrese el número 30000, que no debe incorporarse al archivo. }

program ejercicio1;
type
    archivoInt = file of integer;
var 
    archivoNumeros: archivoInt;
    nombreFisico: string;
    num: integer;

begin
    writeln('Ingrese el nombre del archivo: ');
    readln(nombreFisico);

    assign(archivoNumeros, nombreFisico);

    rewrite(archivoNumeros);
    writeln('Ingrese numeros. Para finalizar ingrese 30000');
    readln(num);

    while (num <> 30000) do 
    begin
         write(archivoNumeros, num);
         readln(num);
    end;

    close(archivoNumeros);
end.
