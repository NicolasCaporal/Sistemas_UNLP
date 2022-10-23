# 8) * Escribir un programa que multiplique dos números enteros utilizando sumas repetidas
# El programa debe estar optimizado para su ejecución con la opción Delay Slot habilitada. 

.data
    NUM1: .word 3
    NUM2: .word 5
    RES: .word 0;

.code 
    ld r1, NUM1(r0)
    ld r3, RES(r0)
    ld r2, NUM2(r0)
    beqz r1, fin
    beqz r2, fin

    loop: dadd r3, r3, r1
          daddi r2, r2, -1
          nop
          bnez r2, loop

    fin: sd r3, RES(r0)

halt