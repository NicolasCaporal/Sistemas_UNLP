# 5. Dada una frase y un string ingresados por teclado (en ese orden), genere una lista de palabras, y
# sobre ella, informe la cantidad de palabras en las que se encuentra el string. No distingir entre
# mayúsculas y minúsculas.

frase = input('Ingrese una frase: ').lower()
palabra = input('Ingrese una palabra a contar: ').lower()
print(f'La palabra {palabra} aparece {frase.count(palabra)} veces en la frase')