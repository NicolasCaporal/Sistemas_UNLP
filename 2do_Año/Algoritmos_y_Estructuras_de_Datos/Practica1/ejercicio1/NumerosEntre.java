package ejercicio1;

public class NumerosEntre {

	public static void conFor(int a, int b) {
		
		for (int i = a; i <= b; i++) {
			
			System.out.println(i);
		}	
	}
	
	public static void conWhile(int a, int b) {
		
		int i = a;
		while (i <= b) {
			
			System.out.println(i);
			i++;			
		}
	}
	
	
	public static void recursivo(int a, int b) {
		
		int i = a;
		if (i <= b) {
			System.out.println(i);
			recursivo(++i, b);
		}
	}
	
	
}
