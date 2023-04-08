# Desafío 1
# Queremos escribir una función que imprima sus argumentos agregando de qué tipo son.

def imprimirTipos (*args):
    for elem in args:
        print(f"{elem} es de tipo {type(elem)}")

n = (1)
t = (1,)
d = {"diccionario": 8, "tipo": 5}
c = {e for e in range(0, 20) if e%2 == 0}

imprimirTipos(n, t, d, c)
