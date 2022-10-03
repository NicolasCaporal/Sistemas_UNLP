/*
1- Se dispone de la clase Persona (en la carpeta tema2). Un objeto persona puede crearse
sin valores iniciales o enviando en el mensaje de creación el nombre, DNI y edad (en ese
orden). 

Realice un programa que cree un objeto persona con datos leídos desde teclado. Luego
muestre en consola la representación de ese objeto en formato String. 
*/

package Practica2;

import PaqueteLectura.Lector;

/**
 *
 * @author nicol
 */
public class Ejercicio1Practica2 {
    
   public static void main(String[] args) { 
        
        Persona p = new Persona();
        
        System.out.print("Ingrese nombre: ");
        String nombre = Lector.leerString();
        p.setNombre(nombre);
        
        System.out.print("Ingrese DNI: ");
        int dni = Lector.leerInt();
        p.setDNI(dni);
        
        System.out.print("Ingrese edad: ");
        int edad = Lector.leerInt();
        p.setEdad(edad);
        
        System.out.println(p.toString());    
    }   
}

    

