/*
4-A- Un hotel posee N habitaciones. De cada habitación conoce costo por noche, si está
    ocupada y, en caso de estarlo, guarda el cliente que la reservó (nombre, DNI y edad).

(i) Genere las clases necesarias. Para cada una provea métodos getters/setters adecuados.

(ii) Implemente los constructores necesarios para iniciar: los clientes a partir de nombre,
    DNI, edad; el hotel para N habitaciones, cada una desocupada y con costo aleatorio e/
    2000 y 8000.

(iii) Implemente en las clases que corresponda todos los métodos necesarios para:
    - Ingresar un cliente C en la habitación número X. Asuma que X es válido (es decir, está
        en el rango 1..N) y que la habitación está libre.
    - Aumentar el precio de todas las habitaciones en un monto recibido.
    - Obtener la representación String del hotel, siguiendo el formato:
        {Habitación 1: costo, libre u ocupada, información del cliente si está ocupada}
        …
        {Habitación N: costo, libre u ocupada, información del cliente si está ocupada}

B- Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones,
    muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.
 */

package Practica3;

import PaqueteLectura.Lector;

/**
 *
 * @author nicol
 */
public class Ejercicio4Practica3 {
    public static void main (String [] args){
        int dimF;
        System.out.print("Ingrese cantidad de habitaciones: ");
        dimF = Lector.leerInt(); 
        Hotel hotel = new Hotel(dimF);
        
        System.out.println("Ingrese los datos. Para finalizar, ingrese habitacion 0");
        System.out.print("Ingrese habitacion: ");
        int nroHabitacion = Lector.leerInt();
        
        while (nroHabitacion != 0){
            String nombre;
            int DNI;
            int edad;
            
            System.out.print("Ingrese nombre: ");
            nombre = Lector.leerString();
            System.out.print("Ingrese DNI: ");
            DNI = Lector.leerInt();
            System.out.print("Ingrese edad: ");
            edad = Lector.leerInt();
            Cliente c = new Cliente(nombre, DNI, edad);
            
            hotel.insertarCliente(c, nroHabitacion-1);
            
            System.out.print("Ingrese habitacion: ");
            nroHabitacion = Lector.leerInt();
        }
        
        System.out.println();
        System.out.println(hotel.toString());
        System.out.println();
        
        double aumento;
        System.out.print("Ingrese aumento de precio: ");
        aumento = Lector.leerDouble();
        hotel.aumentarCosto(aumento);
        
        System.out.println();
        System.out.println(hotel.toString());
        System.out.println();
    }
    
}
