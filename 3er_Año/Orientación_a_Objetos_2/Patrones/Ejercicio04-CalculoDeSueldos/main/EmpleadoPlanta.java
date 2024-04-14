package ar.edu.info.unlp.ejercicio04;

public class EmpleadoPlanta extends Empleado {
    private int antiguedad;

    public EmpleadoPlanta(int cantHijos, boolean casado, int antiguedad){
        super(cantHijos, casado);
        this.antiguedad = antiguedad;
    }

    @Override
    public double basico() {
        return 50000;
    }

    public double adicional(){
        int adicionalPorCasado = 0;
        if (this.isCasado()){ adicionalPorCasado = 5000; }
        return adicionalPorCasado + this.getCantHijos() * 2000 + this.antiguedad * 2000;
    }
}
