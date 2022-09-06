;c) Escriba la subrutina ES_VOCAL, que determina si un caracter es vocal o no, ya sea mayuscula o minuscula. La
;rutina debe recibir el caracter por valor via registro, y debe retornar, tambien via registro, el valor 0FFH si el
;caracter es una vocal, o 00H en caso contrario.
;Ejemplos: ES_VOCAL de 'a' o 'A' debe retornar 0FFh y ES_VOCAL de 'b' o de '4' debe retornar 00h

;A= 41. E = 45. I = 49. O = 4F. U = 55. a = 61. e = 65. i = 69. o = 6F. u = 75.
ORG 3000H
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



ORG 1000H
CARACTER1 DB "E"
CARACTER2 DB "W"
RES1 DB ? ;1002H
RES2 DB ? ;1003H

ORG 2000H
PUSH AX 
PUSH BX
PUSH CX

MOV DX, 0
MOV DX, CARACTER1
CALL ES_VOCAL
MOV RES1, CL

MOV DX, 0
MOV DX, CARACTER2
CALL ES_VOCAL
MOV RES2, CL

POP CX 
POP BX 
POP AX

HLT 
END
