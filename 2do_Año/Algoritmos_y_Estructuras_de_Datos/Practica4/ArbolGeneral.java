package practica4;

public class ArbolGeneral<T> {

	private T dato;

	private ListaGenerica<ArbolGeneral<T>> hijos = new ListaEnlazadaGenerica<ArbolGeneral<T>>();

	public T getDato() {
		return dato;
	}

	public void setDato(T dato) {
		this.dato = dato;
	}

	public void setHijos(ListaGenerica<ArbolGeneral<T>> hijos) {
		if (hijos==null)
			this.hijos = new ListaEnlazadaGenerica<ArbolGeneral<T>>();
		else
			this.hijos = hijos;
	}

	public ArbolGeneral(T dato) {
		this.dato = dato;
	}

	public ArbolGeneral(T dato, ListaGenerica<ArbolGeneral<T>> hijos) {
		this(dato);
		if (hijos==null)
			this.hijos = new ListaEnlazadaGenerica<ArbolGeneral<T>>();
		else
			this.hijos = hijos;
	}

	public ListaGenerica<ArbolGeneral<T>> getHijos() {
		return this.hijos;
	}

	public void agregarHijo(ArbolGeneral<T> unHijo) {

		this.getHijos().agregarFinal(unHijo);
	}

	public boolean esHoja() {

		return !this.tieneHijos();
	}
	
	public boolean tieneHijos() {
		return !this.hijos.esVacia();
	}
	
	public boolean esVacio() {

		return this.dato == null && !this.tieneHijos();
	}

	

	public void eliminarHijo(ArbolGeneral<T> hijo) {
		if (this.tieneHijos()) {
			ListaGenerica<ArbolGeneral<T>> hijos = this.getHijos();
			if (hijos.incluye(hijo)) 
				hijos.eliminar(hijo);
		}
	}
	
	public ListaEnlazadaGenerica<T> preOrden() {
		return null;
	}

	
	/* Ejercicio 4
	Implemente en la clase ArbolGeneral los siguientes métodos:
	
	a) public int altura(): int devuelve la altura del árbol, es decir, la longitud del camino más largo
	desde el nodo raíz hasta una hoja. */
	public Integer altura() {
		int contador = 0;
		int alturaActual = 0;
		
		if (this.esHoja()) {
			return 0;
		
		} else if (this.tieneHijos()) {
			ListaGenerica<ArbolGeneral<T>> hijos = this.getHijos();
			hijos.comenzar();
			while (!hijos.fin()) {
				alturaActual = hijos.proximo().altura();
				contador = maximo(alturaActual, contador);
			}
		}
		return contador+1;
	}
	

	/* b) public int nivel(T dato) devuelve la profundidad o nivel del dato en el árbol. 
	 * El nivel de un nodo es la longitud del único camino de la raíz al nodo */
	
	public Integer nivel(T dato) {
		
		ColaGenerica<ArbolGeneral<T>> cola = new ColaGenerica<ArbolGeneral<T>>();
		int nivelActual = 0;
		T datoActual;
		
		if (!this.esVacio()) {
			cola.encolar(this);
			cola.encolar(null);
			
		}
		ArbolGeneral<T> arbolActual;
		while (!cola.esVacia()) {
			 arbolActual = cola.desencolar();
			
			if (arbolActual != null) {
				
				datoActual = arbolActual.getDato();
				
				if (!(datoActual == dato) && (arbolActual.tieneHijos())) {

					ListaGenerica<ArbolGeneral<T>> hijos = arbolActual.getHijos();
					hijos.comenzar();
					while (!hijos.fin()) {
						cola.encolar(hijos.proximo());
					}
					
				} else if (datoActual == dato) {
					return nivelActual;
				}
				
			} else if (!cola.esVacia()) {
				cola.encolar(null);
				nivelActual++;
			}
		}
		return -1;
	}

	
	public Integer ancho() {

		ColaGenerica<ArbolGeneral<T>> cola = new ColaGenerica<ArbolGeneral<T>>();
		 if (!this.esVacio()) {
			 cola.encolar(this);
			 cola.encolar(null);
		 }
		 
		 int anchoActual = 0;
		 int anchoMaximo = 0;
		 ArbolGeneral<T> arbolActual;
		 
		 while (!cola.esVacia()) {
			 
			 arbolActual = cola.desencolar();
			 
			 if (arbolActual != null) {

				 anchoActual++;

				  if (arbolActual.tieneHijos()) {
					  ListaGenerica<ArbolGeneral<T>> hijos = arbolActual.getHijos();
					  hijos.comenzar();
					  while (!hijos.fin()) {
						  cola.encolar(hijos.proximo());
					  }
				  } 

			 } else if (!cola.esVacia()) {
				 anchoMaximo = maximo(anchoActual, anchoMaximo);
				 cola.encolar(null);
				 anchoActual = 0;
			 }
		 }
		 
		return anchoMaximo;
	}
	
	private int maximo(int a, int b) {
		if (a >= b)
			return a;
		else
			return b;
	}
	
	
}