;6) Multiplicacion de numeros sin signo. Pasaje de parametros a traves de registros.
;El simulador no posee una instruccion para multiplicar numeros. Escribir un programa para multiplicar los numeros
;c) Llamando a una subrutina MUL, pasando los parametros por referencia desde el programa principal a traves de
;registros, y devolviendo el resultado a traves de un registro por valor.

ORG 1000H
     NUM1 DW 10
     NUM2 DW 0
     RES DW ?

ORG 3000H
MUL: MOV DX, 0
     MOV BX, AX
     MOV AX, [BX]
     MOV BX, CX
     MOV CX, [BX]
     CMP AX, 0
     JZ FIN
     CMP CX, 0 
     JZ FIN
     WHILE: ADD DX, AX 
       DEC CX
       JNZ WHILE 
       RET
       
ORG 2000H
MOV AX, OFFSET NUM1 
MOV CX, OFFSET NUM2
CALL MUL 
FIN: MOV RES, DX 

HLT 
END
