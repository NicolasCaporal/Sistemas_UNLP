/* 5. Dado un arreglo de valores tipo int se desea calcular el valor máximo, mínimo, y
promedio en un único método. Escriba tres métodos de clase, donde respectivamente:
a. Devuelva lo pedido por el mecanismo de retorno de un método en Java ("return").
b. Devuelva lo pedido interactuando con algún parámetro (el parámetro no puede ser de
tipo arreglo).
c. Devuelva lo pedido sin usar parámetros ni la sentencia "return". */

package ejercicio5;

public class Main {

	public static void main(String[] args) {
		
		// Inciso A, retorno un vector.
		int[] arreglo = new int[] {1, 4, 6, 8, 9, 44, 101, -23, 60, 10, 3, 2};
		double[] resultado = Calculador.retorna(arreglo);
		System.out.println("a) Max: " + resultado[0] + " Min: " + resultado[1] + " Prom: " + resultado[2]);
		
		//Inciso B, interactuo con un parametro de tipo objeto 'Datos'
		Datos data = new Datos();
		Calculador.parametro(arreglo, data);
		System.out.println("b) Max: " + data.getMax() + " Min: " + data.getMin() + " Prom: " + data.getPromedio());
		
		//Inciso C, trabajo con variables de clase o estaticas.
		Calculador.variablesClase(arreglo);
		System.out.println("c) Max: " + Calculador.max + " Min: " + Calculador.min + " Prom: " + Calculador.prom);
	}
	
}
