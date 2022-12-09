{ 3. Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
Por ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir: 12 4 -10 }

program Practica1_Ejercicio3;
var 
    numUno, numDos, numTres: integer;

begin
    read(numUno);
    read(numDos);
    readln(numTres);
    
    If (numUno > numDos) and (numDos > numTres) then
        write (numUno, ' ', numDos, ' ', numTres);
    
    If (numUno > numTres) and (numTres > numDos) then
        write (numUno, ' ', numTres, ' ', numDos);
    
    If (numDos > numUno) and (numUno > numTres) then
        write (numDos, ' ', numUno, ' ', numTres);

    If (numDos > numTres) and (numTres > numUno) then
        write (numDos, ' ', numTres, ' ', numUno);

    If (numTres > numUno) and (numUno > numDos) then
        write (numTres, ' ', numUno, ' ', numDos);

    If (numTres > numDos) and (numDos > numUno) then
        write (numTres, ' ', numDos, ' ', numUno);

end.