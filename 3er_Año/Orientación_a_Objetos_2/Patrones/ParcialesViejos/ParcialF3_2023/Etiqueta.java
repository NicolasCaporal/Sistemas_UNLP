public class Etiqueta implements Componente {
    private String texto;
    private String referencia;
    private String estilo;

    public void aplicarEstilo(ConfiguracionEstilo conf){
        this.estilo = conf.getEstiloEtiqueta();
    }

    public String imprimir(){
        return "<etiqueta estilo=" + this.estilo + "texto=" + this.texto + " accion=" + this.referencia + "</Etiqueta>";
    }

}
