# Desafío 2
# Ingresar palabras desde el teclado hasta ingresar la palabra FIN. Imprimir aquellas
# que empiecen y terminen con la misma letra. - 
# ¿Qué estructura de control deberíamos utilizar para realizar esta iteración? ¿Podemos utilizar la sentencia for?

print("Ingrese palabras. Para finalizar ingrese FIN")
palabra = input("-> ")
while palabra != "FIN":
    ultima = palabra.__len__()
    if (palabra[0].lower() == palabra[ultima-1].lower()):
            print(palabra)
    palabra = input("-> ")
