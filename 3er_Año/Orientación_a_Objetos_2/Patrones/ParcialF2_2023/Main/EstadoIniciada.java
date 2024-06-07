public class EstadoIniciada{
   
    public EstadoIniciada(TareaSimple tarea){
        this.tarea.setInicio(System.out.currentTimeMillis());
    }

    @Override
    public void completar(TareaSimple tarea){
        this.tarea.setState(new EstadoCompletada);
    }

}