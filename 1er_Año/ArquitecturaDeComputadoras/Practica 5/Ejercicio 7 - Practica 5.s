# 7) Escriba una subrutina que reciba como parámetros un número positivo M de 64 bits, la dirección del comienzo de una
# tabla que contenga valores numéricos de 64 bits sin signo y la cantidad de valores almacenados en dicha tabla.
# La subrutina debe retornar la cantidad de valores mayores que M contenidos en la tabla. 

.data 
    M: .word 25
    tabla: .word 26, 06, 2011, 15, 20, 30, 80, 2
    longitud: .word 8
    resultado: .word -1

.code 
    ld $a0, M ($zero)
    daddi $a1, $zero, tabla 
    ld $a2, longitud ($zero)  

    jal cant_mayores_M 

    sd $v0, resultado ($zero) 

    halt

    cant_mayores_M: dadd $v0, $zero, $zero 
                    repetir: beqz $a2, fin
                             ld $t0, 0($a1)
                             slt $t1, $a0, $t0 
                             beqz $t1, siguiente
                             daddi $v0, $v0, 1
                             siguiente: daddi $a1, $a1, 8
                             daddi $a2, $a2, -1
                             j repetir 
    fin: jr $ra