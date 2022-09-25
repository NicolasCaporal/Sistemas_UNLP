;1) Uso de las luces y las llaves a través del PIO. 
;a) * Escribir un programa que encienda las luces con el patrón 11000011, o sea, solo las 
;primeras y las últimas dos luces deben prenderse, y el resto deben apagarse. 

PB EQU 31H
CB EQU 33H
PATRON EQU 11000011b

ORG 2000H
    MOV AL, 00000000b
    OUT CB, AL
    
    MOV AL, PATRON
    OUT PB, AL

    INT 0
END
