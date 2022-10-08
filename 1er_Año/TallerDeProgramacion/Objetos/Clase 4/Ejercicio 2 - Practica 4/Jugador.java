
package Practica4;

public class Jugador extends Empleado {
    private int partidosJugados;
    private int goles;
    
    public Jugador (String nombre, double sueldoBasico, int antiguedad, int partidosJugados, int goles){
        super(nombre, sueldoBasico, antiguedad);
        this.partidosJugados = partidosJugados;
        this.goles = goles;
    }

    public int getPartidosJugados() {
        return partidosJugados;
    }

    public int getGoles() {
        return goles;
    }

    public void setPartidosJugados(int partidosJugados) {
        this.partidosJugados = partidosJugados;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }
    
    public double calcularEfectividad() {
	if(partidosJugados <= 0)
		return -1;
	return (double)goles / partidosJugados;
    }
    
    public double calcularSueldoACobrar (){
        double extra;
        
        if (this.calcularEfectividad() > 0.5){
            extra = this.getSueldoBasico();
        } else {
            extra = 0;
        }
        
        return super.calcularSueldoACobrar() + extra;  
    }
    
}
