public class TareaSimple{

    private String nombre;
    private int duracionEstimada;
    private int tiempoInicio;
    private int tiempoFin;
    private State state;

    public TareaSimple(String nombre, int duracion, String descripcion){
        super(descripcion);
        this.nombre = nombre;
        this.duracion = duracion;
        this.state = new EstadoCreada();
    }

    public void iniciar(){
        this.state.iniciar();
    }

    public void completar(){
        this.state.iniciar();
    }

    public double getDuracion(){
        return this.duracionEstimada;
    }

    public int tiempoUtilizado(){
        return this.state.tiempoUtilizado;
    }

    protected setInicio(int inicio){
        this.tiempoInicio = inicio;
    }

    protected setFin(int fin){
        this.fin = fin;
    }

    protected setState(State state){
        this.state = state;
    }

    protected int getInicio(){
        return this.tiempoInicio;
    }

    protected int getFin(){
        return this.tiempoFin;
    }

}