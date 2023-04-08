# Desafío 5
# Queremos codificar una frase según el siguiente algoritmo:
# encripto("a") --> "b"
# encripto("ABC") --> "BCD"
# encripto("Rock2021") --> "Spdl3132"
#
# Escribir dos versiones de la solución: a) sin usar lambda b) usando lambda.

import string

def codificar (cadena):
    abc = string.ascii_letters
    abc = abc*2

    nums = "0123456789"
    nums = nums*2

    cifrado = ""
    for c in cadena:
        if c in abc:
            cifrado += abc[abc.index(c) + 1]
        elif c in nums:
            cifrado += nums[nums.index(c) + 1]

    return cifrado

frase = input("Ingrese cadena a codificar: ")
print(codificar(frase))