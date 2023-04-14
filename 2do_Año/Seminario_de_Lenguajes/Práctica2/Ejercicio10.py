# 10. Dada una lista de nombres de estudiantes y dos listas con sus notas en un curso, escriba un
# programa que manipule dichas estructuras de datos para poder resolver los siguientes puntos:
# A. Generar una estructura con todas las notas relacionando el nombre del estudiante con las
# notas. Utilizar esta estructura para la resolución de los siguientes items.
# B. Calcular el promedio de notas de cada estudiante.
# C. Calcular el promedio general del curso.
# D. Identificar al estudiante con la nota promedio más alta.
# E. Identificar al estudiante con la nota más baja.

# Nota:
#   • Las 3 estructuras están ordenadas de forma que los elementos en la misma posición corresponden a un mismo alumno.
#   • Realizar funciones con cada item

def generarDiccionarioNotas(listaNombres, notas_1, notas_2):
    """ Esta función recibe 3 parametros. Una lista de nombres, y dos listas de notas
        Retorna un diccionario de la forma {Nombre: (nota1, nota2)}"""
    
    notas = list(zip(notas_1, notas_2))
    return dict(zip(listaNombres, notas))


def generarDiccionarioPromedios(estudiantes):
    """ Esta funcion recibe un diccionario de la forma {Nombre: (nota1, nota2)}
    Calcula el promedio de las 2 notas de cada estudiante.
    Retorna un diccionario de la forma {Nombre: promedio}"""

    promedios = {nombre: sum(notas)/len(notas) for nombre, notas in estudiantes.items()}
    return promedios


def calcularPromedioGeneral(promedios):
    """ Esta funcion recibe un diccionario del tipo {Nombre: promedio}
    Retorna un float redondeado a 2 decimales con el promedio general"""

    suma = sum(promedios.values())
    cantidadAlumnos = len(promedios)
    promedio = suma / cantidadAlumnos

    return round(promedio, 2)


def estudianteMejorPromedio(promedios):
    """ Esta funcion recibe un diccionario del tipo {Nombre: promedio}
    Retorna el Nombre del estudiante con el promedio más alto"""

    mejor_promedio = max(promedios.items(), key = lambda e: e[1])
    return mejor_promedio[0]


def estudianteNotaMasBaja(notas):
    """ Esta función recibe un diccionario del tipo {Nombre: (nota1, nota2)
    Retorna el Nombre del estudiante que entre alguna de sus dos notas, tenga la nota más baja"""
    peor_nota = min(notas, key=lambda e: min(notas[e]))
    return peor_nota


nombres = ''' 'Agustin', 'Alan', 'Andrés', 'Ariadna', 'Bautista', 'CAROLINA', 'CESAR', 'David',
'Diego', 'Dolores', 'DYLAN', 'ELIANA', 'Emanuel', 'Fabián', 'Facundo', 'Francsica',
'FEDERICO', 'Fernanda', 'GONZALO', 'Gregorio', 'Ignacio', 'Jonathan', 'Joaquina', 'Jorge',
'JOSE', 'Javier', 'Joaquín' , 'Julian', 'Julieta', 'Luciana','LAUTARO', 'Leonel', 'Luisa',
'Luis', 'Marcos', 'María', 'MATEO', 'Matias', 'Nicolás', 'Nancy', 'Noelia', 'Pablo',
'Priscila', 'Sabrina', 'Tomás', 'Ulises', 'Yanina' '''

notas_1 = [81, 60, 72, 24, 15, 91, 12, 70, 29, 42, 16, 3, 35, 67, 10, 57, 11, 69,
12, 77, 13, 86, 48, 65, 51, 41, 87, 43, 10, 87, 91, 15, 44,
85, 73, 37, 42, 95, 18, 7, 74, 60, 9, 65, 93, 63, 74]

notas_2 = [30, 95, 28, 84, 84, 43, 66, 51, 4, 11, 58, 10, 13, 34, 96, 71, 86, 37,
64, 13, 8, 87, 14, 14, 49, 27, 55, 69, 77, 59, 57, 40, 96, 24, 30, 73,
95, 19, 47, 15, 31, 39, 15, 74, 33, 57, 10]

#A
nombres = nombres.replace("'", " ") # Limpio el string de '
listaNombres = [nombre.strip() for nombre in nombres.split(',')] # Creo una lista de nombres, y eliminio los espacios
diccionario_notas_estudiantes = generarDiccionarioNotas(listaNombres, notas_1, notas_2)

#B
diccionario_promedios = generarDiccionarioPromedios(diccionario_notas_estudiantes)

#C
print(f'Promedio general del curso: {calcularPromedioGeneral(diccionario_promedios)}')

#D
print(f'Estudiante con mejor promedio: {estudianteMejorPromedio(diccionario_promedios)}')

#E
print(f'Estudiante con la nota mas baja: {estudianteNotaMasBaja(diccionario_notas_estudiantes)}')
