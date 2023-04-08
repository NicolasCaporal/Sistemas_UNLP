package Ejercicio1pr2;

/* 1.3. Escriba una clase llamada TestListaDeEnterosEnlazada que reciba en su método main una
secuencia de números, los agregue a un objeto de tipo ListaDeEnterosEnlazada y luego imprima los
elementos de dicha lista. */

public class TestListaDeEnterosEnlazada {
	
	public static void main(String args[]) {
		
		ListaDeEnterosEnlazada lista = new ListaDeEnterosEnlazada();
		
		for (String elem: args) {
			
			lista.agregarFinal(Integer.parseInt(elem));
		}
		
		ImprimirListaInversamente.main(lista);
		System.out.println();
		
		lista.comenzar();
		while (!lista.fin()) {
			System.out.print(lista.proximo() + " ");
		}
		
	}
}