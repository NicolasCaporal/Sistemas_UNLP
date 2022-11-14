# 0) Usando la subrutina escrita en el ejercicio anterior, escriir la subrutina CONTAR_VOC, que recibe una cadena
# terminada en cero y devuelve la cantidad de vocales que tiene esa cadena.

.data 
    cadena: .asciiz "ABCDEFGHIJK"
    vocales: .asciiz "AEIOUaeiou"
    resultado: .word 0

.code 
    daddi $sp, $zero, 1024 
    daddi $a0, $zero, cadena 
    jal CONTAR_VOC  
    ld $v1, resultado($0)

CONTAR_VOC:  daddi $v1, $zero, 0 
             daddi $t2, $0, 0 
             dadd $s0, $zero, $a0 
             daddi $sp, $sp, -8 
             sd $ra, 0($sp) 
             daddi $sp, $sp, -8 
             sd $s0, 0($sp) 

loop_contar: lbu $a0, 0 ($s0) 
             beqz $a0, fin_contar
             daddi $ra, $0, 0
             jal ES_VOCAL 
             daddi $s0, $s0, 1 
             beq $v0, $zero, loop_contar
             daddi $v1, $v1, 1 
             j loop_contar 
             fin_contar: ld $s0, 0($sp) 
             daddi $sp, $sp, 8 
             sd $ra, 0($sp) 
             daddi $sp, $sp, 8 
             jr $ra



ES_VOCAL: daddi $v0, $zero, 0
          daddi $t0, $zero, 0 
    loop: lbu $t1, vocales ($t0)
          beqz $t1, fin
          beq $t1, $a0, true
          daddi $t0, $t0, 1
          j loop 
          true: daddi $v0, $zero, 1 
          fin: daddi $ra, $zero, 60
           jr $ra