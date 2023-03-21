# Cuarto desafío
# • Dado un caracter ingresado por el teclado, queremos saber si es una comilla o no.
# • ¿Hay algún problema?

char = input('Ingrese un caracter: ')

if (char == '\''):
    print('Es comilla simple')
elif (char == '\"'):
    print('Es comilla doble')
else:
    print('No es comilla')
