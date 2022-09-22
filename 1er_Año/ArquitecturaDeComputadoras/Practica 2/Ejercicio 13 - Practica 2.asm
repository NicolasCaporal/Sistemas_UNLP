;13) Modificar el programa anterior para que también cuente minutos (00:00 - 59:59), pero que actualice la visualización en
;pantalla cada 10 segundos. 


CONT EQU 10H
COMP EQU 11H
EOI EQU 20H
IMR EQU 21H
N_CLK EQU 10
INT1 EQU 25H
HABILITAR_TIMER EQU 11111101b


ORG 40
    IP_CLK DW RUT_CLK

ORG 1000H
    MIN DB "0"
    MIN2 DB "0"
    DP DB ":"
    SEG DB "0"
    SEG2 DB "0"
    ESPA DB " "
    FIN DB ?

ORG 3000H
    RUT_CLK: PUSH AX

             INC SEG
             CMP SEG, 36H
             JNZ RESET

             INC MIN2
             MOV SEG, 30H
             CMP MIN2, 3AH
             JNZ RESET

             INC MIN
             MOV MIN2, 30H
             CMP MIN, 36H
             JNZ RESET

             MOV MIN, 30H
             
             RESET: INT 7
                    MOV AL, 0
                    OUT CONT, AL
                    MOV AL, EOI
                    OUT EOI, AL
                    POP AX
             IRET

ORG 2000H
CLI
    MOV AL, HABILITAR_TIMER
    OUT IMR, AL 
    MOV AL, N_CLK
    OUT INT1, AL 
    MOV AL, 10
    OUT COMP, AL 
    MOV AL, 0
    OUT CONT, AL 
    MOV BX, OFFSET MIN
    MOV AL, OFFSET FIN-OFFSET MIN
STI

LAZO: JMP LAZO

END