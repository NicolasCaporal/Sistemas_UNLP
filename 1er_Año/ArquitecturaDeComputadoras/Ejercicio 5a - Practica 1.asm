; Escribir un programa que dados los valores etiquetados como A, B y C y almacenados en la memoria de datos,
;calcule A+B-C y guarde el resultado en la memoria con etiqueta D, sin utilizar subrutinas. 

ORG 1000H
A DB 5
B DB 10
C DB 2
D DB ?

ORG 2000H
MOV AL, A 
MOV BL, B
ADD AL, BL 
MOV CL, C 
SUB AL, CL 
MOV D, AL 

HLT
END
END
