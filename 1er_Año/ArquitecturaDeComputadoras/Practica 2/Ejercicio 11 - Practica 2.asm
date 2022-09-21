;11) Escribir un programa que permita seleccionar una letra del abecedario al azar. El código de la letra debe generarse en
;un registro que incremente su valor desde el código de A hasta el de Z continuamente. La letra debe quedar seleccionada al
;presionarse la tecla F10 y debe mostrarse de inmediato en la pantalla de comandos. 

IMR EQU 21H
INT0 EQU 24H 
EOI EQU 20H 

ID_INT EQU 10
HABILITAR_INT0 EQU 11111110b
FIN_INT EQU 20H

ORG 1000H
LETRA DB ?

ORG 3000H
LETRA_RANDOM: PUSH AX
              MOV LETRA, DL 
              MOV AL, 1
              MOV BX, OFFSET LETRA 
              INT 7
              MOV AL, FIN_INT
              OUT EOI, AL
              POP AX   
              IRET

ORG 40
    DW LETRA_RANDOM


ORG 2000H

CLI
MOV AL, HABILITAR_INT0
OUT IMR, AL
MOV AL, ID_INT
OUT INT0, AL 
STI


INICIO: MOV DL, 41H
BUCLE:  CMP DL, 5AH
        JZ INICIO
        INC DL
        JMP BUCLE

INT 0
END