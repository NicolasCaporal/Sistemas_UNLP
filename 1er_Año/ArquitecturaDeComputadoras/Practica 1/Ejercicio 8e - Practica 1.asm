;e) Escriba la subrutina CONTAR_CAR que cuenta la cantidad de veces que aparece un caracter dado en una cadena
;terminada en cero. El caracter a buscar se debe pasar por valor mientras que la cadena a analizar por referencia,
;ambos a traves de la pila.
;Ejemplo: CONTAR_CAR de 'abbcde!' y 'b' debe retornar 2, mientras que CONTAR_CAR de 'abbcde!' y 'z'
;debe retornar 0. 

ORG 1000H
    CHAR DB "b" ;1000h
    STRING DB "abbcde!" ;1001h
    FIN_STR DB 0 ;1008h
    RESULTADO DB ? ;1009h

ORG 3000H
CONTAR_CAR: MOV BX, SP
            ADD BX, 2
            MOV AL, [BX]
            ADD BX, 2
            MOV BX, [BX]
            DEC BX
            MOV CL, 0

     BUCLE: INC BX 
            CMP BYTE PTR [BX], 0
            JZ FIN 
            CMP BYTE PTR [BX], AL
            JNZ BUCLE
            INC CL 
            JMP BUCLE    
       FIN: RET


ORG 2000H

    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    MOV AX, 0
    MOV AX, OFFSET STRING
    PUSH AX
    MOV AX, CHAR 
    PUSH AX
    CALL CONTAR_CAR

    MOV RESULTADO, CL 

    POP DX
    POP CX 
    POP BX 
    POP AX

    HLT
END