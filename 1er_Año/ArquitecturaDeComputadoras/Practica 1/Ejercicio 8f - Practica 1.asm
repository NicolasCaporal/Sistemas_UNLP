;f) Escriba la subrutina REEMPLAZAR_CAR que reciba dos caracteres (ORIGINAL y REEMPLAZO) por valor a
;traves de la pila, y una cadena terminada en cero tambien a traves de la pila. La subrutina debe reemplazar el
;caracter ORIGINAL por el caracter REEMPLAZO.

ORG 1000H 
    ORIGINAL DB "r"
    REMPLAZO DB "9"
    STRING DB "abrcdref!"
    FIN DB 0

ORG 3000H
REEMPLAZAR_CAR: MOV BX, SP 
                ADD BX, 2
                MOV AX, [BX]
                ADD BX, 2 
                MOV CX, [BX] 
                ADD BX, 2
                MOV BX, [BX]

         BUCLE: CMP BYTE PTR [BX], CL
                JNZ SIG 
                MOV BYTE PTR [BX], AL
           SIG: INC BX 
                CMP BYTE PTR [BX], 0 
                JNZ BUCLE

                RET



ORG 2000H
    PUSH AX
    PUSH BX 
    PUSH CX 
    PUSH DX 

    MOV AX, OFFSET STRING 
    PUSH AX 
    MOV AX, 0
    MOV AL, ORIGINAL
    PUSH AX 
    MOV AL, REMPLAZO 
    PUSH AX 

    CALL REEMPLAZAR_CAR 

    POP DX
    POP CX 
    POP BX 
    POP AX 

    HLT
END