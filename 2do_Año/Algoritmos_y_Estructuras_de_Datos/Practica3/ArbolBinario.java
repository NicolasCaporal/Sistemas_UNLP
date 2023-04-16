/* Ejercicio 2
Agregue a la clase dada, ArbolBinario, los siguientes métodos:

a) contarHojas():int Devuelve la cantidad de árbol/subárbol hojas del árbol receptor.

b) espejo(): ArbolBinario<T> Devuelve el árbol binario espejo del árbol receptor.
 
c) entreNiveles(int n, m) Imprime el recorrido por niveles de los elementos del árbol
	receptor entre los niveles n y m (ambos inclusive). (0≤n<m≤altura del árbol) */
package Ejercicio2pr3;

public class ArbolBinario<T> {
	private T dato;
	private ArbolBinario<T> hijoIzquierdo;   
	private ArbolBinario<T> hijoDerecho; 

	
	public ArbolBinario() {
		super();
	}

	public ArbolBinario(T dato) {
		this.dato = dato;
	}

	/*
	 * getters y setters
	 * 
	 */
	public T getDato() {
		return dato;
	}

	public void setDato(T dato) {
		this.dato = dato;
	}
	
	/**
	 * Preguntar antes de invocar si tieneHijoIzquierdo()
	 * @return
	 */
	public ArbolBinario<T> getHijoIzquierdo() {
		return this.hijoIzquierdo;
	}

	public ArbolBinario<T> getHijoDerecho() {
		return this.hijoDerecho;

	}

	public void agregarHijoIzquierdo(ArbolBinario<T> hijo) {
		this.hijoIzquierdo = hijo;
	}

	public void agregarHijoDerecho(ArbolBinario<T> hijo) {
		this.hijoDerecho = hijo;
	}

	public void eliminarHijoIzquierdo() {
		this.hijoIzquierdo = null;
	}

	public void eliminarHijoDerecho() {
		this.hijoDerecho = null;
	}

	public boolean esVacio() {
		return this.getDato() == null && !this.tieneHijoIzquierdo() && !this.tieneHijoDerecho();
	}

	public boolean esHoja() {
		return (!this.tieneHijoIzquierdo() && !this.tieneHijoDerecho());

	}

	@Override
	public String toString() {
		return this.getDato().toString();
	}

	 
	public boolean tieneHijoIzquierdo() {
		return this.hijoIzquierdo!=null;
	}

	 
	public boolean tieneHijoDerecho() {
		return this.hijoDerecho!=null;
	}

	
	// Devuelve la cantidad de árbol/subárbol hojas del árbol receptor
	public int contarHojas() {
		
		if (this.esVacio()) // Caso especial, arbol vacio.
			return 0;
		
		int cantHojas = 0;
		
		if (this.esHoja()) // Caso base
			return 1;
					
		else if (this.tieneHijoIzquierdo())
				cantHojas = cantHojas + this.getHijoIzquierdo().contarHojas();
		
		else if (this.tieneHijoDerecho())
				cantHojas = cantHojas + this.getHijoDerecho().contarHojas();
			
		return cantHojas;
	}
	

	// Devuelve el árbol binario espejo del árbol receptor
    public ArbolBinario<T> espejo() {
		
    	ArbolBinario<T> arbolEspejo = new ArbolBinario<T>(this.getDato());
    	
    	if (this.tieneHijoDerecho())
    		arbolEspejo.agregarHijoIzquierdo(this.getHijoIzquierdo().espejo());
    	
    	if(this.tieneHijoIzquierdo())
    		arbolEspejo.agregarHijoDerecho(this.getHijoIzquierdo().espejo());
    	
		return arbolEspejo;
	}


    // Imprime el recorrido por niveles de los elementos del árbol receptor entre los niveles n y m (ambos inclusive).
	public void entreNiveles(int n, int m){
		
		ColaGenerica<ArbolBinario<T>> cola = new ColaGenerica<ArbolBinario<T>>();
		
		cola.encolar(this);
		cola.encolar(null);
		
		ArbolBinario<T> actual = new ArbolBinario<T>();
		
		int nivel = 0;
		while ((!cola.esVacia()) && (nivel <= m)) {
			
			actual = cola.desencolar();
			if (actual != null) {
				
				if (n <= nivel)
					System.out.println(actual.getDato());
				
				if (actual.tieneHijoIzquierdo())
					cola.encolar(actual.getHijoIzquierdo());
				 
				if (actual.tieneHijoDerecho())
					cola.encolar(actual.getHijoDerecho());		
				
			} else if (!cola.esVacia()){
			
				cola.encolar(null);
				nivel += 1;
				
			}	
		}
	}
		
}

	


