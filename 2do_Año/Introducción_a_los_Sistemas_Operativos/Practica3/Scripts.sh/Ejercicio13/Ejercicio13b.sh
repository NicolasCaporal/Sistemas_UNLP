#!/bin/bash
# 13. Uso de las estructuras de control:
# (b) Crear un script que muestre 3 opciones al usuario: Listar, DondeEstoy y QuienEsta.
# Según la opción elegida se le debe mostrar:
# Listar: lista el contenido del directorio actual.
# DondeEstoy: muestra el directorio donde me encuentro ubicado.
# QuienEsta: muestra los usuarios conectados al sistema.

select opcionElegida in "Listar" "DondeEstoy" "QuienEsta" "Salir"
do
        case $opcionElegida in
                "Listar")
                        echo "$(ls -l)"
                ;;

                "DondeEstoy")
                        echo "$(pwd)"
                ;;

                "QuienEsta")
                        echo "$(who)"
                ;;

                "Salir")
                        exit 0
                ;;

                *)

                echo "Opcion no valida"
                ;;
        esac
done
