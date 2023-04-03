# Escribir un programa que ingrese 4 palabras desde el teclado e imprima aquellas que
# contienen la letra “r”. 

for i in range(4):
    palabra = input("Ingrese una palabra: ")
    if "r" in palabra.lower():
        print(palabra + "\n")