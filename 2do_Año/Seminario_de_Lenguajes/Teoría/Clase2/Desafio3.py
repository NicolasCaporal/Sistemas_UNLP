# Desafio 3
# Queremos procesar las duraciones de las películas de Harry Potter.
# Queremos saber: 
#   - cuál fue la duración, en minutos, promedio; 
#   - cuántas películas duran más que el promedio, en minutos.

def duracion_promedio(duracion_peliculas):
    return sum(duracion_peliculas) / len(duracion_peliculas)

def mas_promedio(duracion_peliculas, promedio):
    cant = 0
    for peli in duracion_peliculas:
        if (peli > promedio):
            cant += 1
    return cant

duracion_peliculas = [152, 161, 142, 157, 138, 153, 146, 130]

promedio = duracion_promedio(duracion_peliculas)
print(f"El promedio de duracion es {promedio}")

cant_mas_promedio = mas_promedio(duracion_peliculas, promedio)
print(f"Hay {cant_mas_promedio} que duran mas que el promedio")