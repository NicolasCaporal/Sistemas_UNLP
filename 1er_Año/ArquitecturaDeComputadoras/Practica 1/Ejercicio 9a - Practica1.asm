;9) Subrutinas para realizar rotaciones
;a) Escribir una subrutina ROTARIZQ que haga una rotacion hacia la izquierda de los bits de un byte almacenado en la
;memoria. Dicho byte debe pasarse por valor desde el programa principal a la subrutina a traves de registros y por
;referencia. No hay valor de retorno, sino que se modifica directamente la memoria.
;Una rotacion a izquierda de un byte se obtiene moviendo cada bit a la izquierda, salvo por el ultimo que se mueve a la
;primera posicion. Por ejemplo al rotar a la izquierda el byte 10010100 se obtiene 00101001, y al rotar a la izquierda
;01101011 se obtiene 11010110.

ORG 1000H
NUM DB 01101011b

ORG 3000H
ROTARIZQ: ADC AX, AX 
ADD AL, AH
MOV [BX], AL
RET

ORG 2000H
MOV BX, OFFSET NUM
MOV AX, 0
MOV AL, NUM
CALL ROTARIZQ
HLT
END