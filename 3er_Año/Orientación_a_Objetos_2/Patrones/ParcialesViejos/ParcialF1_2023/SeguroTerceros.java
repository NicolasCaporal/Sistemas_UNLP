package Parcial10_06_23;

public class SeguroTerceros extends Seguro{
    
    public SeguroTerceros(Vehiculo vehiculo){
        super(vehiculo);
    }
    
    public double calcularSeguroVida(int edad){
        return 100*edad;
    }

    public double calcularDañosOtros(int edad){
        return 1000 + this.vehiculo.getValor()*0.01;
    }

    public double calcularDañosPropio(){
        return this.vehiculo.getValor() * 0.5;
    }
    
}
