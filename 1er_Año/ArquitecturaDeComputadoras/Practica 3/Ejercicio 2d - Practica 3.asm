;d) * Escribir un programa que solicite ingresar caracteres por teclado y que recién al presionar la tecla F10
;los envíe a la impresora a través de la PIO. No es necesario mostrar los caracteres en la pantalla. 

PA EQU 30H
PB EQU 31H 
CA EQU 32H
CB EQU 33H

EOI EQU 20H 
IMR EQU 21H 
HABILITAR_F10 EQU 11111110b
FIN_INT EQU 20H 
ID_F10 EQU 10 
INT0 EQU 24H


ORG 40
    DW IMPRIMIR


ORG 3000H
    IMPRIMIR: PUSH AX
              PUSH BX
           
              IN AL, PA 
              AND AL, 11111101b 
              OUT PA, AL
           
              MOV BX, OFFSET INICIO_STR
              BUCLE: IN AL, PA 
                     AND AL, 1
                     JNZ BUCLE

                     MOV AL, [BX]
                     OUT PB, AL

                     INC BX
                     DEC CL 

                     IN AL, PA
                     OR AL, 00000010b
                     OUT PA, AL

                     IN AL, PA 
                     AND AL, 11111101b 
                     OUT PA, AL

                     CMP CL, 0
                     JNZ BUCLE

              MOV DL, 0
  
              MOV AL, FIN_INT
              OUT EOI, AL
  
              POP BX
              POP AX
    IRET


ORG 1000H
    INICIO_STR DB ?


ORG 2000H
CLI
    MOV AL, HABILITAR_F10
    OUT IMR, AL 

    MOV AL, ID_F10
    OUT INT0, AL 

    MOV AL, 11111101b
    OUT CA, AL 

    MOV AL, 0 
    OUT CB, AL 
STI


    MOV BX, OFFSET INICIO_STR
    MOV DL, 1
    
    REPETIR:   INT 6
               INC BX
               INC CL 
               CMP DL, 0
               JNZ REPETIR
           
INT 0
END