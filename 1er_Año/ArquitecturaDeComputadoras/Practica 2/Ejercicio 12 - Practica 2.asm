;12) Interrupción por hardware: TIMER.
;Implementar a través de un programa un reloj segundero que muestre en pantalla los segundos transcurridos (00-59 seg)
;desde el inicio de la ejecución.

CONT EQU 10H
COMP EQU 11H
EOI EQU 20H
IMR EQU 21H
N_CLK EQU 10
INT1 EQU 25H
HABILITAR_TIMER EQU 11111101b


ORG 40
    DW RUT_CLK

ORG 1000H
    SEG DB 30H
    SEG2 DB 30H
    FIN DB ?

ORG 3000H
    RUT_CLK: PUSH AX
             INC SEG2
             CMP SEG2, 3AH
             JNZ RESET
             MOV SEG2, 30H
             INC SEG
             CMP SEG, 36H
             JNZ RESET
             MOV SEG, 30H
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
    MOV AL, 1
    OUT COMP, AL 
    MOV AL, 0
    OUT CONT, AL 
    MOV BX, OFFSET SEG
    MOV AL, OFFSET FIN-OFFSET SEG
STI

LAZO: JMP LAZO

END