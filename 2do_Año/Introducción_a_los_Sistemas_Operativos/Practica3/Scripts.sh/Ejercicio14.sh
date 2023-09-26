#!/bin/bash
# 14. Renombrando Archivos: haga un script que renombre solo archivos de un directorio pasado
# como parametro agregandole una CADENA, contemplando las opciones:
# “-a CADENA”: renombra el fichero concatenando CADENA al final del nombre del archivo
# “-b CADENA”: renombra el fichero concantenado CADENA al principio del nombre del archivo

if [ $# -ne 3 ]
then
        echo "ERROR: Debe enviar 3 parametros. {dir} {option} {string}"
        exit 1
fi


dir=$1
option=$2
string=$3

if [ -e $dir ] && [ -d $dir ]
then

        if [ "${option}" = "-a" ] || [ "${option}" = "-b" ]
        then
                for file in $(ls $dir)
                do
                        if [ -f "$dir$file" ]
                        then

                                if [ "${option}" = "-a" ]
                                then
                                        mv $dir$file $dir$file$string
                                elif [ "${option}" = "-b" ]
                                then
                                        mv $dir$file $dir$string$file
                                fi
                        fi
                done

        else
                echo "ERROR: EL parámetro OPTION debe ser -a OR -b"
                exit 2
        fi

else
        echo "ERROR: Directorio invalido"
        exit 3
fi
