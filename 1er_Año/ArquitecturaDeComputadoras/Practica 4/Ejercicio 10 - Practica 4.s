#10) Escribir un programa que cuente la cantidad de veces que un determinado caracter aparece en una cadena de texto. Observar
#cómo se almacenan en memoria los códigos ASCII de los caracteres (código de la letra “a” es 61H). Utilizar la instrucción lbu
#(load byte unsigned) para cargar códigos en registros. La inicialización de los datos es la siguiente:

.data
    cadena: .asciiz "adbdcdedfdgdhdidzzaabcdcabodca" ; cadena a analizar
    car: .asciiz "d" ; caracter buscado
    cant: .word 0 ; cantidad de veces que se repite el caracter car en cadena.

.code 
    dadd r3, r0, r0 #Desplazamiento
    lbu r2, car(r0) #Caracter a buscar
    dadd r1, r0, r0 #Contador Resultado

    loop: lbu r4, cadena(r3) #Carga caracter actual
        bne r2, r4, siguiente 
        daddi r1, r1, 1
        siguiente: daddi r5, r5, -1
        daddi r3, r3, 1
        bnez r4, loop

sd r1, cant(r0)
halt