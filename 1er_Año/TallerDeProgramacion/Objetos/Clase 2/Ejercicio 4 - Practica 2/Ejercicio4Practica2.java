/* 
4- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.

a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.

Una vez finalizada la inscripción:
b) Informar para cada día y turno el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona y pensar en la estructura de datos a utilizar.  
*/

package Practica2;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio4Practica2 {
    public static Persona leerPersona(){
        
        Persona aux = new Persona();
        
        System.out.print("Ingrese DNI: ");
        aux.setDNI(GeneradorAleatorio.generarInt(1000));
        System.out.println(aux.getDNI());
        
        System.out.print("Ingrese edad: ");
        aux.setEdad(GeneradorAleatorio.generarInt(100));
        System.out.println(aux.getEdad());
        
        if (aux.getEdad() < 5){
            aux.setNombre("ZZZ");
        } else {
            System.out.print("Ingrese nombre: ");
            aux.setNombre(GeneradorAleatorio.generarString(3));
        }
        System.out.println(aux.getNombre());
        
        
        System.out.println();
        
        return aux;
    }
    
    public static void main(String[] args){
        // a) Simular el proceso de inscripción de personas al casting.
        GeneradorAleatorio.iniciar();
        int dias = 5;
        int turnos = 8;
        int dimF = 40;
        int dimL = 0;
        
        Persona [][] matriz = new Persona [dias][turnos];
        Persona aux;
        
        aux = leerPersona();
        int f = 0;
        int c;
        while ((f < dias) && (dimL < dimF) && (aux.getNombre() != "ZZZ")){
            c= 0;
            while ((c < turnos) && (dimL < dimF) && (aux.getNombre() != "ZZZ")){
                matriz[f][c] = aux;
                dimL++;
                c++;
                aux = leerPersona();
            }
            f++;
        }

        // b) Informar para cada día y turno el nombre de la persona a entrevistar.
        int i = 1;
        f = 0;
        while ((f < dias) && (i <= dimL)){
            c = 0;
            while ((c < turnos) && (i <= dimL)){
                System.out.println(i + "/" + dimL); 
                System.out.println("Nombre: " +  matriz[f][c].getNombre() + " Día: " + (f+1) + " Turno: " + (c+1));
                System.out.println();
                c++;
                i++;
            }
            f++;       
        }   
    } 
} 
