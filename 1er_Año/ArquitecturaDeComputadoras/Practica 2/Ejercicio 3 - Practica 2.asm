;3) * Escribir un programa que muestre en pantalla las letras del abecedario, sin espacios, intercalando mayusculas y
;minusculas (AaBb...), sin incluir texto en la memoria de datos del programa. Tener en cuenta que
;el codigo de 'A' es 41H,
;el de 'a' es 61H y que el resto de los codigos son correlativos segun el abecedario. 


ORG 1000H
STRING DB ?

ORG 2000H
MOV CL, 41H
MOV BX, OFFSET STRING

LOOP: MOV [BX], CL
      ADD CL, 20H
      INC BX 
      MOV [BX], CL 
      SUB CL, 1FH
      INC BX
      CMP CL, 5BH
      JNZ LOOP 

      SUB BX, OFFSET STRING
      MOV AL, BL
      MOV BX, OFFSET STRING 
      INT 7

      INT 0 
END