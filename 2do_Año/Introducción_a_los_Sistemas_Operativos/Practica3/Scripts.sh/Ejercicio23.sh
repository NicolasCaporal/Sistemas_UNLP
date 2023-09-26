#!/bin/bash
# 23. Implemente un script que recorra un arreglo compuesto por números e imprima en pantalla
# sólo los números pares y que cuente sólo los números impares y los informe en pantalla al
# finalizar el recorrido.

arr=(1 2 3 4 5 6 7 8 9 10)

cantImp=0
echo "Numeros pares:"
for num in  ${arr[*]}; do
	if [ $(expr $num % 2) -eq 0 ]; then
		echo $num
	else
		cantImp=$(expr "$cantImp" "+" "1")
	fi
done

echo "Cantidad de numeros impares: $cantImp"
