# **EJERCICIO 13:** dado el archivo denominado [log_catedras] que contiene  el registro de  accesos al entorno catedras.linti, 
# se desea:
# 1. Generar una función que retorne los usuarios que alguna vez vieron el estado de la entrega 1 desde la facultad. Esto se puede chequear si la columna 
#"Contexto del evento" contiene el texto 
# "Tarea: Entrega 1" y la columna "Nombre evento" contiene el texto "Se ha visualizado el estado de la entrega." y la dirección IP comienza con "163.10". 
#Esta función recibe un parámetro opcional que puede contener: "A", 
# para pasar los nombres de usuario  a mayúsculas: "a", para pasarlos a mimúsculas o "None" si se dejan tal como se encuentran en el archivo. 
#Por defecto la función retorna los nombres tales como aparecen en el archivo. 
# 2. Escribir un programa que, utilizando la función anterior, muestre un listado similar al siguiente:
 
#---------------------
#Usuario en el sistema 
#---------------------

#    Butterfree
#    Pikachu
#    Oddish
#    Kingler
#    Tauros

#Ante igual cantidad de accesos, ordenar en forma alfabética ascendente.

#Solución

import csv

def chequearSiVieron (nombres = 'None'):
    """ Esta función recorre el archivo csv y retorna en una lista, los usuarios que alguna vez vieron el estado de la entrega 1.
    Si en el parametro nombres se recibe A, retorna los nombres en mayuscula, si es 'a' los retorna en minuscula.
    De manera predeterminada los devuelve tal cual estaban en el archivo"""
    
    lista = []
    
    with open('log_catedras.csv', 'r', encoding = 'utf-8') as archivo_csv:
        csvreader = csv.reader(archivo_csv, delimiter = ',')
        next(csvreader) # Avanzo para no procesar el encabezado
        
        for user in csvreader:
            if ('Tarea: Entrega 1' in user[3]) and ('Se ha visualizado el estado de la entrega.' in user[4]) and (user[6].startswith('163.10')):
                
                if (nombres == 'A'):
                    user[1] = user[1].upper() 
                elif nombres == 'a':
                    user[1] = user[1].lower()
                    
                    
                lista.append(user)
        
        return lista
    
# 2.

from collections import Counter

usuarios = chequearSiVieron()

# Creo un objeto de tipo counter, donde se cuenta la cantidad de ocurrencias de cada nombre
contador_usuarios = Counter([usuario[1] for usuario in usuarios])

# Imprimo listado similar al solicitado
print("---------------------")
print("Usuario en el sistema ")
print("---------------------")
for usuario in contador_usuarios:
    print(f"    {usuario}")
    