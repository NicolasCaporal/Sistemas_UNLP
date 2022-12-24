{3. Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
procesarse. Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota}

program Practica1b_Ejercicio3;

var 
    nombreA: string;
    nota: real; 
    mayor8, igual7: integer;
    
begin
    mayor8 := 0;
    igual7 := 0; 
    
    repeat 
    begin
        write ('Ingrese nombre: ');
        readln(nombreA);
        
        write('Ingrese nota de EPA: ');
        readln(nota);
        
        if (nota >= 8) then 
            mayor8 := mayor8 + 1
        else if (nota = 7) then 
            igual7 := igual7 + 1;

    end;
    until (nombreA = 'Roman Riquelme');
    
    writeln('Aprobaron ', mayor8, ' alumnos');
    writeln('Hay ', igual7, ' alumnos que sacaron 7');
    
end.