;11) Subrutinas de cálculo
;c) Escribir un programa que calcule la suma de dos números de 32 bits almacenados en la memoria sin hacer llamados a
;subrutinas, resolviendo el problema desde el programa principal. 

ORG 1000H
    NUM1alta  DW 3420h
    NUM1baja DW 0F588h

    NUM2alta DW 2366H
    NUM2baja  DW 9843H

    RESalta DW ?
    RESbaja DW ?

ORG 2000H
    MOV AX, NUM1alta
    MOV BX, NUM1baja

    MOV CX, NUM2alta
    MOV DX, NUM2baja

    ADD AX, CX 
    ADC BX, DX 

    MOV RESalta, AX
    MOV RESbaja, BX

    HLT

END