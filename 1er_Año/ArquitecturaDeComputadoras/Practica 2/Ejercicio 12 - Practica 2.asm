;12) Interrupción por hardware: TIMER.
;Implementar a través de un programa un reloj segundero que muestre en pantalla los segundos transcurridos (00-59 seg)
;desde el inicio de la ejecución.

CONT EQU 10H
COMP EQU 11H
EOI EQU 20H
IMR EQU 21H
INT1 EQU 25H
ID_CLOCK EQU 10

HABILITAR_TIMER EQU 11111101b
FIN_INT EQU 20H

ORG 40
 DW MOSTRAR_SEG

ORG 1000H
    SEG DB ?
    SEG2   DB ?
    ESPACIO DB " "

ORG 3000H
DIV_10: MOV DX, 0
BUCLE_DIV:  SUB CL, 10
        INC DL
        CMP CL, 10
        JS FIN_D 
        JMP BUCLE_DIV
FIN_D:  RET

MOSTRAR_SEG: PUSH AX
             INC CL
             MOV BX, OFFSET SEG
             MOV BYTE PTR [BX], CL
             ADD BYTE PTR [BX], 48
             CMP CL, 10
             JNS DOS_DIGITOS
             MOV AL, 1
             INT 7
             JMP FIN

    DOS_DIGITOS: PUSH CX
                 CALL DIV_10
                 ADD DL, 48
                 MOV [BX], DL
                 INC BX
                 ADD CL, 48
                 MOV [BX], CL
                 DEC BX
                 MOV AL, 2
                 POP CX
                 INT 7

    FIN: MOV AL, 1
    MOV BX, OFFSET ESPACIO
    INT 7

    MOV AL, 0
    OUT CONT, AL


    MOV AL, FIN_INT
    OUT EOI, AL
    POP AX
IRET

ORG 2000H
    CLI
        MOV AL, HABILITAR_TIMER
        OUT IMR, AL

        MOV AL, 00
        OUT CONT, AL

        MOV AL, ID_CLOCK
        OUT INT1, AL

        MOV AL, 1
        OUT COMP, AL

        MOV AL, 00
        OUT CONT, AL

        MOV CL, 0
    STI

    BUCLE: JMP BUCLE
    INT 0
END
