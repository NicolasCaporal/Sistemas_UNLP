package Ejercicio1pr2;

/* 1.5. Escriba un método recursivo que imprima los elementos de una lista en sentido inverso. La lista
la recibe por parámetro. */

public class ImprimirListaInversamente {
	
	private static void imprimo (ListaDeEnteros lista, int i) {
		System.out.print(lista.elemento(i) + " ");
		
		if (i > 1) {
			imprimo(lista, i-1);
		}
	}
	
	public static void main (ListaDeEnteros lista) {
		
		System.out.println("Imprimiendo en sentido inverso: ");
		int tam = lista.tamanio();
		lista.comenzar();
		imprimo(lista, tam);	
	}

}
