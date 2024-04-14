package ar.edu.info.unlp.ejercicio04;

public class EmpleadoPasante extends Empleado {
    private int cantExamenesRendidos;

    public EmpleadoPasante(int cantHijos, boolean casado, int cantExamenesRendidos){
        super(cantHijos, casado);
        this.cantExamenesRendidos = cantExamenesRendidos;
    }

    @Override
    public double basico() {
        return 20000;
    }

    public double adicional(){
        return 2000 * this.cantExamenesRendidos;
    }
}
