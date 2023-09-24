#!/bin/bash
# 19. Escribir un Programa de “Menu de Comandos Amigable con el Usuario” llamado menu, el
# cual, al ser invocado, mostrará un menú con la selección para cada uno de los scripts creados
# en esta práctica. Las instrucciones de como proceder deben mostrarse junto con el menú.
# El menú deberá iniciarse y permanecer activo hasta que se seleccione Salir

scripts=$(find . -name "*.sh")

echo "MENU"
echo "Ingrese el numero correspondiente al script que desee ejecutar"

select option in $scripts Salir; do

        case $option in
                Salir)
                        echo "Saliendo..."
                        exit 0 ;;

                *)
                        if [ -f "$option" ]; then
                                echo "Ejecutando $option"
                                bash "$option"
                        else
                                echo "Opcion invalida"
                        fi ;;
        esac
        
done

