/*
2- Queremos representar a los empleados de un club: jugadores y entrenadores.
- Cualquier empleado se caracteriza por su nombre, sueldo básico y antigüedad.
- Los jugadores son empleados que se caracterizan por el número de partidos jugados y
el número de goles anotados.
- Los entrenadores son empleados que se caracterizan por la cantidad de campeonatos
ganados.

A- Implemente la jerarquía de clases declarando atributos, métodos para
obtener/modificar su valor y constructores que reciban los datos necesarios.

B- Cualquier empleado debe responder al mensaje calcularEfectividad. La efectividad
del entrenador es el promedio de campeonatos ganados por año de antigüedad, mientras
que la del jugador es el promedio de goles por partido.

C- Cualquier empleado debe responder al mensaje calcularSueldoACobrar. El sueldo a
cobrar es el sueldo básico más un 10% del básico por cada año de antigüedad y además:

- Para los jugadores: si el promedio de goles por partido es superior a 0,5 se adiciona un
plus de otro sueldo básico.

- Para los entrenadores: se adiciona un plus por campeonatos ganados (5000$ si ha
ganado entre 1 y 4 campeonatos; $30.000 si ha ganado entre 5 y 10 campeonatos;
50.000$ si ha ganado más de 10 campeonatos).

D- Cualquier empleado debe responder al mensaje toString, que devuelve un String que
lo representa, compuesto por nombre, sueldo a cobrar y efectividad.

F- Realizar un programa que instancie un jugador y un entrenador. Informe la
representación String de cada uno.

NOTA: para cada método a implementar piense en que clase/s debe definir el método.
 */

package Practica4;

import PaqueteLectura.Lector;

public class Ejercicio2Practica4 {
    public static void main (String [] args){
    
        System.out.print("Ingrese nombre del jugador: ");
        String nombre = Lector.leerString();
        
        System.out.print("Ingrese sueldo basico: ");
        double sueldoB = Lector.leerDouble();
        
        System.out.print("Ingrese antiguedad: ");
        int antiguedad = Lector.leerInt();
        
        System.out.print("Ingrese cantidad de partidos jugados: ");
        int PJ = Lector.leerInt();
        
        System.out.print("Ingrese cantidad de goles: ");
        int goles = Lector.leerInt();
        
        Jugador jugador = new Jugador (nombre, sueldoB, antiguedad, PJ, goles);
        System.out.println();
        
        System.out.print("Ingrese nombre del entrnador: ");
        nombre = Lector.leerString();
        
        System.out.print("Ingrese sueldo basico: ");
        sueldoB = Lector.leerDouble();
        
        System.out.print("Ingrese antiguedad: ");
        antiguedad = Lector.leerInt();
        
        System.out.print("Ingrese cantidad de campeonatos ganados: ");
        int campeonatos = Lector.leerInt();
        
        Entrenador entrenador = new Entrenador (nombre, sueldoB, antiguedad, campeonatos);
        System.out.println();
        
        System.out.println(jugador.toString());
        System.out.println();
        System.out.println(entrenador.toString());  
    }
}
