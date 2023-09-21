#!/bin/bash
# 12. Evaluación de expresiones:
# (a) Realizar un script que le solicite al usuario 2 números, los lea de la entrada Standard
# e imprima la multiplicación, suma, resta y cual es el mayor de los números leídos.

echo "Ingrese dos numeros:" 
read n1 n2

echo "Suma: $(expr $n1 + $n2)"

echo "Resta: $(expr $n1 - $n2)"

echo "Multiplicacion: $(expr $n1 \* $n2)"

if [ $n1 -eq $n2 ]
then
        echo "Mayor: Los numeros son iguales."

elif [ $n1 -gt $n2 ]
then
        echo "Mayor: $n1"

else
        echo "Mayor: $n2"
fi
