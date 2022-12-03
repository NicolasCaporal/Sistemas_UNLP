{ 6. Realice un programa que informe el valor total en pesos de una transacción en dólares.
Para ello, el programa debe leer el monto total en dólares de la transacción, el valor del
dólar al día de la fecha y el porcentaje (en pesos) de la comisión que cobra el banco por la 
transacción. Por ejemplo, si la transacción se realiza por 10 dólares, el dólar tiene un valor
189,32 pesos y el banco cobra un 4% de comisión, entonces el programa deberá informar:
La transacción será de 1968,93 pesos argentinos
(resultado de multiplicar 10*189,32 y adicionarle el 4%) }

program Practica0_Ejercicio6;
var 
    valorDolar, cuantosDolares, comision, precio, transaccion: real;
    
begin
    write('Ingrese el valor actual del dolar: ');
    readln(valorDolar);
    
    write('Ingrese cuantos dolares desea comprar: ');
    readln(cuantosDolares);
    
    write('Ingrese el porcentaje de comision que cobra su banco: ');
    readln(comision);
    
    precio := valorDolar * cuantosDolares;
    transaccion := precio + (comision * precio / 100);
    
    writeln('');
    
    write('La transacción será de ', transaccion:5:2);
end.