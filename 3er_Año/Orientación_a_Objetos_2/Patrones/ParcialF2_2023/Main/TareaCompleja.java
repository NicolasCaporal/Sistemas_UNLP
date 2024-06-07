public class TareaCompleja{

    private List<Tarea> tareas;

    public TareaCompleja(String description){
        super(descripcion);
        this.tareas = new ArrayList<Tarea>();
    }

    public List<Tarea> getTareas(){
        return new ArrayList<>(this.tareas);
    }

    public void addTarea(){
        this.tareas.add(tarea);
    }

    public void iniciar(){
        this.tareas.stream().forEach(tarea -> tarea.iniciar());
    }

    public void completar(){
        this.tareas.stream().forEach(tarea -> tarea.completar());
    }

    public int getDuracion(){
        this.tareas.stream().mapToInt(tarea -> tarea.getDuracion()).sum()
    }

    public int tiempoUtilizado(){
        this.tareas.stream().mapToInt(tarea -> tarea.tiempoUtilizado()).sum()
    }

}