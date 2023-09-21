#!/bin/bash
# 13. Uso de las estructuras de control:
# (a) Realizar un script que visualice por pantalla los números 
# del 1 al 100 así como sus cuadrados.

for ((i=1; i<101; i++))
do
        echo "${i}: $(expr "$i" "*" "$i")"
done

exit 0
