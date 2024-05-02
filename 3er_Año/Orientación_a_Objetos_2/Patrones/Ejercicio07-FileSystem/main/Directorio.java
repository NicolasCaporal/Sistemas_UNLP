package ar.edu.info.unlp.ejercicio07;

import java.io.File;
import java.time.LocalDate;
import java.util.List;
import java.util.ArrayList;


public class Directorio extends FileSystem{
    private List<FileSystem> contenido;

    public Directorio(String nombre, LocalDate fecha){
        super(nombre, fecha);
        this.contenido = new ArrayList<FileSystem>();
    }

    public void agregar(FileSystem nuevo){
        this.contenido.add(nuevo);
    }

    public int tamañoOcupado() {
        return 32000 + this.contenido.stream().mapToInt(file -> file.tamañoOcupado()).sum();
    }

    public Archivo archivoMasGrande() {
        return this.contenido.stream()
                .map(f -> f.archivoMasGrande())
                .max((f1, f2) -> Integer.compare(f1.tamañoOcupado(), f2.tamañoOcupado()))
                .orElse(null);
    }

    public Archivo archivoMasNuevo() {
        return this.contenido.stream()
                .map(f -> f.archivoMasNuevo())
                .max((f1, f2) -> f1.getFechaCreacion().compareTo(f2.getFechaCreacion()))
                .orElse(null);
    }

    public FileSystem buscar(String nombre) {
        FileSystem file;
        if (this.getNombre().equals(nombre)){
            file = this;
        } else {
            file = this.contenido.stream().filter(f -> f.getNombre().equals(nombre)).findFirst().orElse(null);
        }
        return file;
    }

    public void buscarTodos(String nombre, List<FileSystem> resultado) {
        if (this.getNombre().equals(nombre)){
            resultado.add(this);
        }
        this.contenido.stream().forEach(f -> f.buscarTodos(nombre, resultado));
    }

    // No podía, este método lo hizo chatGOAT
    public String listadoContenido(String path) {
        StringBuilder resultado = new StringBuilder();
        resultado.append(path + this.getNombre() +"\n"); //Lo unico que agregué yo es esta linea porque soy buenisimo
        this.contenido.stream().forEach(f -> resultado.append(f.listadoContenido(this.getNombre())));
        return resultado.toString();
    }
}
