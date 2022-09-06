;2) Escribir un programa que muestre en pantalla todos los caracteres disponibles en el simulador MSX88, comenzando con
;el caracter cuyo código es el número 01H. 


ORG 1000H
CHAR DB 01H

ORG 2000H
MOV BX, OFFSET CHAR
MOV AL, 1 

LOOP: INT 7
INC CHAR 
CMP CHAR, 255
JNZ LOOP 
INT 0
END
