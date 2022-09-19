;d) Escriba la subrutina ROTARDER del ejercicio anterior, pero sin usar la subrutina ROTARIZ. Compare qué ventajas
;tiene cada una de las soluciones.

ORG 1000H
    NUM DB 00011011b
    N_CANT DB 3

ORG 3000H
SUMAR_128:  DEC CL
            ADD CH, 128
            RET

ROTARDER:   CMP AH, 0
            JZ FINR
            
            MOV AL, [BX]
            DIV_DOS: MOV CL, AL
                     MOV CH, 0
            REPETIR: SUB CL, 2
                     INC CH
                     CMP CL, 1
                     JNZ SKIP
                     CALL SUMAR_128
                     SKIP: CMP CL, 0
                     JNZ REPETIR
            MOV [BX], CH
            DEC AH

            JMP ROTARDER

            FINR: RET


ORG 2000H
    MOV BX, OFFSET NUM
    MOV AL, NUM
    MOV AH, N_CANT
    CALL ROTARDER
    HLT

END