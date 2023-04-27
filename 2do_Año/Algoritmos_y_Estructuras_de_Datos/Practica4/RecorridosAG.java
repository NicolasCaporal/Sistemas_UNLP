/* Ejercicio 3 */

package practica4;

public class RecorridosAG {
	
	
	/* Método que retorna una lista con los elementos impares del árbol “a” que sean mayores al valor “n”
	pasados como parámetros, recorrido en preorden */
	
	public ListaGenerica<Integer> numerosImparesMayoresQuePreOrden (ArbolGeneral<Integer> a, Integer n){
		ListaGenerica<Integer> l = new ListaEnlazadaGenerica<Integer>();
		
		l.comenzar();
		numerosImparesPreOrden(a, n, l);
		
		return l;
	}
	
	private void numerosImparesPreOrden (ArbolGeneral<Integer> a, Integer n, ListaGenerica<Integer> l){
		
		if (!a.esVacio()) {
			int actual = a.getDato();
	
			if ((actual % 2 != 0) && (actual > n))
				l.agregarFinal(actual);
			
			if (!a.esHoja()) {
					ListaGenerica<ArbolGeneral<Integer>> hijos = a.getHijos();
					hijos.comenzar();
					while (!hijos.fin()) {
						numerosImparesPreOrden(hijos.proximo(), n, l);
					}
			}
		}
	}
	
	
	/* Método que retorna una lista con los elementos impares del árbol “a” que sean mayores al valor “n”
	pasados como parámetros, recorrido en inorden. */
	
	public ListaGenerica< Integer > numerosImparesMayoresQueInOrden (ArbolGeneral<Integer> a, Integer n){
			
		ListaGenerica<Integer> l = new ListaEnlazadaGenerica<Integer>();
		
		l.comenzar();
		numerosImparesInOrden(a, n, l);
		
		return l;
	}
	
	private void numerosImparesInOrden (ArbolGeneral<Integer> a, Integer n, ListaGenerica<Integer> l){
		ListaGenerica<ArbolGeneral<Integer>> hijos = new ListaEnlazadaGenerica<ArbolGeneral<Integer>>();
		if (!a.esVacio()) {
			int actual = a.getDato();
			
			if (!a.esHoja()) {
					hijos = a.getHijos();
					hijos.comenzar();
					numerosImparesInOrden(hijos.proximo(), n, l);
			}
			
			if ((actual % 2 != 0) && (actual > n))
				l.agregarFinal(actual);
			
			if (!a.esHoja()) {
				while (!hijos.fin()) {
					numerosImparesInOrden(hijos.proximo(), n, l);
				}
			}
		}
	}
	
}
