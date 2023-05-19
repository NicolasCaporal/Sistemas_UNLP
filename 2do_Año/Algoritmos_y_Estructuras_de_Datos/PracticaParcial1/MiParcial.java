Public class ParcialArboles {
    Public ArbolBinario<Integer> arbol;

    Public ParcialArboles(ArbolBinario <Integer> arbol){
        this.arbol = arbol;
    }

    Public boolean IsLeftTree (int num){
        if (this.arbol.esVacio){
            return false;
        }

        ArbolBinario<Integer> subArbolDeNum = buscarSubArbol(num, this.arbol);
        
        boolean rta;
        if (subArbolDeNum != null){
            rta = IsLeftTreeP(subArbolDeNum)
        } else {
            rta = false;
        }

        return rta;
    }

    private ArbolBinario<Integer> buscarSubArbol(int nu,, ArbolBinario<Integer> arbol){
        ArbolBinario<Integer> rta = null;

        if (arbol.getDato.equals(num)){
            rta = arbol;
        } else {
            if (arbol.tieneHijoIzquierdo()){
                rta = buscarSubArbol(num, arbol.getHijoIzquierdo())
            }

            if ((arbol.tieneHijoDerecho()) && (rta == null)){
                rta = buscarSubArbol(num, arbol.getHijoDerecho())
            }

        }

        return rta;
            
    }

    private boolean IsLeftTreeP(){}
    private integer contar(){}

}