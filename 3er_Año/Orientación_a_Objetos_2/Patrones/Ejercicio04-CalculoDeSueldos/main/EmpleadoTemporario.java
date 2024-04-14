package ar.edu.info.unlp.ejercicio04;

public class EmpleadoTemporario extends Empleado {
    private int cantHoras;

    public EmpleadoTemporario(int cantHijos, boolean casado, int cantHoras){
        super(cantHijos, casado);
        this.cantHoras = cantHoras;
    }

    @Override
    public double basico() {
        return 20000 + (this.cantHoras * 300);
    }

    public double adicional(){
        double adicionalPorHijos = this.getCantHijos() * 2000;
        return this.isCasado() ? adicionalPorHijos + 5000 : adicionalPorHijos;
    }
}
