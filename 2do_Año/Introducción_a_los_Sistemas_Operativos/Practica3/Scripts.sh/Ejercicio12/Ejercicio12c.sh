#!/bin/bash
# 12. Evaluación de expresiones:
# (c) Realizar una calculadora que ejecute las 4 operaciones básicas: +, - ,*, %. 
# Esta calculadora debe funcionar recibiendo la operación y los números como parámetros

if [ $# -ne 3 ]
then
        echo "ERROR: Debe enviar 3 parametros"
        exit 1
else 
        echo "$2 $1 $3 = $(expr "$2" "$1" "$3")" #Para que la multiplicacion funcione correctamente, debe enviarse con comillas: "*"
fi

exit 0
