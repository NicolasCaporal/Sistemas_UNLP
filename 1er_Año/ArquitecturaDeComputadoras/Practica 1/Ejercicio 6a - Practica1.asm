;6) Multiplicacion de numeros sin signo. Pasaje de parametros a traves de registros.
;El simulador no posee una instruccion para multiplicar numeros. Escribir un programa para multiplicar los numeros
;NUM1 y NUM2, y guardar el resultado en la variable RES
;a) Sin hacer llamados a subrutinas, resolviendo el problema desde el programa principal; 

ORG 1000H
    NUM1 DB 3
    NUM2 DB 5
    RES DB ?

ORG 2000H
    MOV RES, 0
    CMP NUM1, 0
    JZ FIN 
    CMP NUM2, 0
    JZ FIN
    MOV CX, NUM1
    MOV BX, NUM2
    WHILE: ADD RES, BX
           DEC CX
           JNZ WHILE 

FIN: MOV DX, RES
     HLT
     END
