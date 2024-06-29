package Parcial10_06_23;

public class SeguroTodoRiesgo extends Seguro{
    
    public SeguroTodoRiesgo(Vehiculo vehiculo){
        super(vehiculo);
    }
    
    public double calcularSeguroVida(int edad){
        return 100*edad + 9000*this.vehiculo.getAntiguedad();
    }

    public double calcularDañosOtros(int edad){
        return 100000/edad;
    }

    public double calcularDañosPropio(){
        return this.vehiculo.getValor() * 0.5 + 1000 * this.vehiculo.getAntiguedad();
    }
    
}
