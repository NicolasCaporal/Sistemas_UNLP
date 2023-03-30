# 4. Para la aceptación de un artículo en un congreso se definen las siguientes especificaciones que
# deben cumplir y recomendaciones de escritura:
# • título: 10 palabras como máximo
# • cada oración del resumen:
# ▪ hasta 12 palabras: fácil de leer
# ▪ entre 13-17 palabras: aceptable para leer
# ▪ entre 18-25 palabras: difícil de leer
# ▪ mas de 25 palabras: muy difícil
# Dado un artículo en formato string, defina si cumple las especificaciones del título y cuántas oraciones
# tiene de cada categoría. El formato estándar en que recibe el string tiene la siguiente forma:

evaluar = """ título: Experiences in Developing a Distributed Agent-based Modeling Toolkit with Python.
resumen: Distributed agent-based modeling (ABM) on high-performance
computing resources provides the promise of capturing unprecedented details
of large-scale complex systems. However, the specialized knowledge required
for developing such ABMs creates barriers to wider adoption and utilization.
Here we present our experiences in developing an initial implementation of
Repast4Py, a Python-based distributed ABM toolkit. We build on our
experiences in developing ABM toolkits, including Repast for High
Performance Computing (Repast HPC), to identify the key elements of a useful
distributed ABM toolkit. We leverage the Numba, NumPy, and PyTorch packages
and the Python C-API to create a scalable modeling system that can exploit
the largest HPC resources and emerging computing architectures.
"""

titulo = evaluar.split('\n')[0]
cant_palabras_titulo = len(titulo.split()[1:])

contadores = [0, 0, 0, 0]
oraciones = evaluar.split('.')[1:]

if cant_palabras_titulo <= 10:
    print('Titulo: ok')
else: 
    print('Titulo: not ok')


for oracion in oraciones:
    palabras = oracion.split()
    cant_palabras = len(palabras)
    if cant_palabras <= 12:
        contadores[0] += 1
    elif cant_palabras >= 13 and cant_palabras <= 17:
        contadores[1] += 1
    elif cant_palabras >= 18 and cant_palabras <= 25:
        contadores[2] += 1
    else:
        contadores[3] += 1

print(f"""Cantidad de oraciones fáciles de leer: {contadores[0]}
Aceptables para leer: {contadores[1]}
Dificil de leer: {contadores[2]}
Muy difícil de leer: {contadores[3]}""")