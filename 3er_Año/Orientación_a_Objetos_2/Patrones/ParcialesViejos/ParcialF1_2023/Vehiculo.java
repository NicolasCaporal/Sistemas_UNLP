package Parcial10_06_23;

public class Vehiculo {
    private int antiguedad;
    private double valor;
    private int ocupantes;
    private Seguro seguro;

    public Vehiculo(int antiguedad, double valor, int ocupantes){
        this.antiguedad = antiguedad;
        this.valor = valor;
        this.ocupantes = ocupantes;
    }

    public double calcularCosto(int edad){
        return this.seguro.calcularCosto(edad);
    }
    
    public void setSeguro(Seguro seguro){
        this.seguro = seguro;
    }

    public int getAntiguedad(){
        return this.antiguedad;
    }

    public double getValor(){
        return this.valor;
    }

    public int getOcupantes(){
        return this.ocupantes;
    }

}
