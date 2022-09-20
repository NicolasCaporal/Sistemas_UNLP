;11) Subrutinas de cálculo
;a) Escriba la subrutina DIV que calcule el resultado de la división entre 2 números positivos. Dichos números deben
;pasarse por valor desde el programa principal a la subrutina a través de la pila. El resultado debe devolverse también
;a través de la pila por valor. 

ORG 1000H
    DIVIDENDO DB 10
    DIVISOR DB 3
    COCIENTE DB ?

ORG 3000H
 DIV_R: MOV BX, SP
        MOV DX, SP

        ADD BX, 4
        MOV AL, [BX]
        ADD BX, 2
        MOV AH, [BX]
        MOV CX, 0

REPETIR: CMP AH, 0
         JZ FIN_D
         SUB AL, AH 
         INC CL 
         CMP AL, AH
         JS FIN_D
         CMP AL, 0
         JNZ REPETIR
  FIN_D: PUSH CX
         MOV SP, DX
         RET


ORG 2000H
    MOV AX, DIVISOR
    PUSH AX 
    MOV AX, DIVIDENDO
    PUSH AX

    PUSH BX

    CALL DIV_R

    MOV BX, DX
    SUB BX, 2
    MOV DX, 0
    MOV DX, [BX]
    MOV COCIENTE, DX

    HLT
END