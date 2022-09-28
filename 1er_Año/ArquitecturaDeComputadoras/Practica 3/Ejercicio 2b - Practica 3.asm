;b) * Escribir un programa para imprimir el mensaje “ORGANIZACION Y ARQUITECTURA DE
;COMPUTADORAS” utilizando la impresora a través de la PIO. 

PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 1000H
    MSJ DB "ORGANIZACION Y ARQUITECTURA DE COMPUTADORAS"
    FIN_MSJ DB ?

ORG 2000H
    MOV AL, 11111101b
    OUT CA, AL

    MOV AL, 0
    OUT CB, AL 

    MOV BX, OFFSET MSJ

    BUCLE: IN AL, PA
           AND AL, 1
           JNZ BUCLE

    MOV AL, [BX]
    OUT PB, AL

    INC BX

    IN AL, PA
    OR AL, 00000010b
    OUT PA, AL

    IN AL, PA
    AND AL, 11111101b
    OUT PA, AL

    CMP BX, OFFSET FIN_MSJ
    JNZ BUCLE

    INT 0
END