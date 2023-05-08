# Escribí una solución alternativa a la planteada por tu compañero/a:

#EJERCICIO 5:** dado el archivo denominado [log_catedras](https://archivos.linti.unlp.edu.ar/index.php/s/q9b3rCrlhOS1yWU) que contiene  el registro de  accesos al entorno catedras.linti, se desea:
#1.  Generar una función que retorne qué usuarios registran accesos el día 2 de abril y en qué horarios lo hicieron. Esta función recibe un parámetro opcional que indica el orden en que se ordenan los usuarios: "A", si se ordena en forma ascendente, "D" si es descendente o "None" si no se aplica ningún orden. Por defecto la función no ordena. Si hay más accesos de un usuario ese día, sólo procesar el primero. 
#2.  Escribir un programa que, utilizando la función anterior, muestre un listado similar al siguiente:
 
#----------------------------
#Usuario en el sistema   Hora
#----------------------------
#Butterfree         08:41:47
#Pikachu            08:41:47
#Oddish             08:41:47
#Kingler            08:41:47
#Tauros             08:41:47


#Solución alternativa
import csv

def retornar_usuarios(orden = None):
    """Esta función retorna los usuarios que registraron accesos el 2 de abril y en qué horarios lo hicieron.
    Recibe un parámetro opcional que indica el orden en que se ordenan los usuarios: "A", si se ordena en forma
    ascendente, "D" si es descendente. Por defecto la función no ordena.
    Si hay más accesos de un usuario ese día, sólo procesa el primero.
    """
    usuarios = {}

    with open('log_catedras.csv', 'r', encoding='utf-8') as archivo_csv:
        csvreader = csv.reader(archivo_csv, delimiter=',')
        next(csvreader) # Avanzo para no procesar el encabezado

        for user in csvreader:
            if user[0].startswith('2/04/2022') and user[1] not in usuarios:
                nombre = user[1]
                hora = user[0].split()[1]
                usuarios[nombre] = hora

    if orden == 'A':
        usuarios = dict(sorted(usuarios.items(), key=lambda user: user[1]))
    elif orden == 'D':
        usuarios = dict(sorted(usuarios.items(), key=lambda user: user[1], reverse=True))

    return usuarios

usuarios = retornar_usuarios('D')

print("-----------------------------")
print("Usuario en el sistema   Hora")
print("-----------------------------")
for usuario, hora in usuarios.items():
    print(f"{usuario:<22} {hora}")
