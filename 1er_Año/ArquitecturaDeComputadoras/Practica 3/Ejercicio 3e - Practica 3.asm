;e) Idem al d), pero ahora utilizar el HAND-SHAKE en modo interrupciones. 
;Escribir un programa que solicite el ingreso de cinco caracteres por teclado y los almacene en memoria.
;Una vez ingresados, que los envíe a la impresora a través del HAND-SHAKE, en primer lugar tal cual
;fueron ingresados y a continuación en sentido inverso. Utilizar el HAND-SHAKE en modo interrupciones.

EOI EQU 20H 
IMR EQU 21H
ID_HS EQU 10 
INT2 EQU 26H 
HABILITAR_HS EQU 11111011b 
FIN_INT EQU 20H

H_DATO EQU 40H
H_ESTADO EQU 41H

ORG 40 
    DW RUT_IMPRIMIR


ORG 1000H
    MSJ DB "PRESIONE 5 TECLAS"
    INI_STR DB ?
    STRING DB "xxxxx"
    FIN_STR DB ?


ORG 3000H
RUT_IMPRIMIR: PUSH AX
              CMP DL, 1
              JNZ INV
  
        ORD:  MOV AL, [BX]
              OUT H_DATO, AL
              INC BX
              CMP BX, OFFSET FIN_STR
              JNZ FIN_IMP
              
              MOV DL, 0
              DEC BX
              JMP FIN_IMP
    
        INV:  MOV AL, [BX]
              OUT H_DATO, AL
              DEC BX
              CMP BX, OFFSET INI_STR
              JNZ FIN_IMP 
    
     CORTAR:  MOV AL, 0FFh
              OUT IMR, AL
    
     FIN_IMP: MOV AL, FIN_INT
              OUT EOI, AL
              POP AX 
              IRET


ORG 2000H
CLI 
    MOV AL, ID_HS
    OUT INT2, AL 

    MOV AL, HABILITAR_HS 
    OUT IMR, AL 


    MOV BX, OFFSET MSJ 
    MOV AL, OFFSET INI_STR-OFFSET MSJ
    INT 7 

    IN AL, H_ESTADO 
    OR AL, 10000000b
    OUT H_ESTADO, AL

    MOV CL, 5
    MOV BX, OFFSET STRING
    REPETIR: INT 6 
    INC BX 
    DEC CL 
    JNZ REPETIR

    MOV BX, OFFSET STRING
    MOV DL, 1
STI

    PROCESA: CMP BX, OFFSET INI_STR
             JNZ PROCESA 

    INT 0
END