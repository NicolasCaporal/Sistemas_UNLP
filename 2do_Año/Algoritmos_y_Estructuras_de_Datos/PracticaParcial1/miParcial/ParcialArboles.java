/* 
Escribir en una clase ParcialArboles que contenta UNA UNICA variable de instancia de tipo ArbolBinario de
valores enteros NO repetidos y el método público con la siguiente firma

    public boolean isLeftTree(int num)
    
El método devuelve TRUE si el subarbol cuya raiz es 'num', tiene en su subarbol izquierdo una cantidad mayor
estricta de arboles con un unico hijo que en su subarbol derecho. Y FALSE en caso contrario

Consideraciones:
    * Si 'num' no se encuentra en el arbol, debe retornar false
    * Si el arbol con raiz 'num' no cuenta con una de sus ramas, considere que en esa rama hay -1 arboles con unico hijo.

Tenga en cuenta que:
    1. No puede agregar más variables de instancia ni de clase a la clase ParcialArboles.
    2. Debe respetar la clase y la firma del metodo indicado.
    3. Puede deinir todos los metodos y variables locales que considere necesarios.
    4. Todo metodo que no este definido en la sinopsis de clases, debe ser implementado.
    5. Debe recorrer la estructura solo 1 vez para resolverlo. 
*/


public class ParcialArboles {
    public ArbolBinario<Integer> arbol;

    public ParcialArboles(ArbolBinario <Integer> arbol){
        this.arbol = arbol;
    }

    public boolean IsLeftTree (int num){
        if (this.arbol.esVacio()){
            return false;
        }

        ArbolBinario<Integer> subArbolDeNum = buscarSubArbol(num, this.arbol);
        
        boolean rta;
        if (subArbolDeNum != null){
            rta = IsLeftTreeP(subArbolDeNum);
        } else {
            rta = false;
        }

        return rta;
    }

    private ArbolBinario<Integer> buscarSubArbol(int num, ArbolBinario<Integer> arbol){
        ArbolBinario<Integer> rta = null;

        if (arbol.getDato().equals(num)){
            rta = arbol;
        } else {
            if (arbol.tieneHijoIzquierdo()){
                rta = buscarSubArbol(num, arbol.getHijoIzquierdo());
            }

            if ((arbol.tieneHijoDerecho()) && (rta == null)){
                rta = buscarSubArbol(num, arbol.getHijoDerecho());
            }

        }

        return rta;
            
    }

    private boolean IsLeftTreeP(ArbolBinario<Integer> a){
        int contadorI = 0;
        int contadorD = 0;

        if (a.esHoja()){
            return false;
        } else {

            if (a.tieneHijoIzquierdo()){
                contadorI = contar(a.getHijoIzquierdo());
            } else {
                contadorI = -1;
            }

            if (a.tieneHijoDerecho()){
                contadorD = contar(a.getHijoDerecho());
            } else {
                contadorD = -1;
            }

        }

        return (contadorI > contadorD);
    }

    private Integer contar(ArbolBinario<Integer> a){
        int contador = 0;

        if (a.esHoja())
            return 0;

        if (a.tieneHijoIzquierdo()){
            contador += contar(a.getHijoIzquierdo());
        }

        if (a.tieneHijoDerecho()){
            contador += contar(a.getHijoDerecho());
        }

        if ((a.tieneHijoIzquierdo() && !a.tieneHijoDerecho()) || (a.tieneHijoDerecho() && !a.tieneHijoIzquierdo())){
            return contador += 1;
        } else {
            return contador;
        }

    }
}
