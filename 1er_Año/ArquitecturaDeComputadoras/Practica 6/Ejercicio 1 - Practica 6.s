# 1) El siguiente programa produce la salida de un mensaje predefinido en la ventana Terminal del simulador
# WinMIPS64. Teniendo en cuenta las condiciones de control del puerto de E/S (en el resumen anterior), modifique el
# programa de modo que el mensaje a mostrar sea ingresado por teclado en lugar de ser un mensaje fijo.

.data
    caracter: .byte 0
    CONTROL: .word32 0x10000
    DATA: .word32 0x10008
    ASCII_ENTER: .byte 13

.text
    lwu $s0, CONTROL($zero) # $s1 = dirección de CONTROL
    lwu $s1, DATA($zero) # $s1 = dirección de DATA
    lbu $s2, ASCII_ENTER($zero) # $s2 = ascii del enter

    daddi $t0, $zero, 6 # $t0 = 6 -> función 6: limpiar pantalla alfanumérica
    sd $t0, 0($s1) # CONTROL recibe 6 y limpia la pantalla

loop: daddi $t0, $0, 9
      sd $t0, 0($s0) #mando 9 a control
    
      lbu $t0, 0($s1) #tomo el caracter de data, lo guardo en t0
      beq $t0, $s2, fin #Si el caracter fue ENTER, termina
      sb $t0, caracter($0) # Guarda el caracter en memoria

      daddi $s3, $zero, caracter # $t0 = dirección del caracter
      sd $s3, 0($s1) # DATA recibe el puntero al caracter

      daddi $t0, $zero, 4 # $t0 = 4 -> función 4: salida de una cadena ASCII
      sd $t0, 0($s0) # CONTROL recibe 4 e imprime carecter

      j loop

fin:  halt 