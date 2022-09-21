;5) Modificar el programa anterior agregando una subrutina llamada ES_NUM que verifique si el caracter ingresado es
;realmente un número. De no serlo, el programa debe mostrar el mensaje “CARACTER NO VALIDO”. La subrutina debe
;recibir el código del caracter por referencia desde el programa principal y debe devolver vía registro el valor 0FFH en caso
;de tratarse de un número o el valor 00H en caso contrario. Tener en cuenta que el código del “0” es 30H y el del “9” es 39H. 

ORG 1000H
    MSJ DB "INGRESE UN NUMERO: "
    FIN_MSJ DB ?

    ERROR DB "CARACTER NO VALIDO"

ORG 1500H
    NUM DB ?

ORG 3000H
ES_NUM:  PUSH AX
         MOV AX, 0
         MOV DX, 0
         MOV AL,  [BX]
         MOV AH, 39H
         CMP AH, AL
         JS FALSE
         CMP AL, 30H
         JS FALSE
         MOV DL, 0FFH
         JMP FIN_NUM
FALSE:   MOV DL, 00H
FIN_NUM: POP AX 
RET



ORG 2000H
    MOV BX, OFFSET MSJ
    MOV AL, OFFSET FIN_MSJ-OFFSET MSJ
    INT 7
    MOV BX, OFFSET NUM
    INT 6

    CALL ES_NUM
    CMP DX, 0FFH
    JZ TRUE

    MOV BX, OFFSET ERROR
    MOV AL, 18
    INT 7
    JMP FIN

TRUE: MOV AL, 1
      INT 7
      MOV CL, NUM

FIN: INT 0
END 