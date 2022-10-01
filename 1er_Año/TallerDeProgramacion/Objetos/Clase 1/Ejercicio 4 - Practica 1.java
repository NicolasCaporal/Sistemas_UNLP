/* 4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). Realice un programa que permita informar la cantidad de personas que
concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
de piso 9. Al finalizar la llegada de personas, informe lo pedido.*/
package tema1;

import PaqueteLectura.GeneradorAleatorio;

public class Ej04Matrices {
    
    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        int pisos = 8;
        int oficinas = 4;
        
        int [][] matriz = new int [pisos][oficinas];
       
        for (int f = 0; f < pisos; f++){
            for (int c = 0; c < oficinas; c++){
                matriz[f][c] = 0;
            }
        }
        
        int nroPiso;
        int nroOfi;
        System.out.print("Ingrese nro de piso: ");
        nroPiso = GeneradorAleatorio.generarInt(8)+1;
        System.out.println(nroPiso);
      
        System.out.print("Ingrese nro de oficina: ");
        nroOfi = GeneradorAleatorio.generarInt(4)+1;
        System.out.println(nroOfi);
        System.out.println();
        
        while (nroPiso != 9){
            
            matriz[nroPiso-1][nroOfi-1]++;
            
            System.out.print("Ingrese nro de piso: ");
            nroPiso = GeneradorAleatorio.generarInt(9) + 1;
            System.out.println(nroPiso);

            System.out.print("Ingrese nro de oficina: ");
            nroOfi = GeneradorAleatorio.generarInt(4) + 1;
            System.out.println(nroOfi);
            
            System.out.println();
        }
        System.out.println();
        
        for (int f = 7; f >= 0; f--){
            for (int c = 0; c < oficinas; c++){
                System.out.print(matriz[f][c] + " ");
            }
            System.out.println();
        }       
    } 
}