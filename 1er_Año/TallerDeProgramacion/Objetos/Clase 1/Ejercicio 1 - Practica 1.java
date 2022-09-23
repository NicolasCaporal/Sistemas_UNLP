/* 1- Analice el programa Ej01Tabla2.java, que carga un vector que representa la
tabla del 2. Luego escriba las instrucciones necesarias para:
- generar enteros aleatorios hasta obtener el número 11. Para cada número
muestre el resultado de multiplicarlo por 2 (accediendo al vector). */

package tema1;
import PaqueteLectura.GeneradorAleatorio;

public class Ej01Tabla2 {

    public static void main(String[] args) {
        PaqueteLectura.GeneradorAleatorio.iniciar();
        
        int DF=11;  
        int [] tabla2 = new int[DF]; 
        int i;

        for (i=0;i<DF;i++) 
            tabla2[i]=2*i;
        
        int n = GeneradorAleatorio.generarInt(DF+1);

        while (n != 11){
            System.out.println(n + ": " + tabla2[n]);
            n = GeneradorAleatorio.generarInt(DF+1);   
        }   
    } 
}