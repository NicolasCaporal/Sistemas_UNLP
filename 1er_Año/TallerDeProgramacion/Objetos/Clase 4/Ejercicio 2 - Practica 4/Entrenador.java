
package Practica4;

public class Entrenador extends Empleado { 
    private int campeonatosGanados;

    public Entrenador (String nombre, double sueldoBasico, int antiguedad, int campeonatosGanados){
        super(nombre, sueldoBasico, antiguedad);
        this.campeonatosGanados = campeonatosGanados;
    }
    
    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }

   public double calcularEfectividad (){
       if (this.getAntiguedad() <= 0)
            return -1;
       return (double)campeonatosGanados / this.getAntiguedad();
   }
   
   public double calcularSueldoACobrar (){
       int extra = 0;
       if ((campeonatosGanados >= 1) && (campeonatosGanados <= 3)){
           extra = 5000;
       } else if ((campeonatosGanados >= 4) && (campeonatosGanados <= 10)){
           extra = 30000;
       } else if (campeonatosGanados > 10){
           extra = 50000;
       }
       
       return super.calcularSueldoACobrar() + extra;
       
   }
    
}
