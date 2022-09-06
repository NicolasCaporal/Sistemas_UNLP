;6) * Multiplicacion de numeros sin signo. Pasaje de parametros a traves de registros.
;El simulador no posee una instruccion para multiplicar numeros. Escribir un programa para multiplicar los numeros
;NUM1 y NUM2, y guardar el resultado en la variable RES
;b) Llamando a una subrutina MUL para efectuar la operacion, pasando los parametros por valor desde el programa
;principal a traves de registros y devolviendo el resultado a traves de un registro por valor.

ORG 1000H
    NUM1 DW 3
    NUM2 DW 5
    RES DW ?

ORG 3000H
MUL: MOV CX, 0
    CMP AX, 0
    JZ FIN 
    CMP BX, 0
    JZ FIN
    WHILE: ADD CX, AX
           DEC BX
           JNZ WHILE 
RET 

ORG 2000H
     MOV AX, NUM1 
     MOV BX, NUM2 
     CALL MUL 

FIN: MOV RES, CX

HLT 
END 
