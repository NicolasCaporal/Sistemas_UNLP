public class EstadoIniciada{
   
    public EstadoIniciada(TareaSimple tarea){
        tarea.setInicio(System.out.currentTimeMillis());
    }

    @Override
    public void completar(TareaSimple tarea){
        tarea.setState(new EstadoCompletada);
    }

}