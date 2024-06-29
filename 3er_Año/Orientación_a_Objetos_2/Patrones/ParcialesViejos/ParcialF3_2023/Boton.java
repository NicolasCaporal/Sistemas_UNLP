public class Boton implements Componente {
    private String texto;
    private String referencia;
    private String estilo;

    public void aplicarEstilo(ConfiguracionEstilo conf){
        this.estilo = conf.getEstiloBoton();
    }

    public String imprimir(){
        return "<boton estilo=" + this.estilo + "texto=" + this.texto + " accion=" + this.referencia + "</Boton>";
    }

}
