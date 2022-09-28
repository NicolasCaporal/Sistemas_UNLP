;2) Uso de la impresora a través de la PIO.
;a) * Escribir un programa para imprimir la letra “A” utilizando la impresora a través de la PIO. 

PA EQU 30H
PB EQU 31H
CA EQU 32H 
CB EQU 33H

ORG 1000H
    CHAR DB "A"

ORG 2000H
    MOV AL, 11111101b
    OUT CA, AL

    MOV AL, 0
    OUT CB, AL


    BUCLE: IN AL, PA
        AND AL, 1
        JNZ BUCLE

    MOV AL, CHAR
    OUT PB, AL 

    IN AL, PA
    OR AL, 00000010b
    OUT PA, AL

    IN AL, PA
    AND AL, 11111101b
    OUT PA, AL

    INT 0 
END