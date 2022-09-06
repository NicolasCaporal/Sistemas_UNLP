;Escribir un programa como en a) pero ahora el cálculo y el almacenamiento del resultado debe realizarse en una
;subrutina llamada calculo, sin recibir ni devolver parámetros, es decir, utilizando A, B, C y D como variables
;globales. Si bien esta técnica no está recomendada, en ejercicio sirve para ver sus diferencias con el uso de
;parámetros. 

ORG 1000H
    A DB 5
    B DB 10
    C DB 2
    D DB ?

ORG 3000H
CALCULO: MOV AL, 0
         ADD AL, A 
         ADD AL, B 
         SUB AL, C 
         MOV D, AL 
        RET 

ORG 2000H
CALL CALCULO

HLT 
END
