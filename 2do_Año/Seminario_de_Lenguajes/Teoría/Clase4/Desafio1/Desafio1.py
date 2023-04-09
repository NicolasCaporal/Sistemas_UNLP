# Desafío
# • Dado el conjunto de datos con series y películas de Netflix, queremos:
# 1- Guardar en otro archivo, en formato json, las peliculas realizadas por más de un país.
# 2- Imprimir los cinco (5) países con más producciones en Netflix, durante el año 2019.

from collections import Counter
import json 
import csv

peliculasVariosPaises = []
listaPaises = []

with open('netflix_titles.csv', 'r', encoding = 'utf-8') as archivo_csv:
    csvreader = csv.reader(archivo_csv, delimiter = ',')
    next(csvreader)
    for linea in csvreader:
        if "," in linea[5]:
            peliculasVariosPaises.append({ "Id": linea[0], "Titulo": linea[2], "Paises": linea[5] })

        if linea[7] == "2019":
            listaPaises.append(linea[5])

with open('archivoPaises.json', 'w') as archivo_json:
    json.dump(peliculasVariosPaises, archivo_json)

masProducciones = Counter(listaPaises).most_common(6)
print(f"Los paises con mas producciones en el año 2019 fueron: ")
for p in masProducciones:
    if p[0] != '':
        print(p)