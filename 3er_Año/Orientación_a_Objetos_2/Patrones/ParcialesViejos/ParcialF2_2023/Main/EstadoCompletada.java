public class EstadoCompletada{
   
    public EstadoCompletada(TareaSimple tarea){
        tarea.setFin(System.out.currentTimeMillis());
    }

    @Override
    public int tiempoUtilizado(TareaSimple tarea){
        return tarea.getFin() - tarea.getInicio();
    }

}