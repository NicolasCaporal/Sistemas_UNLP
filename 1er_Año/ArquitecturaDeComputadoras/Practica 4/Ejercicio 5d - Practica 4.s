# d) Modificar el programa para aprovechar el ‘Delay Slot’ ejecutando una instrucción útil. 
# Simular y comparar número de ciclos, instrucciones y CPI obtenidos con los de la versión anterior

.data
    cant: .word 8
    datos: .word 1, 2, 3, 4, 5, 6, 7, 8
    res: .word 0

 .code
    dadd r1, r0, r0 #Inicializa en 0 R1. 
    ld r2, cant(r0) #Longitud del array datos en R2
    
    loop: ld r3, datos(r1) #Carga en R3 el dato actual.
          daddi r2, r2, -1 #Decrementa R2
          dsll r3, r3, 1 #Multiplica R3 * 2
          sd r3, res(r1) #Guarda R3 en la direccion res + r1
          bnez r2, loop #Si R2 != 0, salta a loop
          daddi r1, r1, 8 #Pasa al siguiente
halt 