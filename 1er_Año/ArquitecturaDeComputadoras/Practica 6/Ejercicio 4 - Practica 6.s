# 4) Escriba un programa que solicite el ingreso por teclado de una clave (sucesión de cuatro caracteres) utilizando la
# subrutina char de ingreso de un carácter. Luego, debe comparar la secuencia ingresada con una cadena almacenada
# en la variable clave. Si las dos cadenas son iguales entre si, la subrutina llamada respuesta mostrará el texto
# “Bienvenido” en la salida estándar del simulador (ventana Terminal). En cambio, si las cadenas no son iguales, la
# subrutina deberá mostrar “ERROR” y solicitar nuevamente el ingreso de la clave.

.data 
    CONTROL: .word 0x10000
    DATA: .word 0x10008
    clave: .asciiz "admi"
    bienvenido: .asciiz "Bienvenido :)"
    error: .asciiz "ERROR"
    enter: .byte 13 
    error2: .asciiz "Intente nuevamente: "
    clave2: .asciiz 0


.code 
                  lwu $s0, CONTROL($zero)
                  lwu $s1, DATA($zero)

ingrese_clave:    daddi $s2, $zero, 4
                  daddi $s3, $zero, 0   
                  bucle: jal char 
                  sb $v0, clave2($s3)
                  daddi $s3, $s3, 1
                  daddi $s2, $s2, -1
                  bnez $s2, bucle    

                  daddi $a1, $zero, clave 
                  daddi $a2, $zero, clave2 
                  jal compara   

                  daddi $a1, $zero, bienvenido
                  daddi $a2, $zero, error
                  daddi $a3, $v1, 0
                  jal imprimir_respuesta  

                  halt



char: daddi $t0, $0, 9
      sd $t0, 0($s0)
      lbu $v0, 0($s1)
      jr $ra 



compara: daddi $v1, $zero, 0
         daddi $t0, $zero, 0
         daddi $t4, $t4, 4
         loop: dadd $a1, $a1, $t0 
         dadd $a2, $a2, $t0 
         lbu $t2, 0($a1) 
         lbu $t3, 0($a2)
         bne $t2, $t3, fin 
         daddi $t0, $t0, 1 
         daddi $t4, $t4, -1
         beqz $t4, true 
         j loop
 
         true: daddi $v1, $zero, 1
         fin: jr $ra



imprimir_respuesta: daddi $v0, $zero, 0
                    daddi $t1, $zero, 4
                    beqz $a3, denegado
          
          admitido: sd $a1, 0($s1)
                    sd $t1, 0($s0)
                    daddi $v0, $zero, 1
                    j fin_impresion
          
          denegado: sd $a2, 0($s1)
                    sd $t1, 0($s0)
                    daddi $a2, $a2, 8
                    sd $a2, 0($s1)
                    sd $t1, 0($s0)
                    daddi $a2, $a2, 8
                    sd $a2, 0($s1)
                    sd $t1, 0($s0)

        fin_impresion: jr $ra