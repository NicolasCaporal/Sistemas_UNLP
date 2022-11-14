# 3) Escriba un programa que realice la suma de dos números enteros (de un dígito cada uno) utilizando dos subrutinas: La
# denominada ingreso del ejercicio anterior (ingreso por teclado de un dígito numérico) y otra denominada
# resultado, que muestre en la salida estándar del simulador (ventana Terminal) el resultado numérico de la suma de
# los dos números ingresados (ejercicio similar al ejercicio 7 de Práctica 2). 

.data 
    CONTROL: .word 0x10000
    DATA: .word 0x10008
    num1: .word 0
    mas: .asciiz " + "
    num2: .word 0
    igual: .asciiz " = "
    res: .word 0

.code 
    lwu $s0, CONTROL($zero)
    lwu $s1, DATA($zero)

    jal ingreso 
    sd $v0, num1($zero)

    daddi $t0, $zero, mas 
    sd $t0, 0($s1)
    daddi $t1, $zero, 4
    sd $t1, 0($s0)

    jal ingreso 
    sd $v0, num2($zero)

    daddi $t0, $zero, igual 
    sd $t0, 0($s1)
    daddi $t1, $zero, 4
    sd $t1, 0($s0)

    ld $a0, num1($0)
    ld $a1, num2($0)
    jal resultado

    halt
    
    
    
ingreso: daddi $t0, $zero, 8
         sd $t0, 0($s0) 
         ld $t0, 0($s1)
         slti $t1, $t0, 10
         bnez $t1, okay
         daddi $v0, $0, -1 
         jr $ra 
         okay: dadd $v0, $zero, $t0
         jr $ra 

resultado: dadd $v1, $a0, $a1 
           sd $v1, 0($s1)
           daddi $t3, $zero, 2
           sd $t3, 0($s0) 
           jr $ra 