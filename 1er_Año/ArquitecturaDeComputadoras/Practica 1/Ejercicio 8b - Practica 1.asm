;b) Escribir una subrutina CONTAR_MIN que cuente el numero de letras minusculas de la 'a' a la 'z' de una cadena de
;caracteres terminada en cero almacenada en la memoria. La cadena se pasa a la subrutina por referencia via registro,
;y el resultado se retorna por valor tambien a traves de un registro.
;Ejemplo: CONTAR_MIN de 'aBcDE1#!' debe retornar 2. 

ORG 3000H
;Pongo 7Ah en un registro y me voy fijando, uno por uno, decrementando 7AH. Si llego a 60h, significa que NO ES MINUSCULA, entonces FALSO.
; a = 61h y z= 7Ah
ES_MIN: MOV AX, 7Ah
BUCLE:  CMP AL, [BX]
        JZ TRUE
        DEC AX 
        CMP AX, 60H 
        JZ FIN_ES_MIN
        JMP BUCLE 
TRUE:   ADD CX, 1
FIN_ES_MIN: RET 


CONTAR_MIN:     MOV CX, 0
BUCLE_CONTAR:   MOV AX, 0
                CALL ES_MIN 
                INC BX 
                MOV DX, [BX]
                CMP DL, 0
                JZ FIN_CONTAR
                JMP BUCLE_CONTAR
                FIN_CONTAR: MOV AX, CX  
RET




ORG 1000H
STR DB "aBcDE1#!"
FIN_STR DB 0
RES DB ? ;Dir 1009h

ORG 2000H
PUSH AX
PUSH CX 
PUSH DX 

MOV BX, OFFSET STR 
CALL CONTAR_MIN
MOV RES, AX

POP DX 
POP CX 
POP AX

HLT
END
