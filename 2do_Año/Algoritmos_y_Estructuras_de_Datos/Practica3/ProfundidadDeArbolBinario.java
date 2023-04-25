/* Ejercicio 5
Implemente una clase Java llamada ProfundidadDeArbolBinario que tiene como variable de
instancia un árbol binario de números enteros y un método de instancia
sumaElementosProfundidad(int p):int el cuál devuelve la suma de todos los nodos del árbol
que se encuentren a la profundidad pasada como argumento.
Defina la clase dentro del paquete tp03.ejercicio5 */

package ejercicio5pr3;

public class ProfundidadDeArbolBinario {
	private ArbolBinario<Integer> arbol;
	
	public ProfundidadDeArbolBinario(ArbolBinario<Integer> arbol) {
		this.arbol = arbol;
	}
	
	
	public int sumaElementosProfundidad(int p) {
		
		ArbolBinario<Integer> actual = new ArbolBinario<Integer>();
		ColaGenerica<ArbolBinario<Integer>> cola = new ColaGenerica<ArbolBinario<Integer>>();
		
		int suma = 0;
		int pActual = 0;
		
		cola.encolar(arbol);
		cola.encolar(null);
		
		
		while ((pActual <= p) && (!cola.esVacia())) {
			
			actual = cola.desencolar();
			
			if (actual != null) {
			
				if (pActual == p) {
					suma += actual.getDato();
					
				} else {
					
					if (actual.tieneHijoIzquierdo()) 
						cola.encolar(actual.getHijoIzquierdo());
						
					if (actual.tieneHijoDerecho()) 
						cola.encolar(actual.getHijoDerecho());
					
				}
				
			} else if (!cola.esVacia()) {
				cola.encolar(null);
				pActual++;
			}
		}
		
		return suma;
	}
	
}
