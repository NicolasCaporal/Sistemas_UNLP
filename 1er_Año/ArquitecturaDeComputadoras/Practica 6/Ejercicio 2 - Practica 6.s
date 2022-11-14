# 2) Escriba un programa que utilice sucesivamente dos subrutinas: La primera, denominada ingreso, debe solicitar el
# ingreso por teclado de un número entero (de un dígito), verificando que el valor ingresado realmente sea un dígito. La
# segunda, denominada muestra, deberá mostrar en la salida estándar del simulador (ventana Terminal) el valor del
# número ingresado expresado en letras (es decir, si se ingresa un ‘4’, deberá mostrar ‘CUATRO’). Establezca el pasaje
# de parámetros entre subrutinas respetando las convenciones para el uso de los registros y minimice las detenciones
# del cauce (ejercicio similar al ejercicio 6 de Práctica 2).

.data 
    DATA: .word 0x10008
    CONTROL: .word 0x10000
    ERROR: .asciiz "ERROR"
    CERO: .asciiz "CERO"
    UNO: .asciiz "UNO"
    DOS: .asciiz "DOS"
    TRES: .asciiz "TRES"
    CUATRO: .asciiz "CUATRO"
    CINCO: .asciiz "CINCO"
    SEIS: .asciiz "SEIS"
    SIETE: .asciiz "SIETE"
    OCHO: .asciiz "OCHO"
    NUEVE: .asciiz "NUEVE"

.code 
    lwu $s0,  CONTROL($0) 
    lwu $s1, DATA($0)

    jal ingreso 
    dadd $a0, $zero, $v0
    jal muestra 
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

muestra:  daddi $t8, $t8, 8
          dmul $a0, $a0, $t8
          daddi $t1, $a0, CERO 
          sd $t1, 0($s1) 
          daddi $t2, $zero, 4
          sd $t2, 0($s0)
          jr $ra