/* 2. Escriba un método de clase que dado un número n devuelva un nuevo arreglo de
tamaño n con los n primeros múltiplos enteros de n mayores o iguales que 1.
Ejemplo: f(5) = [5; 10; 15; 20; 25]; f(k) = {nk/k : 1..k}

Agregue al programa la posibilidad de probar con distintos valores de n ingresándolos por
teclado, mediante el uso de System.in. La clase Scanner permite leer de forma sencilla
valores de entrada */

package ejercicio2;

import java.util.Scanner;

public class Main {
	
	public static void main(String args[]) {
		
		System.out.print("Ingrese un numero: ");
		Scanner s = new Scanner (System.in);
		int n = s.nextInt();
		
		int[] arrayMultiplos = multiplos(n);
		
		imprimirArray(arrayMultiplos);
	}
	
	public static int[] multiplos(int n) {
		
		 int [] array = new int[n];
		 
		 for (int i = 1; i <= n; i++) {
			 
			 array[i-1] = i * n; 
		 }
		 
		return array;
	}
	
	public static void imprimirArray(int[] array) {
		
		int longitud = array.length;
		
		for (int i = 0; i < longitud; i++) {
			
			System.out.println("array[" + i + "] = " + array[i]);
			
		}
	}

}
