package Practica4;

public class VisorFiguras {
    private int guardadas;
    private int capacidadMaxima;
    private Figura [] vector;
    
    public VisorFiguras () {
        capacidadMaxima = 5;
        guardadas = 0;
        vector = new Figura [capacidadMaxima];
    }
    
    public void guardar (Figura f){
        if (guardadas < capacidadMaxima){
            vector[guardadas] = f;
            guardadas++;
        } 
    }
    
    public boolean quedaEspacio() {
        return !(guardadas == capacidadMaxima);
    }
    
    public void mostrar (){
        for (int i = 0; i < guardadas; i++){
            System.out.println(vector[i].toString());
        }
    }
    
    public int getGuardadas (){
        return guardadas;
    }
}
