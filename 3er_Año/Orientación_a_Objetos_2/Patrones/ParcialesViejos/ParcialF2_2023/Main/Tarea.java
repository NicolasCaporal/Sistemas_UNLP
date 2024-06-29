public abstract class Tarea {

    private String descripcion;

    public Tarea(String descripcion){
        this.descripcion = descripcion;
    }

    public abstract iniciar();

    public abstract completar();

    public abstract int getDuracion();

    public abstract int tiempoUtilizado();

    public int avanceTarea(){
        return this.tiempoUtilizado() / this.getDuracion();
    }

}