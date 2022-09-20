;11) Subrutinas de cálculo
;b) * Escriba la subrutina RESTO que calcule el resto de la división entre 2 números positivos. Dichos números deben
;pasarse por valor desde el programa principal a la subrutina a través de registros. El resultado debe devolverse
;también a través de un registro por referencia. 


ORG 1000H
    DIVIDENDO DB 63
    DIVISOR DB 8
    REST DB ?

ORG 3000H
  RESTO: CMP AH, 0
         JZ FIN_D
         SUB AL, AH 
         CMP AL, AH
         JS FIN_D
         CMP AL, 0
         JNZ RESTO
  FIN_D: MOV REST, AL
         MOV BX, OFFSET REST
         RET


ORG 2000H
    MOV AL, DIVIDENDO
    MOV AH, DIVISOR 

    CALL RESTO

    HLT
END
