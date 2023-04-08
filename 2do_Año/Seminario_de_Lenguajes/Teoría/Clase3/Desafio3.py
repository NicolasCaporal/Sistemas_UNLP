# Desafío 3
# Queremos implementar una función que dada una cadena de texto, retorne las palabras
# que contiene en orden alfabético.

def ordenar(cadena):
    """ Implementación usando sort"""

    lista = cadena.split()
    lista.sort(key=str.lower)
    return lista

txt = """ En Argentina nací, tierra de Diego y Leonel
             De los pibes de Malvinas que jamás olvidaré """

print(ordenar(txt))