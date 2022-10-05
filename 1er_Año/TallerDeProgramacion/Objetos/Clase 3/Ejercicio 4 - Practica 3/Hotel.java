
package Practica3;

import PaqueteLectura.GeneradorAleatorio;

public class Hotel {
    private Habitacion [] habitaciones;
    private int dimF;
    
    public Hotel (int N){
        GeneradorAleatorio.iniciar();
        dimF = N;
        habitaciones = new Habitacion [dimF];
        for (int i = 0; i < dimF; i++){
            habitaciones[i] = new Habitacion();
            habitaciones[i].setOcupada(false);
            habitaciones[i].setCostoPorNoche(GeneradorAleatorio.generarDouble(6000)+2000);
        }
    }
    
    public void insertarCliente (Cliente c, int X){
        habitaciones[X].setCliente(c);
        habitaciones[X].setOcupada(true);
    } 
    
    public void aumentarCosto (double aumento){
        for (int i = 0; i < dimF; i++){
            double actual = habitaciones[i].getCostoPorNoche();
            habitaciones[i].setCostoPorNoche(actual + aumento);
        }
    }
    
    public String toString (){
        String info = "";
        for (int i = 0; i < dimF; i++){
            // if (habitaciones[i].getCliente() != null)
            info = info + "Habitacion " + (i+1) + ": " + habitaciones[i].toString() + "\n";
        }
        return info;
    }
    
    public int getDimF (){
        return dimF;
    }
    
}
