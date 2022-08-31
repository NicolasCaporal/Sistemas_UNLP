;d) * Usando la subrutina anterior escribir la subrutina CONTAR_VOC, que recibe una cadena terminada en cero por
;referencia a traves de un registro, y devuelve, en un registro, la cantidad de vocales que tiene esa cadena.
;Ejemplo: CONTAR_VOC de 'contar1#!' debe retornar 2 

ORG 3000H
;Le paso el caracter en DL, y devuelve el resultado en CX
ES_VOCAL: MOV CX, 0
CMP DX, 41H ;A
JZ TRUE
CMP DL, 45H ;E
JZ TRUE 
CMP DL, 49H ;I
JZ TRUE 
CMP DL, 4FH ;O
JZ TRUE 
CMP DL, 55H ;U
JZ TRUE
CMP DX, 61H ;a
JZ TRUE
CMP DL, 65H ;e
JZ TRUE 
CMP DL, 69H ;i
JZ TRUE 
CMP DL, 6FH ;o
JZ TRUE 
CMP DL, 75H ;u
JNZ FALSE
TRUE: MOV CX, 0FFH 
JMP FIN
FALSE: MOV CX, 00H
FIN: RET

;INC BX
;SI CMP [BX], 0, 

CONTAR_VOC: MOV AX, 0  ;Le paso OFFSET del string en BX, y devuelve el resultado en AX.
BUCLE: MOV DX, 0
MOV DL, [BX]
CMP DL, 0
JZ FIN
CALL ES_VOCAL
CMP CL, 0FFH 
JNZ NO_ERA_VOCAL
SUMAR_UNO: INC AX 
NO_ERA_VOCAL: INC BX ;Paso al siguiente caracter
JMP BUCLE
FIN_C: RET 

ORG 1000H
STRING DB "contar1#!"
FINAL_STR DB 00
RES DB ? ;1000AH

ORG 2000H
PUSH AX
PUSH BX
PUSH CX
PUSH DX 

MOV BX, OFFSET STRING
CALL CONTAR_VOC 
MOV RES, AL 

POP DX 
POP CX 
POP BX 
POP AX 

HLT
END
