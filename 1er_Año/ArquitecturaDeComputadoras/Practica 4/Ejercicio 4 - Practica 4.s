# Dado el siguiente programa: 
# a) Ejecutar en simulador con Forwarding habilitado. ¿Qué tarea realiza? ¿Cuál es el resultado y dónde queda indicado?

.data
    tabla: .word 20, 1, 14, 3, 2, 58, 18, 7, 12, 11
    num: .word 7
    long: .word 10

.code
    ld r1, long(r0) #Pone la longitud de la tabla en R1. Longitud de lo que recorrió
    ld r2, num(r0) #Pone el numero en R2. Numero a buscar
    dadd r3, r0, r0 #Inicializa r3 en 0. Desplazamiento
    dadd r10, r0, r0 #Inicializa r10 en 0. Booleano para resultado

    loop:   ld r4, tabla(r3) #Guarda en R4 numero actual
            beq r4, r2, listo #Si el num actual es igual a R2 salta a listo
            daddi r1, r1, -1 #Decrementa r1
            daddi r3, r3, 8 #Pasa al siguiente
            bnez r1, loop #Si no llegó al final (r1 != 0) loopea
            j fin #Salta a fin

    listo: daddi r10, r0, 1 #Si encontró el num, pone como flag 1 en r10
    
fin: halt