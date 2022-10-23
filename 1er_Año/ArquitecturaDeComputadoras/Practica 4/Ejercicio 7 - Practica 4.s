# 7) * Escribir un programa que recorra una TABLA de diez números enteros y determine cuántos elementos son mayores que X.
# El resultado debe almacenarse en una dirección etiquetada CANT. El programa debe generar además otro arreglo llamado RES
# cuyos elementos sean ceros y unos. Un ‘1’ indicará que el entero correspondiente en el arreglo TABLA es mayor que X,
# mientras que un ‘0’ indicará que es menor o igual. 

.data 
    CANT: .word 0
    X: .word 10
    TABLA: .word 26, 06, 2011, 0,  11, 10, 9, 2, 5, 30
    RES: .word -1

.code
    dadd r1, r0, r0 #R1 - Inicializo contador en 0, para el resultado final
    daddi r2, r0, 10 #R2 - Longitud del arreglo
    dadd r3, r0, r0 #R3 - Para el desplazamiento
    ld r4, X(r0) #R4 - Guardo el numero X para las comparaciones 
    dadd r5, r0, r0 #R6 - Inicializo en 0, para guardar el resuldo de la comparacion

    loop: ld r6, TABLA(r3) #Guarda el NumActual en R6
    slt r5, r4, r6 #Si 10 < NumActual, R5 = 1
    beqz r5, EraMenor
    #EraMayor
    daddi r1, r1, 1 #Incremento contador en 1
    sd r5, RES(r3)

    EraMenor: daddi r2, r2, -1
              daddi r3, r3, 8 #Paso al siguiente
              bnez r2, loop 

    sd r1, CANT(r0) #Guardo resultado en CANT

    halt