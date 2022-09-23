;15) Escribir un programa que implemente un conteo regresivo a partir de un valor ingresado desde el teclado. El conteo
;debe comenzar al presionarse la tecla F10. El tiempo transcurrido debe mostrarse en pantalla, actualizándose el valor cada
;segundo. 

CONT EQU 10H 
COMP EQU 11H 
EOI EQU 20H
IMR EQU 21H 
ID_CLK EQU 10 
ID_F10 EQU 11 
INT0 EQU 24H 
INT1 EQU 25H 
HABILITAR_F10 EQU 11111110b
HABILITAR_CLK EQU 11111101b
FIN_INT EQU 20H

ORG 40
    DW RUT_CLK

ORG 44
    DW RUT_F10 

ORG 1000H
    SEG DB ?
    ESPA DB " "

    MSJ1 DB "INGRESE NUMERO ENTRE 1 Y 9: "
    FIN_MSJ1 DB ?
    MSJ2 DB " PULSE F10 PARA INICIAR CUENTA ATRAS: "
    FIN_MSJ2 DB ?

ORG 3000H
RUT_F10: PUSH AX
         CLI
         MOV AL, HABILITAR_CLK
         OUT IMR, AL 
         MOV CL, 0FFh
         MOV BX, OFFSET SEG
 
         MOV AL, 0
         OUT CONT, AL
 
         STI
 
         MOV AL, FIN_INT
         OUT EOI, AL
 
         POP AX
    IRET    

RUT_CLK: MOV BX, OFFSET SEG
         MOV AL, 1
         INT 7
         DEC SEG
         MOV BX, OFFSET ESPA
         INT 7
 
         MOV AL, 0
         OUT CONT, AL
 
         MOV AL, FIN_INT
         OUT EOI, AL    
    IRET




ORG 2000H
CLI 
    MOV BX, OFFSET MSJ1 
    MOV AL, OFFSET FIN_MSJ1-OFFSET MSJ1
    INT 7

    MOV BX, OFFSET SEG 
    INT 6 
    
    MOV AL, 1
    INT 7
    
    MOV AL, HABILITAR_F10
    OUT IMR, AL 

    MOV AL, ID_F10
    OUT INT0, AL

    MOV AL, ID_CLK
    OUT INT1, AL 

    MOV AL, 1 
    OUT COMP, AL
    
    MOV CL, HABILITAR_F10
    
    MOV BX, OFFSET MSJ2
    MOV AL, OFFSET FIN_MSJ2-OFFSET MSJ2
    INT 7
STI


BUCLE: CMP CL, HABILITAR_F10
JZ BUCLE

CONTANDO: CMP SEG, 30H
JNZ CONTANDO

INT 0
END