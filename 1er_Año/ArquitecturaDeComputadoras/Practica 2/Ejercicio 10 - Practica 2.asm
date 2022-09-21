;10) Interrupción por hardware: tecla F10.
;Escribir un programa que, mientras ejecuta un lazo infinito, cuente el número de veces que se presiona la tecla F10 y
;acumule este valor en el registro DX.

PIC EQU 20H
EOI EQU 20H
IMR EQU 21H
INT0 EQU 24h
N_F10 EQU 10


ORG 40
    IP_F10 DW RUT_F10

 ORG 2000H
         CLI
         MOV AL, 11111110b
         OUT IMR, AL 
         MOV AL, N_F10
         OUT INT0, AL 
         MOV DX, 0
         STI
LAZO:    JMP LAZO
         ORG 3000H
RUT_F10: PUSH AX
         INC DX
         MOV AL, EOI
         OUT EOI, AL 
         POP AX
         IRET
 END 