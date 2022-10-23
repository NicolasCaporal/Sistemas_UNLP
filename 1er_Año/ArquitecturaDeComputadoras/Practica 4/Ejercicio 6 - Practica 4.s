# 6) Escribir un programa que lea tres números enteros A, B y C de la memoria de datos y determine cuántos de ellos son iguales
# entre sí (0, 2 o 3). El resultado debe quedar almacenado en la dirección de memoria D. 

.data 
    A: .word 2
    B: .word 8
    C: .word 2
    D: .word -1

.code 
    dadd r10, r0, r0 # Inicializo R10 en 0 (Contador resultado)

    ld r1, A(r0)
    ld r2, B(r0) # Cargo numeros en registros
    ld r3, C(r0)

    bne r1, r2, ADistintoB #Comparo A y B

    AigualB: daddi r10, r10, 2 
            bne r1, r3, fin # A y B son iguales, y los comparo con C
            
            TresIguales: daddi r10, r10, 1
                         j fin 

    ADistintoB: bne r2, r3, BDistintoC # Comparo B y C
                daddi r10, r10, 2
                j fin 

    BDistintoC: bne r1, r3, fin  # Comparo A y C
                daddi r10, r10, 2
                j fin 

    fin: sd r10, D(r0) # Guardo el resultado en R10

    halt

    

