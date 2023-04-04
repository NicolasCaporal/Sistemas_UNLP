# Dada una lista de palabras, generar otra lista con aquellos verbos en infinitivo. 
# (solo vamos a comprobar que terminen en “ar”, “er” o “ir”)

palabras = ["saltar", "libro", "nadar", "perro", "lápiz", "mesa", "casa", "leer", "nube", "cantar"]
verbos = [palabra for palabra in palabras if palabra.endswith(("ar", "er", "ir"))]

print(verbos)