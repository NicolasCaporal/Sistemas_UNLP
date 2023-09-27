#!/bin/bash
# 27. Realice un script que implemente a través de la utilización de funciones las operaciones básicas sobre arreglos:
# * inicializar: Crea un arreglo llamado array vacío
# * agregar_elem <parametro1>: Agrega al final del arreglo el parámetro recibido
# * eliminar_elem <parametro1>: Elimina del arreglo el elemento que se encuentra en la posición recibida como parámetro. Debe validar que se reciba una posición válida
# * longitud: Imprime la longitud del arreglo en pantalla
# * imprimir: Imprime todos los elementos del arreglo en pantalla
# * inicializar_Con_Valores <parametro1><parametro2>: Crea un arreglo con longitud <parametro1> y en todas las posiciones asigna el valor <parametro2>

inicializar(){
        array=()
}


agregar_elem(){
        if [ $# -gt 0 ]; then
                array+=($1)
        else
                echo Error: agregar_elem en el numero de parametros
        fi
}


eliminar_elem(){
        if [ $# -gt 0 ]; then
                n=$(( $1 - 1 ))
                if [ $n -le ${#array[*]} ]; then
                        unset array[$n] 
                else
                        echo Error: eliminar_elem posicion invalida
                fi
        else
                echo Error: eliminar_elem en el numero de parametros
        fi
}


longitud(){
        echo ${#array[*]}
}


imprimir(){                                                                                                                                                                      
        echo ${array[*]}                                                                                                                                                         
} 


inicializar_con_valores(){
        if [ $# -ge 2 ]; then
                array=()
                for ((i=1; i<=$1; i++)); do
                        array+=($2)
                done
        else
                echo Error: inicializar_con_valores en el numero de parametros
        fi
}



# TEST

inicializar
echo "Agrega 5"
agregar_elem 1
agregar_elem 2
agregar_elem 3
agregar_elem 4
agregar_elem 5
echo "Imprimo... [$(imprimir)]"
echo "Tamaño: $(longitud)"
echo Elimino pos[3]
eliminar_elem 3
echo "Imprimo... [$(imprimir)]"
echo "Tamaño: $(longitud)"
echo

echo "Inicializo con valor 7 tamaño 5"
inicializar_con_valores 5 7
echo "Imprimo... [$(imprimir)]"
echo "Tamaño: $(longitud)"
echo

echo "Y ahora deberian ser todos errores :)"
agregar_elem
eliminar_elem
eliminar_elem 100
inicializar_con_valores 
inicializar_con_valores 2
echo

echo "exit :)"
exit 0 
