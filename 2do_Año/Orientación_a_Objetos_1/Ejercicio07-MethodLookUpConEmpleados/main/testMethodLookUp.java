package ar.edu.unlp.info.oo1.ejercicio7;

public class testMethodLookUp {

	public static void main(String[] args) {
		Gerente alan = new Gerente("Alan Turing");
		double aportesDeAlan = alan.aportes();
		System.out.println("1) " + aportesDeAlan);
		// Ejecuta el montoBasico de Gerente
		
		
		Gerente alan2 = new Gerente("Alan Turing");
		double sueldoBasicoDeAlan = alan2.sueldoBasico();
		System.out.println("2) " + sueldoBasicoDeAlan);
		// Ejecuta sueldoBasico de Empleado y this.montoBasico es el de Gerente
		
	}

}
