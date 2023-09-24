#!/bin/bash
# 22. Dada la siguiente declaración al comienzo de un script: num=(10 3 5 7 9 3 5 4) (la cantidad
# de elementos del arreglo puede variar). Implemente la función productoria dentro de este script, 
# cuya tarea sea multiplicar todos los números del arreglo

num=(10 3 5 7 9 3 5 4)

productoria(){
        res=1
        for numero in ${num[*]}; do
                res=$(expr "$res" "*" "$numero")
        done
}

echo ${num[*]}
echo "Multiplicando..."
productoria
echo "Resultado = $res"

exit 0
