;b) * Escribir un programa que verifique si la llave de más a la izquierda está prendida. Si es así, mostrar en
;pantalla el mensaje “Llave prendida”, y de lo contrario mostrar “Llave apagada”. Solo importa el valor
;de la llave de más a la izquierda (bit más significativo). Recordar que las llaves se manejan con las
;teclas 0-7.

PA EQU 30H
CA EQU 32H 

ORG 1000H
    LLAVE_P DB "Llave prendida"
    LLAVE_A DB "Llave apagada"

ORG 2000H
    MOV AL, 0FFh
    OUT CA, AL 

    IN AL, PA
    AND AL, 10000000b
    CMP AL, 0
    JNZ PRENDIDA 
    
    APAGADA:  MOV AL, 13
              MOV BX, OFFSET LLAVE_A 
              JMP FIN

    PRENDIDA: MOV AL, 14
              MOV BX, OFFSET LLAVE_P

    FIN: INT 7
    INT 0
END 