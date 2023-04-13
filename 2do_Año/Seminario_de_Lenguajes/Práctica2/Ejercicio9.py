# 9. Escriba un programa que solicite por teclado una palabra y calcule el valor de la misma según la
# tabla de valores dada, del juego Scrabble (ver PDF)
# Tenga en cuenta qué estructura elige para guardar estos valores en Python

# Ejemplo 1
#   • Palabra: "solo"
#   • valor: 4
# Ejemplo 2
#   • Palabra: "tomate"
#   • valor: 8

palabra = input('Palabra: ').lower()

valores = {'a': 1, 'e': 1, 'i': 1, 'o': 1, 'u': 1, 'l': 1, 'n': 1, 'r': 1, 's': 1, 't': 1,
           'd': 2, 'g': 2, 'b': 3, 'c': 3, 'm': 3, 'p': 3, 'f': 4, 'h': 4, 'v': 4, 'w': 4,
           'y': 4, 'k': 5, 'j': 8, 'x': 8, 'q': 10, 'z': 10}

valor = 0

for letra in palabra:
    valor += valores[letra]

print(f'Valor: {valor}')

