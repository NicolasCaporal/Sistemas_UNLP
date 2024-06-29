package Parcial10_06_23;

public abstract class Seguro {
    protected Vehiculo vehiculo;

    public Seguro(Vehiculo vehiculo){
        this.vehiculo = vehiculo;
    }

    //templade method
    public double calcularCosto(int edad){
        return this.calcularSeguroVida(edad) + this.calcularDañosOtros(edad) + this.calcularDañosPropio();
    }

    public abstract double calcularSeguroVida(int edad);

    public abstract double calcularDañosOtros(int edad);

    public abstract double calcularDañosPropio();

}
