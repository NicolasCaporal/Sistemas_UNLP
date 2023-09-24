#!/bin/bash
# 20. Realice un script que simule el comportamiento de una estructura de PILA implemente
# las siguientes funciones aplicables sobre una estructura global definida en el script:
# push: Recibe un parámetro y lo agrega en la pila. | pop: Saca un elemento de la pila.
# length: Devuelve la longitud de la pila. | print: Imprime todos elementos de la pila.


pila=()

push(){
        if [ $# -eq 1 ]; then
                pila+=($1)      
        fi
}


length(){
        echo ${#pila[*]}
}


pop(){
        longitud=${#pila[*]}
        indice=$(expr $longitud - 1)
        unset pila[$indice]
}


print(){
        echo "${pila[*]}"
}



# 21. Dentro del mismo script y utilizando las funciones implementadas:
# Agregue 10 elementos a la pila
# Saque 3 de ellos
# Imprima la longitud de la pila
# Luego imprima la totalidad de los elementos que en ella se encuentran

echo "Length: $(length)"

echo "Push 10 elementos"
push 1
push 2
push 3
push 4
push 5
push 6
push 7
push 8
push 9
push 10

# echo "Print: $(print)"
# echo "Length: $(length)"

echo "Pop 3 elementos"
pop
pop
pop

echo "Length: $(length)"
echo "PRINT: $(print)"

exit 0
