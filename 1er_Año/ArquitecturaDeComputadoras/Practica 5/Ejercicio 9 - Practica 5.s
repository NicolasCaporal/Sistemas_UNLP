# 9) *Escriba la subrutina ES_VOCAL que determina si un caracter es vocal o no, ya sea mayúscula o minúscula. 
# La rutina debe recibir el caracter y debe retornar el valor 1 si es una vocal ó 0 en caso contrario. 

.data
    caracter: .asciiz "U"
    vocales: .asciiz "AEIOUaeiou"
    resultado: .word 0

.code 
    lbu $a0, caracter ($zero)
    jal ES_VOCAL 
    sd $v0, resultado ($zero)
    halt 

ES_VOCAL: daddi $v0, $zero, 0
          daddi $t0, $zero, 0 
    loop: lbu $t1, vocales($t0)
          beqz $t1, fin
          beq $t1, $a0, true
          daddi $t0, $t0, 1
          j loop 
          true: daddi $v0, $zero, 1 
          fin: jr $ra