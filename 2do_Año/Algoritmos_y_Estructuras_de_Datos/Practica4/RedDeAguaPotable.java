/* Ejercicio 7
Sea una red de agua potable, la cual comienza en un caño maestro y la misma se va dividiendo
sucesivamente hasta llegar a cada una de las casas.

Por el caño maestro ingresan “x” cantidad de litros y en la medida que el caño se divide, de acuerdo
con las bifurcaciones que pueda tener, el caudal se divide en partes iguales en cada una de ellas. 
Es decir, si un caño maestro recibe 1000 litros y tiene por ejemplo 4 bifurcaciones se divide en 4 partes
iguales, donde cada división tendrá un caudal de 250 litros.
Luego, si una de esas divisiones se vuelve a dividir, por ej. en 5 partes, cada una tendrá un caudal de
50 litros y así sucesivamente hasta llegar un lugar sin bifurcaciones.

Se debe implementar una clase RedDeAguaPotable que contenga el método con la siguiente firma:

public double minimoCaudal(double caudal)

que calcule el caudal de cada nodo y determine cuál es el mínimo caudal que recibe una casa. 
Asuma que la estructura de caños de la red está representada por una variable de instancia de 
la clase RedAguaPotable y que es un ArbolGeneral. */

package practica4;

public class RedDeAguaPotable {
	private ArbolGeneral<String> arbol;
	
	public RedDeAguaPotable(ArbolGeneral<String> arbol) {
		this.arbol = arbol;
	}
	
	public double minimoCaudal(double caudal) {
		double rta;
		if (arbol.esVacio())
			return rta = 0;
		
		else if (arbol.esHoja())
			return rta = caudal;
		
		else {
			double minimo = Double.MAX_VALUE;
			rta = minimoCaudal(caudal, this.arbol, minimo);
		}
		return rta;
	}
	
	private double minimoCaudal(double caudal, ArbolGeneral<String> arbol, double min) {
		double minActual;
		
		minActual = Math.min(min, caudal);
		
		if (arbol.tieneHijos()) {
			ListaGenerica<ArbolGeneral<String>> hijos = arbol.getHijos();
			double caudalProximo = caudal/hijos.tamanio();
			hijos.comenzar();
			while (!hijos.fin()) {
				minActual = minimoCaudal(caudalProximo, hijos.proximo(), minActual);
			}
		}
		
		return minActual;
	}
}
