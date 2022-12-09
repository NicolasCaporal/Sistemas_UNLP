{ 6. Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
Al finalizar la lectura, informar:
○ La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2)
○ La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar 1)
○ El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean
menor al valor 2500 (en el ejemplo anterior se debería informar 0%). }

program Practica1_Ejercicio6;
var
    legajo, contAlumnos, contAlumnosSeis, contAlumnosOcho: integer;
    promedio, porcentaje: real;
    
begin
    contAlumnos := 0;
    contAlumnosOcho := 0;
    contAlumnosSeis := 0;
    
    readln (legajo);

    while (legajo <> -1) do
        begin
            contAlumnos := contAlumnos + 1;
            
            readln(promedio);
            
            if (promedio > 6.5) then
                contAlumnosSeis := contAlumnosSeis + 1;
            
            if (promedio > 8.5) and (legajo < 2500) then
                contAlumnosOcho := contAlumnosOcho + 1;
            
            readln(legajo);
        end;
    
    writeln('Se leyeron ', contAlumnos, ' alumnos');
    writeln('Hay ', contAlumnosSeis, ' con promedio mayor a 6.5');
    
    porcentaje := (contAlumnosOcho * 100) / contAlumnos;
    writeln(porcentaje:3:2, '% de ellos son alumnos destacados');
    
end.