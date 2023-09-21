#!/bin/bash
# 12. Evaluación de expresiones:
# (b) Modificar el script creado en el inciso anterior para que los números sean recibidos
# como parámetros. El script debe controlar que los dos parámetros sean enviados

if [ $# -ne 2 ]
then
        echo "ERROR: Debe enviar 2 numeros"
        exit 1
fi


echo "Suma: $(expr $1 + $2)"

echo "Resta: $(expr $1 - $2)"

echo "Multiplicacion: $(expr $1 \* $2)"

if [ $1 -eq $2 ]
then
        echo "Mayor: Los numeros son iguales."

elif [ $1 -gt $2 ]
then
        echo "Mayor: $1"

else
        echo "Mayor: $2"
fi

exit 0
