;b) Usando la subrutina ROTARIZQ del ejercicio anterior, escriba una subrutina ROTARIZQ_N que realice N
;rotaciones a la izquierda de un byte. La forma de pasaje de parametros es la misma, pero se agrega el parametro N
;que se recibe por valor y registro. 
;Por ejemplo, al rotar a la izquierda 2 veces el byte 10010100, se obtiene el byte 01010010. 

ORG 1000H
    NUM DB 01000010b
    N_CANT DB 3

ORG 3000H
ROTARIZQ: ADC AX, AX 
            ADD AL, AH
            MOV [BX], AL
            RET

ROTARIZQ_N: CMP CL, 0
            JZ FIN 
            MOV AH, 0
            CALL ROTARIZQ
            DEC CL
            JMP ROTARIZQ_N
            FIN: RET

ORG 2000H
    MOV BX, OFFSET NUM
    MOV AX, 0
    MOV AL, NUM
    MOV CL, N_CANT
    CALL ROTARIZQ_N
    HLT
END