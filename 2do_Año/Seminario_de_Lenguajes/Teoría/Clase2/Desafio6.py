# Desafio 6
# Queremos definir una función que, dada una cadena de caracteres, retorne la cantidad
# de vocales abiertas, vocales cerradas y la cantidad total de caracteres de la misma

def data_cadena (cadena):
    """ Esta funcion recibe como parametro un String. Analiza el string, y retorna la cantidad de vocales abiertas
    la cantidad de vocales cerradas y la cantidad total de caracteres. Retorna los 3 datos, en ese orden, en una tupla"""

    cadena = cadena.lower()
    cant_abiertas = cadena.count("a") + cadena.count("e") + cadena.count("o")
    cant_cerradas = cadena.count("i") + cadena.count("u")
    cant_char = cadena.__len__()

    return cant_abiertas, cant_cerradas, cant_char


cadena = "Seremos menos malos que los demas. -Juan Roman Riquelme"
resultado = data_cadena(cadena)
print(resultado)