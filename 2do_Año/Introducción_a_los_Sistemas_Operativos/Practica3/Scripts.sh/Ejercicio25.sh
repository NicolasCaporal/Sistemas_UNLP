#!/bin/bash
# 25. Realice un script que agregue en un arreglo todos los nombres de los usuarios del sistema
# pertenecientes al grupo “users”. Adicionalmente el script puede recibir como parametro:
# “-b n”: Retorna el elemento de la posición n del arreglo si el mismo existe. Caso contrario, un mensaje de error.
# “-l”: Devuelve la longitud del arreglo
# “-i”: Imprime todos los elementos del arreglo en pantalla

if [ $# -lt 1 ]; then
        echo "ERROR: Debe enviar un parametro {-b n} {-l} {-i}"
        exit 1
fi


if [ ! $1 = "-b" ] && [ ! $1 = "-l" ] && [ ! $1 = "-i" ]; then
        echo "ERROR: Parametro invalido"
        exit 2
fi


if [ $1 = "-b" ] && [ $# -lt 2 ]; then
        echo "ERROR: Con {-b} debe enviar 2 parametros"
        exit 3
fi



users=()

for user_name in $(cat /etc/passwd | cut -d: -f 1); do
        group=$(groups $user_name)
        if [ $(echo $group | grep "users" | wc -l) -eq 1 ]; then
                users+=($user_name)
        fi
done


if [ $1 = "-b" ]; then
        if [ $2 -le ${#users[*]} ]; then
                n=$(( $2 - 1 )); echo "users[$2]: ${users[$n]}"
        else
                echo "ERROR: El arreglo es más petizo che..."  
        fi

elif [ $1 = "-l" ]; then
        echo "longitud users: ${#users[*]}" 
elif [ $1 = "-i" ]; then
        echo ${users[*]}
fi

exit 0