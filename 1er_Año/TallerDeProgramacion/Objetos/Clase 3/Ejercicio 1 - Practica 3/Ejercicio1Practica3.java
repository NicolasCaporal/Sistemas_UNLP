/*
B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área. 
 */
package Practica3;

import PaqueteLectura.Lector;

public class Ejercicio1Practica3 {
    public static void main (String[] args){
        
        double lado1;
        System.out.print("Ingrese lado 1: ");
        lado1 = Lector.leerDouble();
        
        double lado2;
        System.out.print("Ingrese lado 2: ");
        lado2 = Lector.leerDouble();
        
        double lado3;
        System.out.print("Ingrese lado 3: ");
        lado3 = Lector.leerDouble();
        
        String colorRelleno;
        System.out.print("Ingrese color de relleno: ");
        colorRelleno = Lector.leerString();
        
        String colorBorde;
        System.out.print("Ingrese color del borde: ");
        colorBorde = Lector.leerString();
        
        Triangulo t = new Triangulo (lado1, lado2, lado3, colorRelleno, colorBorde);
        
        System.out.println();
        System.out.println("El perimetro del triangulo es: " + t.calcularPerimetro());
        System.out.println("El area del triangulo es: " + t.calcularArea());
        System.out.println();
    } 
    
}
