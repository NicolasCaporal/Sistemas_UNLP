#!/bin/bash
# 28. Realice un script que reciba como parámetro el nombre de un directorio. Deberá validar que
# el mismo exista y de no existir causar la terminación del script con código de error 4. Si el
# directorio existe deberá contar por separado la cantidad de archivos que en él se encuentran
# para los cuales el usuario que ejecuta el script tiene permiso de lectura y escritura, e informar
# dichos valores en pantalla. En caso de encontrar subdirectorios, no deberán procesarse, y
# tampoco deberán ser tenidos en cuenta para la suma a informar

if [ $# -lt 1 ]; then
        echo "ERROR: Debe enviar 1 parametro"
        exit 1
fi

dir=$1
if [ -e $dir ]; then
        
        cant=0

        for file in $(ls $dir); do
                if [ -f $dir$file ] && [ -r $dir$file ] && [ -w $dir$file  ]; then
                        let cant++
                fi
        done

        echo "Cantidad: $cant"

else
        echo "ERROR 4: El directorio no existe" 
        exit 4
fi

exit 0

