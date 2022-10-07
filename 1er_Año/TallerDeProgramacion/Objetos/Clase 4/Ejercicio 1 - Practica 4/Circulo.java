
package Practica4;

public class Circulo extends Figura {
    private double radio;
    
    public Circulo (double radio, String colorR, String colorL){
        super(colorR, colorL);
        this.radio = radio;
    }
    
    public void setRadio (double radio){
        this.radio = radio;
    }
    
    public double getRadio (){
        return radio;
    }
    
    public double calcularPerimetro (){
        return 2 * Math.PI * this.radio;
    }
    
    public double calcularArea (){
        return this.radio * this.radio * Math.PI;
    }
    
    public String toString () {
        String aux1 = super.toString();
        String aux2 = "Radio: " + radio + " ";
        return aux2 + aux1;
    }
    
}
