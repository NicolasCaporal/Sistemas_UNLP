;c) * Escribir un programa que solicita el ingreso de cinco caracteres por teclado y los envía de a uno por
;vez a la impresora a través de la PIO a medida que se van ingresando. No es necesario mostrar los
;caracteres en la pantalla. 

PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 1000H
    CHAR DB ?

ORG 2000H
    MOV AL, 11111101b
    OUT CA, AL 

    MOV AL, 0
    OUT CB, AL 

    MOV CL, 5
    MOV BX, OFFSET CHAR 

    BUCLE: INT 6
     POOL: IN AL, PA 
           AND AL, 1
           JNZ POOL 

           MOV AL, [BX]
           OUT PB, AL 

           IN AL, PA 
           OR AL, 00000010b
           OUT PA, AL 

           DEC CL

           IN AL, PA
           AND AL, 11111101b
           OUT PA, AL

    CMP CL, 0
    JNZ BUCLE 

INT 0
END