#9) Escribir un programa que implemente el siguiente fragmento escrito en un lenguaje de alto nivel:

# while a > 0 do
# begin
#   x := x + y;
#   a := a - 1;
# end;

# Ejecutar con la opción Delay Slot habilitada. 

.data 
    X: .word 0
    Y: .word 2 
    a: .word 6

.code 
    ld r1, a(r0)
    ld r2, X(r0)
    ld r3, Y(r0)

    while: slt r4, r0, r1 #Si 0 < r1, r4 = 1
           daddi r1, r1, -1
           beqz r4, fin
           nop #Para evitar que sume si a <= 0
           dadd r2, r2, r3 
           j while 
           nop #Para evitar RAW

fin: sd r2, X(r0)
halt