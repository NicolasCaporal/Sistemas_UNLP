package Ejercicio1pr2;

/* 1.6 Se aplica la función dada de forma recursiva, a partir de un número n positivo se obtiene un
	sucesión que termina en 1.
	
 * a) Escriba un programa recursivo que, a partir de un número n, devuelva una lista con cada miembro
	de la sucesión. 
	
	b) Escriba un método main que pruebe el método implementado en a) y recorra la lista resultado e
	imprima cada uno de los elementos. */

public class ConjeturaDeCollatz {
	private ListaDeEnterosEnlazada lista = new ListaDeEnterosEnlazada();
	
	public ListaDeEnterosEnlazada calcularSucesion (int n) {
		
		lista.comenzar();
		
		lista.agregarFinal(n);
		
		if (n == 1) {
			
			return lista;
			
		} else if ( n % 2 == 0) {
			
			n = n/2;
			calcularSucesion(n);
			
		} else {
			
			n = n*3 + 1;
			calcularSucesion(n);
		}
		
		return lista;
	}

	
	public static void main (String args[]) {
		
		ConjeturaDeCollatz f = new ConjeturaDeCollatz();
		ListaDeEnterosEnlazada lista = f.calcularSucesion(60);
		
		int n;
		lista.comenzar();
		while (!lista.fin()) {
			n = lista.proximo();
			System.out.print(n + " ");
			
		}
	}
		
}
	



