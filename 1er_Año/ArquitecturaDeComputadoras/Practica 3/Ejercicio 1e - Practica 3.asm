;e) Escribir un programa que encienda una luz a la vez, de las ocho conectadas al puerto paralelo del
;microprocesador a través de la PIO, en el siguiente orden de bits: 0-1-2-3-4-5-6-7-6-5-4-3-2-1-0-1-2-3-
;4-5-6-7-6-5-4-3-2-1-0-1-..., es decir, 00000001, 00000010, 00000100, etc. Cada luz debe estar
;encendida durante un segundo. El programa nunca termina. 

EOI EQU 20H
IMR EQU 21H 
INT0 EQU 25H 
ID_CLK EQU 10 
FIN_INT EQU 20H 
HABILITAR_TIMER EQU 11111101b 
CONT EQU 10H
COMP EQU 11H 

PB EQU 31H 
CB EQU 33H

ORG 40 
    DW RUT_CLK 


ORG 3000H
    ROTARIZQ: ADC AX, AX 
              ADD AL, AH
              RET


    ROTARDER:  MOV CL, 7
    REPETIR_7: CMP CL, 0
               JZ FIN_I
               MOV AH, 0
               CALL ROTARIZQ
               DEC CL
               JMP REPETIR_7
        FIN_I: RET


    RUT_CLK: MOV AX, 0
             CMP IZQ_DER, 1
             JZ IZQ 

             DER: IN AL, PB 
                  CALL ROTARDER
                  OUT PB, AL 
                  JMP CHEQUEO_1
             IZQ: IN AL, PB 
                  CALL ROTARIZQ
                  OUT PB, AL

             CHEQUEO_128: CMP AL, 128
                          JNZ FIN
                          MOV IZQ_DER, 0
                          JMP FIN

             CHEQUEO_1:   CMP AL, 1
                          JNZ FIN 
                          MOV IZQ_DER, 1

             FIN: MOV AL, 0
                  OUT CONT, AL 
                  MOV AL, FIN_INT
                  OUT EOI, AL 
                  IRET
             

ORG 1000H
    IZQ_DER DB 1


ORG 2000H
CLI
    MOV AL, HABILITAR_TIMER
    OUT IMR, AL 

    MOV AL, ID_CLK 
    OUT INT0, AL 

    MOV AL, 0
    OUT CB, AL 

    MOV AL, 1 
    OUT PB, AL

    MOV AL, 1 
    OUT COMP, AL 

    MOV AL, 0
    OUT CONT, AL
STI

BUCLE: JMP BUCLE

END 