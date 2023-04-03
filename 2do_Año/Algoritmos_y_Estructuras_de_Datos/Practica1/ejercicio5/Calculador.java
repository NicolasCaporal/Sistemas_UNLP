package ejercicio5;

public class Calculador {
	//Variables estaticas para el inciso C
	static int max;
	static int min;
	static double prom;
	

	// Inciso a)
	public static double[] retorna(int[] array) {
		double [] resultado = new double[3];
		
		int longitud = array.length;
		
		double promedio = 0;
		int maxi = -9999;
		int mini = 9999;
		
		int suma = 0;
		
		for (int i = 0; i < longitud; i++ ) {
			suma += array[i];
			
			if (array[i] < mini) {
				mini = array[i];
			}
			
			if (array[i] > maxi) {
				maxi = array[i];
			}
				
		}
		
		promedio = suma / longitud;
		
		resultado[0] = maxi;
		resultado[1] = mini;
		resultado[2] = promedio;
		return resultado;	
	}
	
	//Inciso b)
	public static void parametro(int[] array, Datos d) {
		
		int mini = d.getMin();
		int maxi = d.getMax();
		
		int longitud = array.length;
		int suma = 0;
		
		for (int i = 0; i < longitud; i++ ) {
			suma += array[i];
			
			if (array[i] < mini) {
				mini = array[i];
			}
			
			if (array[i] > maxi) {
				maxi = array[i];
			}		
		}
		
		
		d.setPromedio(suma/longitud);
		d.setMax(maxi);
		d.setMin(mini);
	}
	
	
	//Inciso c)
	public static void variablesClase(int[] array) {
		max = -9999;
		min = 9999;
		prom = 0;
		int suma = 0;
		int longitud = array.length;
		
		for (int i = 0; i < longitud; i++ ) {
			suma += array[i];
			
			if (array[i] < min) {
				min = array[i];
			}
			
			if (array[i] > max) {
				max = array[i];
			}		
		}
		
		prom = suma/longitud;
	}
	
}
