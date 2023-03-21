# Tercer desafío
# • Dado una letra ingresada por el teclado, queremos saber si es mayúscula o minúscula.

letter = input('Ingrese una letra: ')

if (letter >= 'a' and letter <='z'):
    print('Es minuscula')
elif (letter >= 'A' and letter <='Z'):
    print('Es mayuscula')
else:
    print('¡¡ERROR!!')