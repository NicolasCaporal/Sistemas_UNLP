
package Practica4;

public class Triangulo extends Figura {
    
    private double lado1;
    private double lado2;
    private double lado3;
    
    public Triangulo (double lado1, double lado2, double lado3, String colorR, String colorL) { 
        super(colorR, colorL);
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }
    
    public void setLado1 (double lado1){
        this.lado1 = lado1;
    }
    
    public void setLado2 (double lado2){
        this.lado2 = lado2;
    }
    
    public void setLado3 (double lado3){
        this.lado3 = lado3;
    }
    
    public double getLado1 (){
        return lado1;
    }
    
    public double getLado2 (){
        return lado2;
    }
    
    public double getLado3 (){
        return lado3;
    }
    
    public double calcularPerimetro (){
        return lado1 + lado2 + lado3;
    }
    
    public double calcularArea (){
        double a;
        double s = (lado1 + lado2 + lado3)/2;
        double x = s*(s-lado1)*(s-lado2)*(s-lado3);
        if (x >= 0){
            a = Math.sqrt(x);
        } else {
            a = -1;
        }
        return a;
    }   
    
    public String toString (){
        String aux1 = super.toString();
        String aux2 = "Lado 1: " + lado1 + " Lado 2: " + lado2 + " Lado 3: " + lado3 + " ";
        return aux2 + aux1;
    }
    
    
}
