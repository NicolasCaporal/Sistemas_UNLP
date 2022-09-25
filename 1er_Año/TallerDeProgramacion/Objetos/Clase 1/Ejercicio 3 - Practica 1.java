/*3- Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice la matriz con números aleatorios entre 0 y 30.

Luego realice las siguientes operaciones:
- Mostrar el contenido de la matriz en consola.
- Calcular e informar la suma de los elementos de la fila 1
- Generar un vector de 5 posiciones donde cada posición j contiene la suma
de los elementos de la columna j de la matriz. Luego, imprima el vector.
- Lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna) 
en caso contrario imprima “No se encontró el elemento”.

NOTA: Dispone de un esqueleto para este programa en Ej03Matrices.java*/

package tema1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
  	
	PaqueteLectura.GeneradorAleatorio.iniciar();

        // Defina una matriz de enteros de tamaño 5x5. 
        int [][] matriz =  new int [5][5];

        // Inicialice la matriz con números aleatorios entre 0 y 30.
        int f;
        int c;
        for (f = 0; f < 5; f++){
            for(c=0; c < 5; c++){
                matriz[f][c] = GeneradorAleatorio.generarInt(31);
            }
        }

        // Mostrar el contenido de la matriz en consola.
        for (f = 0; f < 5; f++){
            for(c=0; c < 5; c++){
                if (matriz[f][c] < 10){
                System.out.print("0" + matriz[f][c] + " ");
                } else {
                System.out.print(matriz[f][c] + " ");
                }
            }
            System.out.println();
        }
        System.out.println();

        // Calcular e informar la suma de los elementos de la fila 1
        int suma = 0;
        for (c = 0; c < 5; c++){
            suma = suma + matriz[0][c];
        }
        
        System.out.println("La suma de los elementos de la fila 1 es: " + suma);
        System.out.println();
        
        // Generar un vector de 5 posiciones donde cada posición j contiene la suma
        // Luego, imprima el vector.
        int [] vector= new int [5];
        int j;
        int sumaColumna;
        
        for (j=0; j<5; j++){
            sumaColumna = 0;
            
            for (f = 0; f<5; f++){
                sumaColumna = sumaColumna + matriz[f][j];
            }
            
            vector[j] = sumaColumna;
        }
        
        // Luego, imprima el vector.
        for (j=0; j<5; j++){
            System.out.println("La suma de los elementos de la columna " + (j+1) + " es igual a: " + vector[j]);
        }
        System.out.println();


        // Lea un valor entero e indique si se encuentra o no en la matriz. En caso de
        // encontrarse indique su ubicación (fila y columna) en caso contrario
        // imprima “No se encontró el elemento”.
        int num;
        System.out.print("Ingrese un numero a buscar: ");
        num = Lector.leerInt();
        
        f = 0;
        boolean seguir = true;
        
        while ((f < 5) && (seguir)) {
           c=0;
            while ((c < 5) && (seguir)){
                if (num == matriz[f][c]){
                    seguir = false;
                } else {
                    c++;
                }            
            }
            
            if (c == 5) 
                c--;

            if (num != matriz[f][c]) 
                f++;
        }
        
        if (f == 5) {
            System.out.println("No se encontró el elemento");

        } else {
            System.out.println("El numero " + num + " se encontró en la posición [" + f + "][" + c + "]");

        } 
    }
}
