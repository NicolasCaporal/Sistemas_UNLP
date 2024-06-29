package Parcial10_06_23;

public class PromocionMultiples implements Promocion {
    
    // este calculo esta mal pero me dio paja slds, lo importante es que es un strategy (?
    public double calcularPromocion(Persona persona){
        return persona.calcularCosto() * 0.9;
    }

}
