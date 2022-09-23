/* 2- Escriba un programa que lea las alturas de los 15 jugadores de un equipo de
básquet y las almacene en un vector. Luego informe:
- la altura promedio
- la cantidad de jugadores con altura por encima del promedio
NOTA: Dispone de un esqueleto para este programa en Ej02Jugadores.java */

package tema1;
import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        int DF = 15;
        
        double [] vector;
        
        vector = new double [DF];
        
        int i;
        double sumaAlturas = 0;
        double alturaPromedio;
        int contador = 0;
                
        for (i=0; i<DF; i++){
            System.out.print("Ingrese altura del jugador " + (i+1) + ": ");
            vector[i] = Lector.leerDouble();
            sumaAlturas += vector[i];
        }
        
        alturaPromedio = sumaAlturas / DF; 
     
        for (i=0; i<DF; i++){
            if (vector[i] > alturaPromedio) {
                contador++;
            }
        }
        
        System.out.println("La cantidad de jugadores con altura mayor al promedio (" + alturaPromedio + ") es " + contador);   
    }
}