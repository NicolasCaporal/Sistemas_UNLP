# Sexto desafío
# • Determinar si una palabra ingresada desde el teclado es un sustantivo propio.
# – Solo vamos a controlar si la palabra empieza con una letra mayúscula

palabra = input('Ingrese una palabra: ')

if (palabra[0] >='A' and palabra[0] <= 'Z'):
    print('Es sustantivo propio.')
else:
    print('No es sustantivo propio.')