{ 5. Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”. }

program Practica1_Ejercicio5;
var 
    numero, numeroDos: real;
    contador: integer;
    
begin

    contador := 0;
    readln(numero);
    readln(numeroDos);
    contador := contador + 1;
    
    while (numero * 2 <> numeroDos) and (contador < 10) do
        begin
            readln(numeroDos);
            contador := contador + 1;
        end;
    
    if not(numero * 2 = numeroDos) and (contador = 10) then
        write('No se ha ingresado el doble de ', numero:2:2);
        
end.