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
			int dato = a.getDato();
	
			if ((dato % 2 != 0) && (dato > n))
				l.agregarFinal(dato);
			
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
	
	/* Método que retorna una lista con los elementos impares del árbol “a” que sean mayores al valor “n”
	pasados como parámetros recorrido en postorden. */
	
	public ListaGenerica<Integer> numerosImparesMayoresQuePostOrden (ArbolGeneral<Integer> a, Integer n){
		
		ListaGenerica<Integer> l = new ListaEnlazadaGenerica<Integer>();
		
		l.comenzar();
		numerosImparesPostOrden(a, n, l);
		
		return l;
	}
	
	private void numerosImparesPostOrden (ArbolGeneral<Integer> a, Integer n, ListaGenerica<Integer> l) {
		if (!a.esVacio()) {
			
			if (!a.esHoja()) {
				ListaGenerica<ArbolGeneral<Integer>> hijos = a.getHijos();
				hijos.comenzar();
				while (!hijos.fin()) {
					numerosImparesPostOrden(hijos.proximo(), n, l);
				}
			}
			
			int dato = a.getDato();
			if ((dato % 2 != 0) && (dato > n)){
				l.agregarFinal(dato);
			}
		}	
	}
	
	/* Método que retorna una lista con los elementos impares del árbol “a” que sean mayores al valor “n”
	pasados como parámetros, recorrido por niveles. */
	public ListaGenerica< Integer > numerosImparesMayoresQuePorNiveles(ArbolGeneral<Integer> a, Integer n){
		
		ListaGenerica<Integer> l = new ListaEnlazadaGenerica<Integer>(); 

		ColaGenerica<ArbolGeneral<Integer>> cola = new ColaGenerica<ArbolGeneral<Integer>>(); 
		
		if (!a.esVacio()) {
			cola.encolar(a);
			cola.encolar(null);
		}
		
		while (!cola.esVacia()) {
			ArbolGeneral<Integer> actual = cola.desencolar();
			
			if (actual != null) {
				int dato = actual.getDato();
				
				if ((dato % 2 != 0) && (dato > n)) {
					l.agregarFinal(dato);
				}
				
				if (actual.tieneHijos()) {
					ListaGenerica<ArbolGeneral<Integer>> hijos = actual.getHijos();
					
					hijos.comenzar();
					while (!hijos.fin()) {
						cola.encolar(hijos.proximo());
					}
				}
				
			} else if (!cola.esVacia()) {
				cola.encolar(null);
			}
		}
		return l;
	}
}
