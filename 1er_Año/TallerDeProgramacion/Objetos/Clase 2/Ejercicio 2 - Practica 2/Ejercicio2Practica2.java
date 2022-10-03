/* 
2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:
 - Informe la cantidad de personas mayores de 65 años.
 - Muestre la representación de la persona con menor DNI. 
*/

package Practica2;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio2Practica2 {
    public static Persona leerPersona(){
        
        Persona aux = new Persona();
        System.out.print("Ingrese nombre: ");
        aux.setNombre(GeneradorAleatorio.generarString(10));
        System.out.println(aux.getNombre());
        
        System.out.print("Ingrese DNI: ");
        aux.setDNI(GeneradorAleatorio.generarInt(1000));
        System.out.println(aux.getDNI());
        
        System.out.print("Ingrese edad: ");
        aux.setEdad(GeneradorAleatorio.generarInt(90));
        System.out.println(aux.getEdad());
        
        System.out.println();
        
        return aux;
    }
    
    public static void main(String[] args){
    
        GeneradorAleatorio.iniciar();
        
        // Generar información aleatoriamente hasta obtener edad 0. Como máximo 15.
        // Luego de almacenar la información en un vector.
        int dimF = 15;
        Persona vecPersonas [] = new Persona [dimF];
        
        
        int dimL = 0;
        Persona aux;
        aux = leerPersona();
        while ((aux.getEdad() != 0)&&(dimL < dimF)) {
            vecPersonas[dimL] = aux; 
            dimL++;
            aux = leerPersona();
        }
        
        
        System.out.println("IMPRIMIENDO VECTOR: ");
        int i = 0;
        while (i < dimL){
            System.out.println("Nombre: "+ vecPersonas[i].getNombre());
            System.out.println("DNI: "+ vecPersonas[i].getDNI());
            System.out.println("Edad: "+ vecPersonas[i].getEdad());
            System.out.println();
            i++;
        }
        
        i = 0;
        int contador = 0;
        Persona menorDNI = vecPersonas[0];
        while (i < dimL){
            if (vecPersonas[i].getEdad() > 60)
                contador++;
                       
            if (vecPersonas[i].getDNI() < menorDNI.getDNI())
                menorDNI = vecPersonas[i];
            
            i++;
        }
        
        System.out.println();
        System.out.println("La cantidad de personas mayores de 60 años es de: " + contador); 
        System.out.println();
        System.out.println("Persona con menor DNI: ");
        System.out.println(menorDNI.toString());
        System.out.println();
    } 
}
 