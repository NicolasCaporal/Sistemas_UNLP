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
