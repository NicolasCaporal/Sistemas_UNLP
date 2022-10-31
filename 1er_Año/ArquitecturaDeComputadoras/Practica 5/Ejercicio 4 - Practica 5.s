# 4) El índice de masa corporal (IMC) es una medida de asociación entre el peso y la talla de un individuo.
# Se calcula a partir del peso (expresado en kilogramos, por ejemplo: 75,7 kg) y la estatura (expresada en metros,
# por ejemplo 1,73 m), usando la fórmula: IMC = peso / (estatura)^2
# De acuerdo al valor calculado con este índice, puede clasificarse el estado nutricional de una persona en:
# Infrapeso (IMC < 18,5), Normal (18,5 ≤ IMC < 25), Sobrepeso (25 ≤ IMC < 30) y Obeso (IMC ≥ 30).
# Escriba un programa que dado el peso y la estatura de una persona calcule su IMC y lo guarde en la dirección
# etiquetada IMC. También deberá guardar en la dirección etiquetada estado un valor según la siguiente tabla:

    #   IMC    Clasificación  Valor guardado
    #  < 18,5    Infrapeso          1
    #  < 25      Normal             2
    #  < 30      Sobrepeso          3
    #  ≥ 30      Obeso              4

.data 
    IMC: .double -1
    peso: .double 65.7
    altura: .double 1.80
    estado: .word -1

    infrapeso: .double 18.5 
    normal: .double 25 
    sobrepeso: .double 30


.code 
    l.d f1, altura (r0) 
    mul.d f1, f1, f1 
    l.d f0, peso (r0)
    div.d f1, f0, f1 
    s.d f1, IMC (r0) 

    daddi r1, r0, 0 #Chequeo error
    mtc1 r1, f2
    cvt.d.l f2, f2 
    c.le.d  f1, f2
    bc1f infrapeso 
    daddi r5, r0, -1
    j fin 

    infrapeso:  l.d f2, infrapeso (r0)
                c.lt.d f1, f2 
                bc1f normal
                daddi r5, r0, 1
                j fin

    normal:     l.d f2, normal (r0)
                c.lt.d f1, f2 
                bc1f sobrepeso 
                daddi r5, r0, 2 
                j fin 

    sobrepeso:  l.d f2, sobrepeso (r0) 
                c.lt.d f1, f2 
                bc1f obeso 
                daddi r5, r0, 3
                j fin 

    obeso:      daddi r5, r0, 4

    fin: sd r5, estado (r0)

halt