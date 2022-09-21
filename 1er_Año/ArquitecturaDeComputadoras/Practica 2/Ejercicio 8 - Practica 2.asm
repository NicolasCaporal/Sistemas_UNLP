;8) Escribir un programa que efectúe la resta de dos números (de un dígito cada uno) ingresados por teclado y muestre el
;resultado en la pantalla de comandos. Antes de visualizarlo el programa debe verificar si el resultado es positivo o negativo
;y anteponer al valor el signo correspondiente.

ORG 1000H
    NUM1 DB ?
    NUM2 DB ?
    RES DB ?
    MAS DB " + "
    MENOS DB " - "
    IGUAL DB " = "

ORG 2000H
    MOV BX, OFFSET NUM1 
    INT 6
    MOV CL, NUM1
    SUB CL, 48
    MOV AL, 1
    INT 7


    MOV BX, OFFSET MENOS 
    MOV AL, 3
    INT 7

    MOV BX, OFFSET NUM2
    INT 6
    MOV CH, NUM2
    SUB CH, 48
    MOV AL, 1
    INT 7

    MOV BX, OFFSET IGUAL
    MOV AL, 3
    INT 7

    MOV AL, 2
    MOV DL, CL
    SUB DL, CH 
    JS NEGATIVO 
    POSITIVO: MOV BX, OFFSET MAS
              JMP IMPRIMIR
    NEGATIVO: MOV BX, OFFSET MENOS 
              NEG DL
    IMPRIMIR: INT 7
              ADD DL, 48
              MOV RES, DL 
              MOV BX, OFFSET RES
              MOV AL, 1
              INT 7

    INT 0
END