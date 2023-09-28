#!/bin/bash
# 29. Implemente un script que agregue a un arreglo todos los archivos del directorio /home cuya
# terminación sea .doc. Adicionalmente, implemente las siguientes funciones que le permitan
# acceder a la estructura creada:
#
# verArchivo <nombre_de_archivo>: Imprime el archivo en pantalla si el mismo se
# encuentra en el arreglo. Caso contrario imprime el mensaje de error “Archivo no en-
# contrado” y devuelve como valor de retorno 5
#
# cantidadArchivos: Imprime la cantidad de archivos del /home con terminación .doc
#
# borrarArchivo <nombre_de_archivo>: Consulta al usuario si quiere eliminar el archi-vo
# lógicamente. Si el usuario responde Si, elimina el elemento solo del arreglo. Si el
# usuario responde No, elimina el archivo del arreglo y también del FileSystem. Debe
# validar que el archivo exista en el arreglo. En caso de no existir, imprime el mensaje
# de error “Archivo no encontrado” y devuelve como valor de retorno 10


verArchivo(){
        if [ $# -lt 1 ]; then
                echo "ERROR 1: verArchivo -> debe enviar 1 parametro"
                return 1
        fi

        encontro=false
        for file in ${doc_files[*]}; do
                if [ $file = $1 ]; then
                        encontro=true
                        echo $file
                fi
        done

        if [ $encontro = false ]; then
                echo "ERROR 5: verArchivo -> Archivo no encontrado"
                return 5
        fi
}


cantidadArchivos(){
        echo ${#doc_files[*]}
}


borrarArchivo(){
        if [ $# -lt 1 ]; then
                echo "ERROR 2: borrarArchivo -> debe enviar 1 parametro"
                return 2
        fi

        remove_file=$1

        if [ $(echo ${doc_files[*]} | grep "$remove_file" | wc -l) -eq 0 ]; then
                echo "ERROR 10: borrarArchivo -> Archivo no encontrado"
                return 10
        fi


        option=" "
        while [ ! "$option" = "Y" ] && [ ! "$option" = "N" ]; do
                echo "¿Desea eliminar el archivo logicamente? [Y/N]"
                read option
        done

        encontro=false
        indice=0
        echo remove file = $remove_file
        for file in ${doc_files[*]}; do
                if [ $file = $remove_file ]; then
                        unset doc_files[$indice]
                        break        
                else
                        let indice++
                fi
        done
        

        if [ $option = "N" ]; then
                rm "$file"
        fi

        return 0
}



# TEST

cd $HOME
echo Pwd $(pwd)
ls
echo "Creando archivos..."
touch dibu.doc
touch cooper.doc
touch belian.doc
touch pancho.doc
touch gallina.doc
touch sapo.doc
echo

# Arreglo con todos los archivos del directorio /home cuya terminación sea .doc
echo Generando arreglo...
doc_files=($(find "$HOME" -name "*.doc" | cut -d/ -f 4)) 
echo ${doc_files[*]}
echo

echo "Visualizando archivos..."
verArchivo dibu.doc
verArchivo cooper.doc
verArchivo belian.doc
verArchivo pancho.doc
verArchivo gallina.doc
verArchivo sapo.doc
echo

echo "Cantidad de archvivos: $(cantidadArchivos)"
echo

echo "Borrando gallina..."
borrarArchivo "gallina.doc"
echo "Borrando sapo..."
borrarArchivo "sapo.doc"
echo

echo "Cantidad de archivos: $(cantidadArchivos)"
echo

echo "Intentando ver gallina.doc y a sapo.doc (debería dar error)..."
verArchivo gallina.doc
verArchivo sapo.doc
echo

echo "Imprimo arreglo..."
echo ${doc_files[*]}
echo

echo "Comprobando errores de parametros..."
verArchivo
borrarArchivo
echo

echo "fin :)"

exit 0
