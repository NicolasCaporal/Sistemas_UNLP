#!/bin/bash
# 30. Realice un script que mueva todos los programas del directorio actual (archivos ejecutables)
# hacia el subdirectorio “bin” del directorio HOME del usuario actualmente logueado. El script
# debe imprimir en pantalla los nombres de los que mueve, e indicar cuántos ha movido, o
# que no ha movido ninguno. Si el directorio “bin” no existe,deberá ser creado.

if [ -d $HOME/bin ]; then
	mkdir $HOME/bin
fi


cant=0
for file in $(ls); do
	if [ -x $file ] && [ ! -d $file ]; then
		mv "./$file" "$HOME/bin"
		echo "MV: $file"
		let cant++
	fi
done

echo "Se movieron: $cant archivos"

exit 0
