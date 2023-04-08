package Ejercicio1pr2;

/* 1.2. Escriba una clase llamada TestListaDeEnterosConArreglos que reciba en su método main
una secuencia de números, los agregue a un objeto de tipo ListaDeEnterosConArreglos y luego
imprima los elementos de dicha lista */

public class TestListaDeEnterosConArreglos {
	
	public static void main(String args[]) {
		
		ListaDeEnterosConArreglos lista = new ListaDeEnterosConArreglos();
		
		for (String elem: args) {
			
			lista.agregarFinal(Integer.parseInt(elem));
		}
		
		ImprimirListaInversamente.main(lista);
		
		lista.comenzar();
		while (!lista.fin()) {
			System.out.print(lista.proximo() + " ");
		}
		
	}
}
