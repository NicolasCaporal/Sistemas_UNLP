#!/bin/bash
# 16. Realizar un script que reciba como parámetro una extensión y haga un reporte con 2
# columnas, el nombre de usuario y la cantidad de archivos que posee con esa extensión.
# Se debe guardar el resultado en un archivo llamado reporte.txt

if [ $# -ne 1 ]; then
        echo "ERROR: Debe enviar 1 parámetro con el parametro"
        exit 1
fi

ext=$1
echo > reporte.txt

for user_data in $(cat /etc/passwd | cut -d: -f  1,6); do
        user=$(echo $user_data | cut -d: -f 1)
        home=$(echo $user_data | cut -d: -f 2)
        
        if [ -d $home ]; then
                cant=$(find $home -name "*.$ext" | wc -l)
        fi

        echo "$user: $cant" >> reporte.txt
done

exit 0
