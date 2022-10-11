/*
5-A- Modifique la clase VisorFiguras: ahora debe permitir guardar las figuras a mostrar (a
lo sumo 5) y también mostrar todas las figuras guardadas. Use la siguiente estructura.

B- Realice un programa que instancie el visor, guarde dos cuadrados y un rectángulo en el
visor y por último haga que el visor muestre sus figuras almacenadas.
 */

package Practica4;

public class Ejercicio5Practica4 {

    public static void main (String [] args){
        VisorFiguras visor = new VisorFiguras ();
        
        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
        Cuadrado c2 = new Cuadrado(30,"Rojo","Naranja");
        Rectangulo r = new Rectangulo(20,10,"Azul","Celeste");
        
        visor.guardar(c1);
        visor.guardar(c2);
        visor.guardar(r);
        
        visor.mostrar();
    }  
}
