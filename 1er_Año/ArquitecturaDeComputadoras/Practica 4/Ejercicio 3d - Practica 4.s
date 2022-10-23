# d) Modificar el programa para que almacene en un arreglo en memoria de datos los contenidos parciales del registro r1 

.data
    A: .word 1
    B: .word 3
    ARREGLO: .word 0

.code

    ld r2, B(r0) #Pone B (3) en R2
    dadd r3, r0, r0 #Pone 0 en r3
    ld r1, A(r0) #Pone A (1) en R1
 
    loop: sd r1, ARREGLO (r3) 
          dsll r1, r1, 1 #Desplaza R1 a la izquierda
          daddi r2, r2, -1 #Resta uno a R2
          daddi r3, r3, 8 #Incrementa r3
          bnez r2, loop #Mientras R2 != 0, salta a Loop

halt