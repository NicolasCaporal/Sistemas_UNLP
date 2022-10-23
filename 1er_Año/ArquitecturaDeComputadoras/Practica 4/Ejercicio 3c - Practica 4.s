# c) Reordenar las instrucciones para que la cantidad de RAW sea ‘0’ en la ejecución del programa (Forwarding habilitado)

.data
    A: .word 1
    B: .word 3

.code
    ld r2, B(r0) #Pone B (3) en R2
    ld r1, A(r0) #Pone A (1) en R1 
    
    loop: daddi r2, r2, -1 #Resta uno a R2
          dsll r1, r1, 1 #Desplaza R1 a la izquierda
          bnez r2, loop #Mientras R2 != 0, salta a Loop
halt