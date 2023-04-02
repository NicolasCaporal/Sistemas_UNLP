/* 1. Escriba tres métodos de clase (static) que reciban por parámetro dos números
enteros (tipo int) a y b e impriman todos los números enteros comprendidos entre a; b
(inclusive), uno por cada línea en la salida estándar. Para ello, dentro de una nueva clase
escriba un método por cada uno de los siguientes incisos:
a. Que realice lo pedido con un for.
b. Que realice lo pedido con un while.
c. Que realice lo pedido sin utilizar estructuras de control iterativas (for, while, do-while). */

package ejercicio1;

public class Main {
	
	public static void main(String[] args) { 
		
		int a = 6;
		int b = 10;
		NumerosEntre.conFor(a, b);
		NumerosEntre.conWhile(a, b);
		NumerosEntre.recursivo(a, b);
		
	}
	
}
