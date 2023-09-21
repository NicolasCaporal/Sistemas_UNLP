#!/bin/bash
# 13. Uso de las estructuras de control:
# (c) Crear un script que reciba como parámetro el nombre de un archivo e informe si el mismo existe o no,
# y en caso afirmativo indique si es un directorio o un archivo. 
# En caso de que no exista el archivo/directorio cree un directorio con el nombre recibido como parámetro.

if [ $# -ne 1 ]
then
        echo "ERROR: Debe enviar un parámetro"
        exit 1
fi

archivo="$1"

# Compruebo si $archivo existe en el directorio actual
if [ -e "$archivo" ]
then 

        if [ -f "$archivo" ] 
        then
                echo "${archivo} existe, y es un archivo"

        elif [ -d "$archivo" ]
        then
                echo "${archivo} existe, y es un directorio"

        fi
        
else
        echo "${archivo} NO existe"
        mkdir ${archivo}
        echo "Se creó un nuevo directorio llamado ${archivo}"
fi

exit 0
