/* 4. Considere un string de caracteres S, el cual comprende únicamente los caracteres: (,),[,],{,}.
Por ejemplo, "{( ) [ ( ) ] }" está balanceado, pero "( [ ) ]" no lo está.  

Implemente una clase llamada tp02.ejercicio4.TestBalanceo (pase por máquina), cuyo objetivo
es determinar si un String dado está balanceado. El String a verificar es un parámetro de entrada (no
es un dato predefinido). */

package Ejercicio4pr2;

public class TestBalanceo {

	 public static void main(String[] args) {

		 System.out.println(estaBalanceado("{()[()]}")); // True
		 
		 System.out.println(estaBalanceado("([)]")); // False
		 
		 System.out.println(estaBalanceado("()[{()}][]")); // True
		 
		 System.out.println(estaBalanceado("(()]")); // False
		 
		 System.out.println(estaBalanceado("((")); // False
		 
		 
	 }
	 
	public static boolean estaBalanceado(String S) {
		 
		 PilaGenerica<Character> pila = new PilaGenerica<Character>(); 
		 
		 
		 for (int i = 0; i < S.length(); i++) {
			 char c = S.charAt (i); 
			 
			 if (esDeApertura(c))
				 pila.apilar(c);
			 else if (esDeCierre(c)) {
				 char c2 = pila.desapilar();
				 if (!matchean(c2, c))
					 return false;
			 }
				 
		 }
				 
		 return pila.esVacia();
	 }
	
	 
	 private static boolean esDeApertura(char c) {
		 char[] caracteres = {'{', '(', '['};
		 
		 for (int i = 0; i < caracteres.length; i++) {
			 
			 if (c == caracteres[i])
				 return true;
			 
		 }
		 
		 return false;
	 }
	
	 private static boolean esDeCierre(char c) {
		 char[] caracteres = {'}', ')', ']'};
		 
		 for (int i = 0; i < caracteres.length; i++) {
			 
			 if (c == caracteres[i])
				 return true;
			 
		 }
		 
		 return false;
	 }
	 
	 private static boolean matchean(char c, char c2) {
		 char[] apertura = {'{', '(', '['};
		 char[] cierre = {'}', ')', ']'};
		 
		 int i = 0;
		 while (c != apertura[i]) {
			 i++;
		 }

		 return c2 == cierre[i];
	 }
	 
}
