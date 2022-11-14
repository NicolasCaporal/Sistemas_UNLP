# 11)Escribir una subrutina que reciba como argumento una tabla de números terminada en 0. La subrutina debe contar la
# cantidad de números que son impares en la tabla. Ésta condición se debe verificar usando la subrutina ES_IMPAR. La
# subrutina ES_IMPAR debe devolver 1 si el número es impar y 0 si no lo es.

.data 
    tabla: .word 3, 4, 5, 8, 3, 7, 11, 23, 54, 0
    resultado: .word 0

.code 
    daddi $sp, $0, 1024
    daddi $a0, $zero, tabla 
    jal contar_impares
    ld $v0, resultado ($0)
    halt 


contar_impares: daddi $v0, $0, 0
                dadd $s0, $0, $a0
                daddi $sp, $sp, -8
                sd $s0, 0($sp)
                daddi $sp, $sp, -8
                sd $ra, 0($sp)
          loop: ld $a1, 0($s0)
                beqz $a1, fin 
                jal es_impar 
                beqz $v1, siguiente
                daddi $v0, $v0, 1
                siguiente: daddi $s0, $s0, 8
                j loop
                fin: ld $ra, 0($sp)
                daddi $sp, $sp, 8
                ld $a0, 0($sp)
                daddi $sp, $sp, 8
                jr $ra


es_impar: daddi $t1, $zero, 1
          and $v1, $a1, $t1
          jr $ra