package ar.edu.info.unlp.ejercicio07;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


public abstract class FileSystem {
	private String nombre;
	private LocalDate fechaDeCreacion;

	public FileSystem(String nombre, LocalDate fecha){
		this.nombre = "/" + nombre;
		this.fechaDeCreacion = fecha;
	}

	public abstract int tamañoOcupado();

	public abstract Archivo archivoMasGrande();

	public abstract Archivo archivoMasNuevo();

	public abstract FileSystem buscar(String nombre);

	public ArrayList<FileSystem> buscarTodos(String nombre){
		ArrayList<FileSystem> resultado = new ArrayList<FileSystem>();
		this.buscarTodos(nombre, resultado);
		return resultado;
	};

	public abstract void buscarTodos(String nombre, List<FileSystem> resultado);

	public abstract String listadoContenido(String nombre);

	public LocalDate getFechaCreacion(){
		return this.fechaDeCreacion;
	}

	public String getNombre(){
		return this.nombre;
	}
}
