/*
1-A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
 */
package Practica3;

public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorBorde;
    
    public Triangulo (){ }
    
    public Triangulo (double unLado1, double unLado2, double unLado3, String unColorRelleno, String unColorBorde) {
        lado1 = unLado1;
        lado2 = unLado2;
        lado3 = unLado3;
        colorRelleno = unColorRelleno;
        colorBorde = unColorBorde;
    }
    
    public void setLado1 (double l1){
        lado1 = l1;
    }
    
    public void setLado2 (double l2){
        lado2 = l2;
    }
    
    public void setLado3 (double l3){
        lado3 = l3;
    }
    
    public void setColorRelleno(String cR){
        colorRelleno = cR;
    }
    
    public void setColorRBorde(String cB){
        colorBorde = cB;
    }
    
    public double getLado1(){
        return lado1;
    }
    
    public double getLado2(){
        return lado2;
    }
    
    public double getLado3(){
        return lado3;
    }
    
    public String getColorRelleno(){
        return colorRelleno;
    }
    
    public String getColorBorde(){
        return colorBorde;
    }
    
    public double calcularPerimetro (){
        double p = lado1 + lado2 + lado3;
        return p;
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
    
}
    

