# Desafío 5
# Queremos codificar una frase según el siguiente algoritmo:
# encripto("a") --> "b"
# encripto("ABC") --> "BCD"
# encripto("Rock2021") --> "Spdl3132"
#
# Escribir dos versiones de la solución: a) sin usar lambda b) usando lambda.

import string


abc = string.ascii_letters
abc = abc*2

nums = "0123456789"
nums = nums*2

codificarAbc = (lambda c: abc[abc.index(c) + 1])
codificarNums = (lambda c: nums[nums.index(c) + 1])

cifrado = ""

frase = input("Ingrese cadena a codificar: ")

for c in frase:
    if c in abc:
        cifrado += codificarAbc(c)
    elif c in nums:
        cifrado += codificarNums(c)

print(cifrado)