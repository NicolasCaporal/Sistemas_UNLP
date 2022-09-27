;a) * Escribir un programa que imprime “INGENIERIA E INFORMATICA” en la impresora a través del
;HAND-SHAKE. La comunicación se establece por consulta de estado (polling).

H_DATO EQU 40H
H_ESTADO EQU 41H

ORG 1000H
MSJ DB "INGENIERIA E INFORMATICA"
FIN_MSJ DB ?

ORG 2000H
    IN AL, H_ESTADO 
    AND AL, 01111111b
    OUT H_ESTADO, AL

    MOV BX, OFFSET MSJ 
    POLL: IN AL, H_ESTADO
          AND AL, 1
          JNZ POLL

    MOV AL, [BX]
    OUT H_DATO, AL
    INC BX
    CMP BX, OFFSET FIN_MSJ
    JNZ POLL

    INT 0 
END