;11) Subrutinas de cálculo
;d) Escribir un programa que calcule la suma de dos números de 32 bits almacenados en la memoria llamando a una
;subrutina SUM32, que reciba los parámetros de entrada por valor a través de la pila, y devuelva el resultado también
;por referencia a través de la pila. 

ORG 1000H
    NUM1alta DW 3420h
    NUM1baja DW 0F588h

    NUM2alta DW 2366H
    NUM2baja DW 9843H

    RESalta DW ?
    RESbaja DW ?

ORG 3000H
SUM32: PUSH AX
       PUSH BX
       PUSH CX 
       PUSH DX

       MOV BX, SP
       ADD BX, 10
       MOV AX, [BX]
       ADD BX, 4
       MOV CX, [BX]
       ADD BX, 2
       MOV DX, [BX]
       SUB BX, 4
       MOV BX, [BX]

 SUMA: ADD AX, CX
       ADC BX, DX

       MOV RESalta, AX 
       MOV RESbaja, BX

       MOV BX, OFFSET RESbaja
       PUSH BX
       POP BX

       POP DX
       POP CX 
       POP BX 
       POP AX
RET


ORG 2000H
    MOV AX, NUM2baja 
    PUSH AX 
    MOV AX, NUM2alta 
    PUSH AX

    MOV AX, NUM1baja
    PUSH AX
    MOV AX, NUM1alta
    PUSH AX 

    CALL SUM32

    HLT
END