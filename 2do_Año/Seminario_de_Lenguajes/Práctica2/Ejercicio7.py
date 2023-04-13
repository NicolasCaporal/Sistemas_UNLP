# 7. Dada una frase identificar mayúsculas, minúsculas y caracteres no letras y contar la cantidad de
# palabras sin distinguir entre mayúsculas y minúsculas, en la frase.

import string

frase = """
 El salario promedio de un hombre en Argentina es de $60.000, mientras que 
el de una mujer es de $45.000. Además, las mujeres tienen menos 
posibilidades de acceder a puestos de liderazgo en las empresas.
 """



palabras = frase.split()
mayusuculas = 0
minusculas = 0
especiales = 0
for palabra in palabras:
    if palabra[0].islower():
        minusculas += 1
    elif palabra[0].isupper():
        mayusuculas += 1
    else:
        especiales += 1

print(f"""\nHabía {len(palabras)} palabras en total
        De las cuales:
        {minusculas} empezaban con minuscula
        {mayusuculas} empezaban con mayuscula 
        {especiales} empezaban con caracteres especiales \n""")