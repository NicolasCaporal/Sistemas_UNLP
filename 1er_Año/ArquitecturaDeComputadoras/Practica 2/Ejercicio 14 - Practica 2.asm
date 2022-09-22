;14) Implementar un reloj similar al utilizado en los partidos de básquet, que arranque y detenga su marcha al presionar
;sucesivas veces la tecla F10 y que finalice el conteo al alcanzar los 30 segundos.

EOI EQU 20H 
IMR EQU 21H 
ID_TIMER EQU 10 
CONT EQU 10H 
COMP EQU 11H
ID_F10 EQU 11
INT0 EQU 24H
INT1 EQU 25H
HABILITAR_F10   EQU 11111110b
HABILITAR_TIMER EQU 11111100b 
FIN_INT EQU 20H

ORG 40
    DW RUT_CLK

ORG 44
    DW RUT_F10 

ORG 1000H
    SEG DB 30H
    SEG2 DB 30H
    ESPA DB " "
    FIN DB ?
    TREINTA DB "30"

ORG 3000H
RUT_F10: PUSH AX
         IN AL, IMR
 
         CLI
 
            CMP AL, HABILITAR_TIMER
            JZ PARAR
            MOV AL, HABILITAR_TIMER
            OUT IMR, AL 
    
            MOV AL, 0
            OUT CONT, AL
    
            MOV BX, OFFSET SEG
    
            JMP FIN_R
    
            PARAR: MOV AL, HABILITAR_F10
            OUT IMR, AL
    
            FIN_R: POP AX
    
            MOV AL, FIN_INT
            OUT EOI, AL 
 
         STI
IRET 


RUT_CLK: PUSH AX 

         INC SEG2
         CMP SEG2, 3AH
         JNZ RESET

         MOV SEG2, 30H
         INC SEG
         CMP SEG, 33H
         JNZ RESET
         JMP FIN_C

  RESET: MOV AL, OFFSET FIN-OFFSET SEG
         INT 7

         MOV AL, 0
         OUT CONT, AL

  FIN_C: MOV AL, EOI
         OUT EOI, AL
         POP AX
IRET





ORG 2000H
CLI 
    MOV AL, 1
    OUT COMP, AL 

    MOV AL, HABILITAR_F10
    OUT IMR, AL 

    MOV AL, ID_TIMER
    OUT INT1, AL

    MOV AL, ID_F10
    OUT INT0, AL 
STI 

BUCLE: CMP SEG, 33H
       JNZ BUCLE

       MOV BX, OFFSET TREINTA
       MOV AL, 2
       INT 7
INT 0
END