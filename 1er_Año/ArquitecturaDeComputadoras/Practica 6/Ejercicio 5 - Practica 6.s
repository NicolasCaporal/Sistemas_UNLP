# 5) Escriba un programa que calcule el resultado de elevar un valor en punto flotante a la potencia indicada por un
# exponente que es un número entero positivo. Para ello, en el programa principal se solicitará el ingreso de la base (un
# número en punto flotante) y del exponente (un número entero sin signo) y se deberá utilizar la subrutina
# a_la_potencia para calcular el resultado pedido (que será un valor en punto flotante). Tenga en cuenta que
# cualquier base elevada a la 0 da como resultado 1. Muestre el resultado numérico de la operación en la salida estándar
# del simulador (ventana Terminal). 

.data 
    CONTROL: .word 0x10000
    DATA: .word 0x10008
    base: .double 0
    exponente: .double 0
    resultado: .double 0

.code 
    lwu $s0, CONTROL($zero)
    lwu $s1, DATA($zero)

    daddi $t0, $zero, 8
    sd $t0, 0($s0)
    l.d f0, 0($s1)
    s.d f0, base($0)

    sd $t0, 0($s0)
    ld $s3, 0($s1)
    sd $s3, exponente($0)

    daddi $a0, $zero, base 
    dadd $a1, $zero, $s3
    jal a_la_potencia

    l.d f5, 0($v0)
    s.d f5, 0($s1)
    daddi $t1, $zero, 3 
    sd $t1, 0($s0)

    halt


a_la_potencia: daddi $t1, $zero, 1
               mtc1 $t1, f0
               cvt.d.l f0, f0
               beqz $a1, ret_1
               l.d f1, 0($a0)
               l.d f10, 0 ($a0)
               mtc1 $a1, f3
               cvt.d.l f2, f3
               
               bucle: mul.d f10, f10, f1 
                   sub.d f2, f2, f0
                   c.le.d f2, f0
                   bc1f bucle 
   
               s.d f10, resultado($0)
               daddi $v0, $zero, resultado 
               jr $ra 
   
               ret_1: s.d f0, resultado($0)
               daddi $v0, $zero, resultado
               jr $ra 