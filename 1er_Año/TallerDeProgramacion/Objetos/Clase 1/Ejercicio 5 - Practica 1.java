/*
5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen 
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad 
de la comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes 
para cada uno de los aspectos y almacene la información en una estructura. 
Luego imprima la calificación promedio obtenida por cada aspecto.
 */

package tema1;

import PaqueteLectura.GeneradorAleatorio;

public class Ej05Matrices {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
    
        int filas = 5;
        int columnas = 4;
        
        int [][] matriz = new int [filas][columnas];
        
        for (int c = 0; c < filas; c++){
            
            System.out.println("Ingrese atencion al cliente: ");
            matriz[c][0] = GeneradorAleatorio.generarInt(10)+1;
            System.out.println(matriz[c][0]);
            
            System.out.println("Ingrese calidad: ");
            matriz[c][1] = GeneradorAleatorio.generarInt(10)+1;
            System.out.println(matriz[c][1]);
            
            System.out.println("Ingrese precio: ");
            matriz[c][2] = GeneradorAleatorio.generarInt(10)+1;
            System.out.println(matriz[c][2]);
            
            System.out.println("Ingrese ambiente: ");
            matriz[c][3] = GeneradorAleatorio.generarInt(10)+1;
            System.out.println(matriz[c][3]);
        }    
        System.out.println();   
        
        
        for (int f = 0; f < filas; f++){
            for (int c = 0; c < columnas; c++){
                if (matriz[f][c] < 10){
                    System.out.print("0" + matriz[f][c] + " ");
                    
                }
                else
                    System.out.print( matriz[f][c] + " " );
            }
            System.out.println();
        }   
        System.out.println();
        
        
        double [] calificaciones = new double [4];
        int c;
        
        for (c = 0; c < columnas; c++){
            double suma = 0;
            for (int f = 0; f < filas; f++){
                suma = suma + matriz[f][c]; 
            }
            calificaciones[c] = suma / filas;
        }
        
        System.out.println("Calificaciones promedio por aspectos: ");
        for (int i = 0; i < columnas; i++){
            System.out.println("Aspecto " + (i+1) + ": " + calificaciones[i]);
        }
        System.out.println();
        
    }    
}