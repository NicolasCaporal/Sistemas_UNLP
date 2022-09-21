;6) * Escribir un programa que solicite el ingreso de un número (de un dígito) por teclado y muestre en pantalla dicho
;número expresado en letras. Luego que solicite el ingreso de otro y así sucesivamente. Se debe finalizar la ejecución al
;ingresarse en dos vueltas consecutivas el número cero. 

ORG 1000H
    MSJ DB "INGRESE UN NUMERO: "
    FIN_MSJ DB ?

     CERO DB "CERO   "
          DB "UNO    "
          DB "DOS    "
          DB "TRES   "
          DB "CUATRO " 
          DB "CINCO  "
          DB "SEIS   "
          DB "SIETE  "
          DB "OCHO   "
          DB "NUEVE  "
ENTER DB 13H

ORG 1500H
    NUM DB ?

ORG 3000H
IMPRIMIR_NUM: PUSH AX 
    PUSH CX
    PUSH BX


    MOV AX, [BX]
    MOV BX, OFFSET CERO 
    MOV AH, 0
    SUB AL, 48
    JZ IMPR
    
    BUCLE: ADD BX, 7 
        DEC AL
        CMP AL, 0
        JNZ BUCLE

IMPR: MOV AL, 7
      INT 7

    FIN_IMPR: POP BX
    POP CX 
    POP AX
    RET




ORG 2000H
    MOV BX, OFFSET MSJ 
    MOV AL, OFFSET FIN_MSJ-OFFSET MSJ
    INT 7

    MOV CX, 0

REPETIR: MOV BX, OFFSET NUM 
         INT 6

         CALL IMPRIMIR_NUM
         
         MOV AX, [BX]
         SUB AL, 48
         CMP AL, 0
         JZ SUMAR_0
         MOV CL, 0
         JMP REPETIR
         
SUMAR_0: INC CL
         CMP CL, 2
         JZ FIN
         JMP REPETIR
       
    FIN: INT 0

END