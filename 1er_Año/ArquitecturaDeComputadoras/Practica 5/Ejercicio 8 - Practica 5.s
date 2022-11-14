#{8) *Escriba una subrutina que reciba como parámetros las direcciones del comienzo de dos cadenas terminadas en cero y
#retorne la posición en la que las dos cadenas difieren. En caso de que las dos cadenas sean idénticas, debe retornar -1. }

.data
    cadena1: .asciiz "ABCDEFGH"
    cadena2: .asciiz "ABCD!FGH"
    resultado: .word 0

.code
    daddi $a0, $zero, cadena1 
    daddi $a1, $zero, cadena2 
    jal compara 
    sd $v0, resultado($zero)
    halt

compara: daddi $v0, $zero, 1
         loop: lbu $t0, 0($a0)
         lbu $t1, 0($a1) 
         beqz $t0, fin
         beqz $t1, difieren
         bne $t0, $t1, difieren 
         daddi $v0, $v0, 1
         daddi $a0, $a0, 1
         daddi $a1, $a1, 1
         j loop
         fin: bnez $t1, difieren
         daddi $v0, $0, -1
         difieren: jr $ra