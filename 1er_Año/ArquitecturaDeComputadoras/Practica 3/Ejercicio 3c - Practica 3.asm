;c) * Escribir un programa que imprime “UNIVERSIDAD NACIONAL DE LA PLATA” en la impresora a
;través del HAND-SHAKE. La comunicación se establece por interrupciones emitidas desde el HANDSHAKE cada vez que la impresora se desocupa. 

EOI EQU 20H 
FIN_INT EQU 20H
IMR EQU 21H
INT2 EQU 26H
ID_IMPR EQU 10
HABILITAR_HS EQU 11111011b
H_DATO EQU 40H
H_ESTADO EQU 41H


ORG 40 
    DW IMPRIMIR

ORG 1000H
MSJ DB "UNIVERSIDAD NACIONAL DE LA PLATA"
FIN_MSJ DB ? 

ORG 3000H
IMPRIMIR: PUSH AX
          MOV AL, [BX]
          OUT H_DATO, AL
          INC BX  
          CMP BX, OFFSET FIN_MSJ
          JNZ FIN 
          MOV AL, 0FFh
          OUT IMR, AL
    FIN:  MOV AL, FIN_INT
          OUT EOI, AL 
          POP AX
          IRET

ORG 40

ORG 2000H
CLI
    MOV AL, ID_IMPR
    OUT INT2, AL

    MOV AL, HABILITAR_HS 
    OUT IMR, AL 

    IN AL, H_ESTADO
    OR AL, 10000000b
    OUT H_ESTADO, AL

    MOV BX, OFFSET MSJ

STI

POLL: CMP BX, OFFSET FIN_MSJ
JNZ POLL 

INT 0
END