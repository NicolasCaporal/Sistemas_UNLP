;d) * Escribir un programa que implemente un encendido y apagado sincronizado de las luces. Un contador,
;que inicializa en cero, se incrementa en uno una vez por segundo. Por cada incremento, se muestra a
;través de las luces, prendiendo solo aquellas luces donde el valor de las llaves es 1. Entonces, primero
;se enciende solo la luz de más a la derecha, correspondiente al patrón 00000001. Luego se continúa con
;los patrones 00000010, 00000011, y así sucesivamente. El programa termina al llegar al patrón
;11111111. 

EOI EQU 20H 
IMR EQU 21H 
HABILITAR_CLK EQU 11111101b
ID_CLK EQU 10 
INT1 EQU 25H
CONT EQU 10H 
COMP EQU 11H
FIN_INT EQU 20H

PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H


ORG 40 
    DW RUT_CLK

ORG 3000H
    RUT_CLK: INC CL 
             IN AL, PA
             AND AL, CL
             OUT PB, AL 
             
             MOV AL, 0
             OUT CONT, AL
 
             MOV AL, FIN_INT 
             OUT EOI, AL 
             IRET


ORG 2000H
CLI
    MOV AL, 0
    OUT CB, AL 

    MOV AL, 0FFH
    OUT CA, AL

    MOV AL, HABILITAR_CLK
    OUT IMR, AL 

    MOV AL, 1
    OUT COMP, AL 

    MOV AL, ID_CLK 
    OUT INT1, AL 

    MOV AL, 0
    OUT PB, AL

    MOV CL, 0

    MOV AL, 0
    OUT CONT, AL 
STI 

BUCLE: CMP CL, 255
       JNZ BUCLE 

INT 0
END 