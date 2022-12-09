{ 8. Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos
uno de ellos no lo era. Por ejemplo, si se leen los caracteres “a e o” deberá informar “Los tres son
vocales”, y si se leen los caracteres “z a g” deberá informar “al menos un carácter no era vocal” }

program Practica1_Ejercicio8;
var
    cUno, cDos, cTres: char;
    cUnoB, cDosB, cTresB: boolean;
    
begin
    read (cUno);
    read (cDos);
    read(cTres);
  
    if (cUno ='a') OR (cUno ='e') OR (cUno ='i') or(cUno ='o') or (cUno = 'u') then
        cUnoB := true
    else
        cUnoB := false;
    
    if (cDos ='a') OR (cDos ='e') OR (cDos ='i') or(cDos ='o') or (cDos = 'u') then
        cDosB := true
    else
        cDosB := false; 
    
    if (cTres ='a') OR (cTres = 'e') OR (cTres = 'i') or(cTres = 'o') or (cTres = 'u') then
        cTresB := true
    else
        cTresB := false;
        
    
    if (cUnoB = true) and (cDosB = true) and (cTresB = true) then
        writeln('Los tres son vocales')
    else
        writeln('Al menos un caracter no era vocal');

end.