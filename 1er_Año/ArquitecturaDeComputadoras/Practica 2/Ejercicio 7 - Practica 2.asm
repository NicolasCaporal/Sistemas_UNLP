;7) * Escribir un programa que efectúe la suma de dos números (de un dígito cada uno) ingresados por teclado y muestre el
;resultado en la pantalla de comandos. Recordar que el código de cada caracter ingresado no coincide con el número que
;representa y que el resultado puede necesitar ser expresado con 2 dígitos. 

ORG 1000H
    NUM1 DB ?
    NUM2 DB ?
    DIG1 DB ?
    DIG2 DB ?

    MAS DB " + "
    IGUAL DB " = "

ORG 3000H
GUARDAR_NUM: PUSH AX 
             MOV AL, [BX]
             SUB AL, 48
             MOV CL, AL 
             POP AX
             RET

DIV_10: MOV DX, 0
BUCLE:  SUB CL, 10
        INC DL
        CMP CL, 10
        JZ FIN_D
        CMP CL, 10
        JS FIN_D 
        JMP BUCLE
FIN_D:  RET

IMPRIMIR_RESULTADO: PUSH AX
                    PUSH BX
                    MOV AL, 1
                    MOV BX, OFFSET DIG1 
                    INT 7

                    MOV BX, OFFSET DIG2 
                    INT 7

                    POP BX
                    POP AX
                    RET



ORG 2000H
    MOV BX, OFFSET NUM1
    INT 6
    MOV AL, 1
    INT 7
    CALL GUARDAR_NUM
    MOV CH, CL
    MOV NUM1, CH

    MOV AL, 3
    MOV BX, OFFSET MAS
    INT 7

    MOV BX, OFFSET NUM2
    INT 6
    MOV AL, 1
    INT 7
    CALL GUARDAR_NUM
    MOV NUM2, CL

    MOV AL, 3
    MOV BX, OFFSET IGUAL
    INT 7

    ADD CL, CH
    CMP CL, 10
    JNS DOS_DIGITOS
    MOV AL, 1
    ADD CL, 48
    MOV DIG1, CL
    MOV BX, OFFSET DIG1
    INT 7
    JMP FIN

DOS_DIGITOS: CALL DIV_10
             ADD DL, 48
             ADD CL, 48
             MOV DIG1, DL
             MOV DIG2, CL
             CALL IMPRIMIR_RESULTADO

        FIN: INT 0
END