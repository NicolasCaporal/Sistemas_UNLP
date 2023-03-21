# Segundo desafío
# • Queremos ingresar un número desde el teclado e imprimir si es múltiplo de 2, 3 o 5.
# • Pista: Python tiene otra forma de la sentencia condicional: if-elif-else.

num = int(input('Ingrese un numero: '))

if (num % 2 == 0):
    print('Es multiplo de 2!')
elif (num % 3 == 0):
    print('Es multiplo de 3!')
elif (num % 5 == 0):
    print('Es multiplo de 5!')
else:
    print('No es multiplo de 2, ni de 3, ni de 5.')