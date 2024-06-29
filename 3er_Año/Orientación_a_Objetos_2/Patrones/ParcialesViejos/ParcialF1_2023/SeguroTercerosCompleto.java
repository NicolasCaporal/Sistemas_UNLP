package Parcial10_06_23;

public class SeguroTercerosCompleto extends Seguro{
    
    public SeguroTercerosCompleto(Vehiculo vehiculo){
        super(vehiculo);
    }
    
    public double calcularSeguroVida(int edad){
        return 100*edad + 5000*this.vehiculo.getOcupantes();
    }

    public double calcularDañosOtros(int edad){
        return this.vehiculo.getAntiguedad() <= 4 ? 10000*this.vehiculo.getAntiguedad() : 4000*this.vehiculo.getAntiguedad();
    }

    public double calcularDañosPropio(){
        return this.vehiculo.getValor() * 0.5 + 10000;
    }
    
}
