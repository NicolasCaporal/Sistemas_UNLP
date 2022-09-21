;9) Escribir un programa que aguarde el ingreso de una clave de cuatro caracteres por teclado sin visualizarla en pantalla. En
;caso de coincidir con una clave predefinida (y guardada en memoria) que muestre el mensaje "Acceso permitido", caso
;contrario el mensaje "Acceso denegado". 

ORG 1000H
    CLAVE DB "Az56"
    IMPUT DB "?"
    
ORG 1500H
    OK DB "Acceso permitido"
    NO_OK DB "Acceso denegado"
    
ORG 3000H
INGRESAR_CLAVE: PUSH BX
                PUSH CX

                MOV CL, 4
                MOV BX, OFFSET IMPUT
                REPETIR: INT 6
                         INC BX
                         DEC CL
                         CMP CL, 0
                         JNZ REPETIR 
                         
                POP CX
                POP BX
                RET

  COMPARAR: PUSH BX
            PUSH DX
            PUSH CX

            MOV CL, 4
            MOV BX, OFFSET CLAVE
            SIG: MOV DL, [BX]
                 ADD BX, 4
                 MOV DH, [BX]
                 CMP DL, DH
                 JNZ GUARDA
                 DEC CL
                 SUB BX, 3
                 CMP CL, 0
                 JNZ SIG

            GUARDA: CMP CL, 0
                    JNZ FALSE
                    MOV DX, 0FFh
                    JMP TRUE 
                    FALSE: MOV DX, 00h
                    TRUE:  PUSH DX
                           POP DX
                    
            POP CX
            POP DX
            POP BX
            RET


ORG 2000H
    CALL INGRESAR_CLAVE

    CALL COMPARAR
    
    MOV BX, SP
    SUB BX, 10
    MOV DL, [BX]
    
    CMP DL, 0FFH
    JNZ DENE
    PERM:   MOV AL, 16
            MOV BX, OFFSET OK
            JMP FIN
    DENE:   MOV AL, 15
            MOV BX, OFFSET NO_OK
    FIN: INT 7
    INT 0
END
