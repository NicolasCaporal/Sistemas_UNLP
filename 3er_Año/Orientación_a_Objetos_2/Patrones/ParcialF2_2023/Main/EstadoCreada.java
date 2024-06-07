public class EstadoCreada{
   
    @Override
    public void iniciar(TareaSimple tarea){
        this.tarea.setState(new EstadoIniciada);
    }


}