public class AdapterListaDesplegable implements Componente{
    private ListaDesplegable lista;

    public void aplicarEstilo(ConfiguracionEstilo conf){
        this.lista.setStyle(conf.getEstiloEtiqueta());
    }

    public String imprimir(){
        return this.lista.print();
    }

}