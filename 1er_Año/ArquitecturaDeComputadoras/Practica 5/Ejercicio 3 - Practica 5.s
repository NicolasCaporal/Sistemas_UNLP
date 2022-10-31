# 3) *Escribir un programa que calcule la superficie de un triángulo rectángulo de base 5,85 cm y altura 13,47 cm.
# Pista: la superficie de un triángulo se calcula como:
# Superficie = (base x altura) / 2 

.data 
    base: .double 5.85
    altura: .double 13.47
    superficie: .double -1 

.code 
    l.d f1, base (r0)
    l.d f2, altura(r0)
    mul.d f1, f1, f2 

    daddi r1, r0, 2
    mtc1 r1, f3
    cvt.d.l f3, f3
    div.d f1, f1, f3 

    s.d f1, superficie (r0)

halt