package ar.edu.info.unlp.ejercicio07;

import java.time.LocalDate;
import java.util.List;


public class Archivo extends FileSystem {
    private int tamaño;

    public Archivo(String nombre, LocalDate fecha, int tamaño){
        super(nombre, fecha);
        this.tamaño = tamaño;
    }

    public int tamañoOcupado() {
        return this.tamaño;
    }

    public Archivo archivoMasGrande() {
        return this;
    }

    public Archivo archivoMasNuevo() {
        return this;
    }

    public FileSystem buscar(String nombre) {
        return this.getNombre().equals(nombre) ? this : null;
    }

    public void buscarTodos(String nombre, List<FileSystem> resultado) {
        if (this.getNombre().equals(nombre)){
            resultado.add(this);
        }
    }

    public String listadoContenido(String path) {
        return path + this.getNombre() + "\n";
    }
}
