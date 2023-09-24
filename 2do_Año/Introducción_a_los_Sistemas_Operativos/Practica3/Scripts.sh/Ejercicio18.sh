#!/bin/bash	
# 18. Crear un script que verifique cada 10 segundos si un usuario se ha loqueado en el sistema
# (el nombre del usuario será pasado por parámetro). Cuando el usuario finalmente se loguee,
# el programa deberá mostrar el mensaje ”Usuario XXX logueado en el sistema” y salir.


if [ $# -ne 1 ]; then
        echo "ERROR: Debe enviar un parametro. {user_name}"
        exit 1
fi


user_name=$1

while [ $(echo $(who) | grep "$user_name" | wc -l) -ne 1 ]; do  
        echo "Esperando 10 segundos..."
        sleep 10
done    

echo "El usuario $user_name se ha logueado en el sistema"

exit 0 
