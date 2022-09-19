;10) SWAP Escribir una subrutina SWAP que intercambie dos datos de 16 bits almacenados en memoria. Los
;parámetros deben ser pasados por referencia desde el programa principal a través de la pila.
;Para hacer este ejercicio, tener en cuenta que los parámetros que se pasan por la pila son las direcciones de memoria,
;por lo tanto para acceder a los datos a intercambiar se requieren accesos indirectos, además de los que ya se deben
;realizar para acceder a los parámetros de la pila. 

ORG 1000H
A DW 89FFh
B DW 12AAh

ORG 3000H
SWAP: MOV BX, SP 
      MOV DX, SP
      ADD BX, 2
      MOV AX, [BX]
      ADD BX, 2
      MOV CX, [BX]

      MOV BX, AX
      MOV AX, [BX]


      MOV BX, CX
      MOV CX, [BX]

      MOV BX, DX
      ADD BX, 2
      MOV DX, BX
      MOV BX, [BX]
      MOV [BX], CX

      MOV BX, DX
      ADD BX, 2
      MOV BX, [BX]
      MOV [BX], AX
RET


ORG 2000H
    MOV AX, OFFSET A
    PUSH AX
    MOV AX, OFFSET B
    PUSH AX 
    CALL SWAP 
    HLT
END