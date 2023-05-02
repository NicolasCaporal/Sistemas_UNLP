/* Ejercicio 5
El esquema de comunicación de una empresa está organizado en una estructura jerárquica, en donde
cada nodo envía el mensaje a sus descendientes. Cada nodo posee el tiempo que tarda en transmitir el
mensaje. 
Se debe devolver el mayor promedio entre todos los valores promedios de los niveles.

Implementar en una clase AnalizadorArbol, el método con la siguiente firma:
public int devolverMaximoPromedio (ArbolGeneral<AreaEmpresa> arbol)

Donde AreaEmpresa es una clase que representa a un área de la empresa mencionada y que
contiene la identificación de la misma representada con un String y una tardanza de transmisión de
mensajes interna representada con int. */

package practica4;

public class AnalizadorArbol {
	
	public double devolverMaximoPromedio (ArbolGeneral<AreaEmpresa> arbol) {
		
		ColaGenerica<ArbolGeneral<AreaEmpresa>> cola = new ColaGenerica<ArbolGeneral<AreaEmpresa>>();
		
		if (!arbol.esVacio()) {
			cola.encolar(arbol);
			cola.encolar(null);
		}
		
		double promedioMax = 0;
		double promedioAct = 0;
		int suma = 0;
		int tardanzaActual = 0;
		int cantHermanos = 0;;
		
		ArbolGeneral<AreaEmpresa> arbolActual;
		
		while (!cola.esVacia()) {
			arbolActual = cola.desencolar();
			
			if (arbolActual != null) {
				tardanzaActual = arbolActual.getDato().getTardanza(); 
				suma += tardanzaActual;
				cantHermanos++;
				
				if (arbolActual.tieneHijos()) {
					ListaGenerica<ArbolGeneral<AreaEmpresa>> hijos = arbolActual.getHijos();
					hijos.comenzar();
					while (!hijos.fin()) {
						cola.encolar(hijos.proximo());
					}
				}
				
			} else if (!cola.esVacia()) {
				promedioAct = suma / cantHermanos;
				promedioMax = max(promedioAct, promedioMax);
				cola.encolar(null);
				cantHermanos = 0;
				suma = 0;
			}
		}
		
		promedioAct = suma / cantHermanos;
		promedioMax = max(promedioAct, promedioMax);
		
		return promedioMax;
	}
	
	private double max(double a, double b) {
		if (a >= b)
			return a;
		else
			return b;
	}
	
}
