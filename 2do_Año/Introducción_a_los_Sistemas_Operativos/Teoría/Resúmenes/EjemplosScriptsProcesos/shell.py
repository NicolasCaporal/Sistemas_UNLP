# Ejemplo SHELL - - Clase Procesos 4

import os
print ("""
------------------------------------------------------
----------- Esta es la ISO DIR/LS SHELL --------------
------------------------------------------------------
# exit (para salir)
""")

cmd = input("iso:\> ")

while cmd != 'exit':

    if cmd == '':
        cmd = input("iso:\> ")

    else:
        newpid = os.fork()

        if newpid == 0:
            # Seccion del hijo
            lista = cmd.split(' ')
            os.execvp(lista[0], lista)
            print("Imprimir AAAAAAAAAA") #Estas 3 lineas nunca se ejecutan.
            exit(0)                      # Cuando llega el execvp se carga el programa
            print("Imprimir BBBBBBBBBB") # correspondiente al hijo

        else:
            # Seccion del padre
            os.wait()
            cmd = input("iso:\> ")

exit(0)