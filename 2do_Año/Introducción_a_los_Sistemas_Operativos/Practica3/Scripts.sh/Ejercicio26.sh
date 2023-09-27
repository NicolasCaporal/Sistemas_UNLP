#!/bin/bash
# 26. Escriba un script que reciba una cantidad desconocida de parámetros al momento de su invocación (debe validar que al menos se reciba uno).
# Cada parámetro representa la ruta absoluta de un archivo o directorio en el sistema. El script deberá iterar por todos los parámetros recibidos,
# y solo para aquellos parámetros que se encuentren en posiciones impares (el primero, el tercero, el qverificar si el archivo o directorio existen en el sistema,
# imprimiendo en pantalla que tipo de objeto es (archivo o directorio). Además, deberá informar la cantidad de archivos o directorios inexistentes en el sistema

if [ ! $# -gt 0 ]; then
		echo "ERROR: Debe enviar al menos 1 parámetro"
		exit 1
fi


inexis=0
i=1

for dir in $@; do

		if [ $(expr $i % 2) -eq 1 ]; then

			if [ ! -e $dir ]; then
					inexis=$(( $inexis + 1 ))
			elif [ -d $dir ]; then
					echo "DIRECTORIO: $dir"
			elif [ -f $dir ]; then
					echo "ARCHIVO: $dir"
			fi

		fi

		i=$(( i + 1 ))

done

echo "Cantidad de archivos inexistentes: $inexis"


exit 0

