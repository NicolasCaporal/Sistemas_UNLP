# 3. Modifíque el programa dado para que:
# • Cuente con las operaciones multiplicación (*) y división (/).
# • Imprima al lado o debajo de cada respuesta si el resultado del usuario fué correcto o incorrecto.
# • Además del tiempo informe al finalizar la cantidad de resultados correctos e incorrectos que tuvo el usuario.


from random import choice, randrange
from datetime import datetime


# Operadores posibles
operators = ["+", "-", "*", "/"]

# Cantidad de cuentas a resolver
times = 5

# Contador inicial de tiempo.
# Esto toma la fecha y hora actual.
init_time = datetime.now()

# Inicializo contador de respuestas correctas en 0
correct_answers = 0
wrong_answers = 0

print(f"¡Veremos cuanto tardas en responder estas {times} operaciones!")
for i in range(0, times):
    # Se eligen números y operador al azar
    number_1 = randrange(10)
    number_2 = randrange(10)
    operator = choice(operators)

    # Evitamos la divison por 0
    if (operator == '/') and (number_2 == 0):
        number_2 = randrange(9)+1

    # Se imprime la cuenta.
    print(f"\n {i+1}- ¿Cuánto es {number_1} {operator} {number_2}?")
    # Le pedimos al usuario el resultado
    result = float(input("Resultado: "))

    # Verificamos si la respuesta del usuario es correcta
    if operator == "+":
        correct_result = number_1 + number_2
    elif operator == "-":
        correct_result = number_1 - number_2
    elif operator == "*":
        correct_result = number_1 * number_2
    else: # operador es "/"
        correct_result = number_1 / number_2

    # Imprime la verificación
    if result == correct_result:
        print("¡Correcto!")
        correct_answers += 1
    else:
        print("Incorrecto.")
        wrong_answers += 1

# Al terminar toda la cantidad de cuentas por resolver.
# Se vuelve a tomar la fecha y la hora.
end_time = datetime.now()

# Restando las fechas obtenemos el tiempo transcurrido.
total_time = end_time - init_time

# Mostramos ese tiempo en segundos.
print(f"\n Tardaste {total_time.seconds} segundos.")

# Mostramos cantidad de respuestas correctas e incorrectas.
print(f" Respuestas correctas: {correct_answers}")
print(f" Respuestas incorrectas: {wrong_answers}")