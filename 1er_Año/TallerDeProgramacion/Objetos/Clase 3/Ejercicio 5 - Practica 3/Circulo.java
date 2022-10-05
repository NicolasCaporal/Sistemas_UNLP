
package Practica3;

public class Circulo {
    private double radio;
    private String colorRelleno; 
    private String colorLinea;
    
    public Circulo (double radio, String colorRelleno, String colorLinea){
        this.radio = radio;
        this.colorLinea = colorLinea;
        this.colorRelleno = colorRelleno;
    }
    
    public String getColorRelleno (){
        return colorRelleno;
    }
    
    public String getColorLinea (){
        return colorLinea;
    }

    public double getRadio () {
        return radio;
    }
    
    public void setRadio (double radio) {
        this.radio = radio;
    }
    
    public void setColorRelleno (String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }
    
    public void setColorLinea (String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public double calcularPerimetro (){
        return 2 * Math.PI * this.radio;
    }
    
    public double calcularArea (){
        return this.radio * this.radio * Math.PI;
    }
}
