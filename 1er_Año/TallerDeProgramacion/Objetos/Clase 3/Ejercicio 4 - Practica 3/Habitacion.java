
package Practica3;

public class Habitacion {
    private double costo;
    private boolean ocupada;
    private Cliente cliente;
    
    public Habitacion () { }
    
    public Habitacion (double costo, boolean ocupada, Cliente cliente){
        this.costo = costo;
        this.ocupada = ocupada;
        
        if (!ocupada){
            this.cliente = cliente;
        }
    } 
    
    
    public double getCostoPorNoche (){
        return costo;
    }
    
    public void setCostoPorNoche(double costo){
        this.costo = costo;
    }
    
    public boolean getOcupada (){
        return ocupada;
    }
    
    public void setOcupada (boolean ocupada){
        this.ocupada = ocupada;
    }
    
    public Cliente getCliente (){
        return cliente;
    }
    
    public void setCliente (Cliente cliente){
        this.cliente = cliente;
    }
    
    public String toString (){
        if (ocupada){
            return "Costo: " + this.costo + ", Ocupada: " + this.ocupada + ", Cliente: " + cliente.toString();
        } else {
            return "Costo: " + this.costo + ", Ocupada: " + this.ocupada;
        }
    }
}
    

