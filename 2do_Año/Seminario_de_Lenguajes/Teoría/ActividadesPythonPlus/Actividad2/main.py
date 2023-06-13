# Deberán resolver y grabar una explicación (mostrando la pantalla de la computadora) que cubra los siguientes aspectos:
# 1- Mostrar la ejecución del código original dado en el entorno que habitualmente usen para el desarrollo de sus trabajos prácticos (puede ser VSCode o PyCharm por ejemplo) donde muestren la situación planteada:  si hay algún error o una salida específica
# 2- Dar una explicación de por qué se produce esa situación planteada en el enunciado;
# 3- Modificar el codigo de manera tal que no termine en errror y mostrar la ejecución del código modificado de acuerdo a lo solicitado en el enunciado.
# 4- Mostrar la ejecución de la solución propuesta por chatGPT y una comparación con la propia.  


import json
import csv
import  clases 
import random

def obtengoDatos(nombre_archivo):

    if nombre_archivo.endswith("json"):
        archi = open(nombre_archivo, "r")
        datos=json.load(archi)
        archi.close()
    elif nombre_archivo.endswith("csv"):
        archi = open(nombre_archivo, "r")
        csvreader = csv.reader(archi, delimiter=',')
        linea1 = next(csvreader)
        linea2 = next(csvreader)
        datos = dict(zip(linea1, linea2))
        archi.close()
    else:
        datos = {}
    return datos


archivos = ["datos.json", "datos.csv", "datos_CSV.csv"]

archi = random.choice(archivos)
try:
    datosBandas = obtengoDatos(archi)

    banda = clases.Banda(datosBandas['nombre'])
    banda.genero = datosBandas['genero']
    print(banda)
    print("FIN DEL PROGRAMA")

except FileNotFoundError:
    print(f'El archivo {archi} no existe.')
