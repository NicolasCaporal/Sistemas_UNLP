/* Implemente en la clase Parcial el metodo sumaImparesPosOrdenMayorA que recibe un arbol binario de enteros positivos y un numero entero.
Este metodo suma todos los numeros impares del arbol que son mayores al parametro recibido realizandolo en un recorrido posOrder.
Firma public Integer sumaImparesPosOrdenMayorA(ArbolBinario<Integer> ab, int limite) */

public class Parcial{

    public Integer sumalmparesPosOrderMayorA(ArbolBinario<Integer> ab, int limite){
        int suma = 0;
        if(ab.tieneHijoIzquierdo()){
            suma += sumalmparesPosOrderMayorA(ab.getHijoIzquierdo(), limite);
        }
        if(ab.tieneHijoDerecho()){
            suma += sumalmparesPosOrderMayorA(ab.getHijoDerecho(), limite);
        }

        int dato = a.getDato();
        if((dato % 2  != 0) && (dato > limite)){
            return suma + dato
        }
        return suma;
    }
    
}
