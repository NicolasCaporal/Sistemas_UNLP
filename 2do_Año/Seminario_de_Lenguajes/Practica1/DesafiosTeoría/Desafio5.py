#  Quinto desafío
# • Dadas dos cadenas ingresadas desde el teclado, imprimir aquella que tenga más caracteres.

print('Ingrese 2 cadenas de texto. \n Vamos a comparar cual es más larga. \n')

cadena1 = input('1: ')

cadena2 = input('2: ')

if (len(cadena1) > len(cadena2)):
    print('\nLa primer cadena es mas larga.')
elif (len(cadena1) < len(cadena2)):
    print('\nLa segunda cadena es mas larga')
else: 
    print('\nTienen la misma longitud.')