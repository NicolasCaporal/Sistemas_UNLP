;c) * Usando la subrutina ROTARIZQ_N del ejercicio anterior, escriba una subrutina ROTARDER_N que sea similar
;pero que realice N rotaciones hacia la derecha.
;Una rotación a derecha de N posiciones, para un byte con 8 bits, se obtiene rotando a la izquierda 8 - N posiciones. Por
;ejemplo, al rotar a la derecha 6 veces el byte 10010100 se obtiene el byte 01010010, que es equivalente a la rotación a
;la izquierda de 2 posiciones del ejemplo anterior. 

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

ROTARDER_N: MOV DL, 8
            SUB DL, CL 
            MOV CL, DL
            CALL ROTARIZQ_N
            RET 

ORG 2000H
    MOV BX, OFFSET NUM
    MOV AX, 0
    MOV AL, NUM
    MOV CL, N_CANT
    CALL ROTARDER_N
    HLT
END
