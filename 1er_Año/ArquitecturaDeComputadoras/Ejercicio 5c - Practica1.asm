;Volver a escribir el programa, pero ahora con una subrutina que reciba A, B y C por valor a través de los registros
;AX, BX y CX, calcule AX+BX-CX, y devuelva el resultado por valor en el registro DX. El programa principal debe
;llamar a la subrutina y luego guardar el resultado en la memoria con etiqueta D 

ORG 1000H
    A DW 5
    B DW 10
    C DW 2
    D DW ?

ORG 3000H
CALCULO: ADD AX, BX
         SUB AX, CX 
         MOV DX, AX 
RET

ORG 2000H
MOV AX, A 
MOV BX, B 
MOV CX, C 
CALL CALCULO 
MOV D, DX

HLT 
END
