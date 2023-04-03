# Último desafío
# • Escribir un programa que ingrese desde teclado una cadena de caracteres e imprima cuántas letras “a” contiene

cadena = input('Ingrese una cadena de texto: ')

contador = 0

for char in cadena:
    if (char == 'a'):
        contador += 1

print(f'La cadena ingresada tiene {contador} letras "a" minuscula')