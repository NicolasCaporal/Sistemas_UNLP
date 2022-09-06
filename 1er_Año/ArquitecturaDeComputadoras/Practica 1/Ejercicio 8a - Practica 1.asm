;8) Subrutinas para realizar operaciones con cadenas de caracteres
;a) Escribir una subrutina LONGITUD que cuente el numero de caracteres de una cadena de caracteres terminada en
;cero (00H) almacenada en la memoria. La cadena se pasa a la subrutina por referencia via registro, y el resultado se
;retorna por valor tambien a traves de un registro.
;Ejemplo: la longitud de 'abcd'00h es 4 (el 00h final no cuenta)

ORG 3000H
LONGITUD: MOV CX, 0
          MOV AX, 0
          MOV AL, [BX]
   WHILE: CMP AL, 00H
          JZ FIN 
          INC CL
          INC BX
          MOV AL, [BX]
          JMP WHILE
    FIN:  RET

ORG 1000H
INICIO DB "ARQUI"
FINAL DW 00h
RES DB ? ;Dir 1007H

ORG 2000H
PUSH AX
PUSH BX
PUSH CX
PUSH DX

MOV BX, 0
MOV BX, OFFSET INICIO
CALL LONGITUD
MOV RES, CL

POP DX
POP CX
POP BX
POP AX

HLT 
END