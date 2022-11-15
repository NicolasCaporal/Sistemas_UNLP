# 6) El siguiente programa produce una salida estableciendo el color de un punto de la pantalla gráfica (en la ventana
# Terminal del simulador WinMIPS64). Modifique el programa de modo que las coordenadas y color del punto sean
# ingresados por teclado.

.data
    coorX: .byte 24 ; coordenada X de un punto
    coorY: .byte 24 ; coordenada Y de un punto
    color: .byte 255, 0, 255, 0 ; color: máximo rojo + máximo azul => magenta
    CONTROL: .word32 0x10000
    DATA: .word32 0x10008

.text
    lwu $s6, CONTROL($zero) 
    lwu $s7, DATA($zero) 

    daddi $t0, $zero, 7 
    sd $t0, 0($s6) 

    daddi $t0, $zero, 8
    sb $t0, 0($s6)
    lbu $s0, 0($s7)
    sb $s0, coorX($0)

    daddi $t1, $zero, 8
    sb $t1, 0($s6)
    lbu $s1, 0($s7)
    sb $s1, coorY($0)
    

    daddi $a0, $zero, 4
    daddi $a1, $zero, 0

    loop: daddi $t2, $zero, 8
          sd $t2, 0($s6)
          lbu $s2, 0($s7)
          sb $s2, color($a1)
          daddi $a1, $a1, 1
          bne $a0, $a1, loop
    
    sb $s0, 5($s7) 
    sb $s1, 4($s7) 
    lwu $s2, color($0)
    sw $s2, 0($s7) 

    daddi $t0, $zero, 5 
    sd $t0, 0($s6) 

halt