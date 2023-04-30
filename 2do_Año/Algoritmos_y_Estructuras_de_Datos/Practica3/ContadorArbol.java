/* Ejercicio 3
Defina una clase Java denominada ContadorArbol cuya función principal es proveer métodos de
validación sobre árboles binarios de enteros. Para ello la clase tiene como variable de instancia un
ArbolBinario<Integer>. Implemente en dicha clase un método denominado numerosPares() que
devuelve en una estructura adecuada (sin ningún criterio de orden) todos los elementos pares del
árbol (divisibles por 2). Defina la clase dentro del paquete tp03.ejercicio3

a) Implemente el método realizando un recorrido InOrden.
b) Implemente el método realizando un recorrido PostOrden. */

package ejercicio3pr3;

public class ContadorArbol {
	private ArbolBinario<Integer> arbol;
	
	// Constructor
	public ContadorArbol(ArbolBinario<Integer> arbol) {
		this.arbol = arbol;
	}
	
	// Main
	public ColaGenerica<Integer> numerosPares(){
		ColaGenerica<Integer> cola = new ColaGenerica<Integer>();
		//numeroParesInOrden(cola, arbol);
	    numeroParesPostOrden(cola, arbol);
		return cola;
	}
	
	
	private void numeroParesInOrden (ColaGenerica<Integer> cola, ArbolBinario<Integer> arbol){
		
		if (arbol.tieneHijoIzquierdo()) {
			numeroParesInOrden(cola, arbol.getHijoIzquierdo());
		}
		
		if (arbol.getDato() % 2 == 0) {
			cola.encolar(arbol.getDato());
		}
		
		if (arbol.tieneHijoDerecho()) {
			numeroParesInOrden(cola, arbol.getHijoDerecho());
		}		
	}
	
	
	private void numeroParesPostOrden (ColaGenerica<Integer> cola, ArbolBinario<Integer> arbol) {
		
		if (arbol.tieneHijoIzquierdo()) {
			numeroParesPostOrden(cola, arbol.getHijoIzquierdo());
		}
		
		if (arbol.tieneHijoDerecho()) {
			numeroParesPostOrden(cola, arbol.getHijoDerecho());
		}
		
		if (arbol.getDato() % 2 == 0) {
			cola.encolar(arbol.getDato());
		}		
	}
	
}
