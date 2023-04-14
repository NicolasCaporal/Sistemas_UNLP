# 10. Dada una lista de nombres de estudiantes y dos listas con sus notas en un curso, escriba un
# programa que manipule dichas estructuras de datos para poder resolver los siguientes puntos:
# A. Generar una estructura todas las notas sin que se repitan, sin guardar los nombres de los
# estudiantes.
# B. Calcular el promedio de notas de cada estudiante.
# C. Calcular el promedio general del curso.
# D. Identificar al estudiante con la nota promedio más alta.
# E. Identificar al estudiante con la nota más baja.
# Nota:
# • Las 3 estructuras están ordenadas de forma que los elementos en la misma posición corresponden
# a un mismo alumno.
# • Realizar funciones con cada item

def generarListaSinRepeticiones(cadena):
    return set(cadena)

def calcularPromedios(notas_1, notas_2):
    notasXEstudiante = list(zip(notas_1, notas_2))
    promedios = list(map(lambda notas: sum(notas)/2, notasXEstudiante))
    return promedios

def calcularPromedioGeneral(notas):
    return (sum(notas)/len(notas))

def estudianteMejorPromedio(nombres, promedios):
    mejorPromedio = max(promedios)
    i = promedios.index(mejorPromedio)
    return nombres[i] 

def estudiantePeorNota(nombres, notas):
    peorNota = min(notas)
    i = notas.index(peorNota)
    return nombres[i]

nombres = ''' 'Agustin', 'Alan', 'Andrés', 'Ariadna', 'Bautista', 'CAROLINA', 'CESAR', 'David',
'Diego', 'Dolores', 'DYLAN', 'ELIANA', 'Emanuel', 'Fabián', 'Facundo', 'Francsica',
'FEDERICO', 'Fernanda', 'GONZALO', 'Gregorio', 'Ignacio', 'Jonathan', 'Joaquina', 'Jorge',
'JOSE', 'Javier', 'Joaquín' , 'Julian', 'Julieta', 'Luciana','LAUTARO', 'Leonel', 'Luisa',
'Luis', 'Marcos', 'María', 'MATEO', 'Matias', 'Nicolás', 'Nancy', 'Noelia', 'Pablo',
'Priscila', 'Sabrina', 'Tomás', 'Ulises', 'Yanina' '''

notas_1 = [81, 60, 72, 24, 15, 91, 12, 70, 29, 42, 16, 3, 35, 67, 10, 57, 11, 69, 12,
13, 86, 48, 65, 51, 41, 87, 43, 10, 87, 91, 15, 44, 85, 73, 37, 42, 95, 18,
74, 60, 9, 65, 93, 63, 74]

notas_2 = [30, 95, 28, 84, 84, 43, 66, 51, 4, 11, 58, 10, 13, 34, 96, 71, 86, 37, 64,
87, 14, 14, 49, 27, 55, 69, 77, 59, 57, 40, 96, 24, 30, 73, 95, 19, 47, 15,
39, 15, 74, 33, 57, 10]

todasNotas = generarListaSinRepeticiones(notas_1 + notas_2) 

promedios = calcularPromedios(notas_1, notas_2)
print(promedios)

promedioGeneral = calcularPromedioGeneral(notas_1 + notas_2)
print(f"Promedio general: {promedioGeneral}")




nombres = nombres.replace("'", " ")
listaNombres = nombres.split(',')
listaNombres = [x.strip() for x in listaNombres]

nombreMejorPromedio = estudianteMejorPromedio(listaNombres, promedios)
print(f"Alumno con mejor promedio: {nombreMejorPromedio}")

nombrePeorNota = estudiantePeorNota(listaNombres, notas_1 + notas_2)
print(f"Alumno peor nota: {nombrePeorNota}")