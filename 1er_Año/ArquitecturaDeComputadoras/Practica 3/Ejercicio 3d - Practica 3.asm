;d) Escribir un programa que solicite el ingreso de cinco caracteres por teclado y los almacene en memoria.
;Una vez ingresados, que los envíe a la impresora a través del HAND-SHAKE, en primer lugar tal cual
;fueron ingresados y a continuación en sentido inverso. Utilizar el HAND-SHAKE en modo consulta de
;estado. 

H_DATO EQU 40H
H_ESTADO EQU 41H

ORG 1000H
    MSJ DB "PRESIONE 5 TECLAS"
    INI_STR DB ?
    STRING DB "xxxxx"
    FIN_STR DB ?

ORG 2000H

    MOV BX, OFFSET MSJ
    MOV AL, OFFSET INI_STR-OFFSET MSJ
    INT 7

    MOV CL, 5
    MOV BX, OFFSET STRING 

    REPETIR: INT 6
             INC BX 
             DEC CL 
             JNZ REPETIR


    IN AL, H_ESTADO
    AND AL, 01111111b
    OUT H_ESTADO, AL
    
    MOV DL, 1
    MOV BX, OFFSET STRING


    POLL: IN AL, H_ESTADO
          AND AL, 1
          JNZ POLL
  
          CMP DL, 1
          JNZ INV
  
    ORD:  MOV AL, [BX]
          OUT H_DATO, AL
          INC BX
          CMP BX, OFFSET FIN_STR
          JNZ POLL
          
          MOV DL, 0
          DEC BX
          
    INV:  MOV AL, [BX]
          OUT H_DATO, AL
          DEC BX
          CMP BX, OFFSET INI_STR
          JNZ POLL

    INT 0
END