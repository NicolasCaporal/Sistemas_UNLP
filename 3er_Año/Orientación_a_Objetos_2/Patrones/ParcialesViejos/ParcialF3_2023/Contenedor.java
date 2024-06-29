import java.util.List;

public class Contenedor implements Componente {
    private List<Componente> contenido;

    public Contenedor(List<Componente> contenido) {
        this.contenido = contenido;
    }

    @Override
    public void aplicarEstilo(ConfiguracionEstilo conf) {
        contenido.stream()
                 .forEach(componente -> componente.aplicarEstilo(conf));
    }

    @Override
    public String imprimir() {
        String resultado = "<contenedor>";
        for (Componente componente : contenido) {
            resultado += componente.imprimir();
        }
        resultado += "</contenedor>";
        return resultado;
    }

}
