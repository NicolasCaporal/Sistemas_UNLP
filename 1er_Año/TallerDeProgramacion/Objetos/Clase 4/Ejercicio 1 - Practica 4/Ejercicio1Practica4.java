/*
1-A- Incluya la clase Triángulo a la jerarquía de figuras vista (carpeta tema4). Triángulo
debe heredar de Figura todo lo que es común y definir su constructor y sus atributos y
métodos propios. Además debe redefinir el método toString.

B- De igual manera, incluya la clase Círculo a la jerarquía de figuras.

C- Añada a la representación String el valor del perímetro. Piense ¿qué método toString
debe modificar: el de cada subclase o el de Figura?

D- Añada el método despintar que establece los colores de la figura a línea “negra” y
relleno “blanco”. Piense ¿dónde debe definir el método: en cada subclase o en Figura?

E- Realizar un programa que instancie un triángulo y un círculo. Muestre en consola la
representación String de cada uno. Pruebe el funcionamiento del método despintar
 */

package Practica4;

import PaqueteLectura.Lector;


public class Ejercicio1Practica4 {
    public static void main (String [] args){
        
        System.out.print("Ingrese color de relleno del triangulo: ");
        String colorRellenoTri = Lector.leerString();
        
        System.out.print("Ingrese color de linea del triangulo: ");
        String colorLineaTri = Lector.leerString();        
        
        System.out.print("Ingrese longitud del lado 1: ");
        double lado1 = Lector.leerDouble();
        
        System.out.print("Ingrese longitud del lado 2: ");
        double lado2 = Lector.leerDouble();
        
        System.out.print("Ingrese longitud del lado 3: ");
        double lado3 = Lector.leerDouble();
        
        Triangulo triangulo = new Triangulo(lado1, lado2, lado3, colorRellenoTri, colorLineaTri);
        System.out.println();
        
        
        System.out.print("Ingrese color de relleno del circulo: ");
        String colorRellenoCir = Lector.leerString();
        
        System.out.print("Ingrese color de linea del circulo: ");
        String colorLineaCir = Lector.leerString();  
        
        System.out.print("Ingrese longitud del radio: ");
        double radio = Lector.leerDouble();
        
        Circulo circulo = new Circulo (radio, colorRellenoCir, colorLineaCir);
        System.out.println();
        
        System.out.println(triangulo.toString());
        System.out.println();
        
        System.out.println(circulo.toString());
        System.out.println();
        
        System.out.println("Despintando circulo...");
        circulo.despintar();
        System.out.println("CR: " + circulo.getColorRelleno() + " CL: " + circulo.getColorLinea());
                
        
    }
}
